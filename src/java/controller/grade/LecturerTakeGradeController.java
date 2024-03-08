/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.grade;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.AssessmentDBContext;
import dal.GradeDBContext;
import dal.GradeItemTakenDBContext;
import dal.GroupDBContext;
import dal.TermDBContext;
import entity.Account;
import entity.Assessment;
import entity.Grade;
import entity.GradeItemTaken;
import entity.Group;
import entity.Role;
import entity.Term;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class LecturerTakeGradeController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        String gid = req.getParameter("gid");
        String assid = req.getParameter("assid");
        GroupDBContext gdb = new GroupDBContext();
        GradeDBContext grDB = new GradeDBContext();
        GradeItemTakenDBContext takenDB = new GradeItemTakenDBContext();
        ArrayList<Grade> grades = grDB.getGradesForLecturer(lid, Integer.parseInt(gid), Integer.parseInt(assid));
        for (Grade grade : grades) {
            String sid = grade.getStudent().getSid();
            String raw_score = req.getParameter("grade" + sid + "&" + gid + "&" + assid);
            String des = req.getParameter("des" + sid + "&" + gid + "&" + assid);
            if (!grDB.checkIstakenGrade(sid, Integer.parseInt(gid), Integer.parseInt(assid))) {
                if (raw_score.isBlank()) { 
                }else{
                    grDB.insertNewGrade(sid, Integer.parseInt(gid), Integer.parseInt(assid), raw_score, des);
                }
            } else {
                grDB.updateNewGrade(sid, Integer.parseInt(gid), Integer.parseInt(assid), raw_score, des);
            }
        }
        Group g = gdb.getGroupByGid(Integer.parseInt(gid));
        ArrayList<GradeItemTaken> takens = takenDB.getGradeItemTakens(g);
        Boolean check = false;
        for (GradeItemTaken taken : takens) {
            if (taken.getAssessment().getAssid()==Integer.parseInt(assid)&&taken.isIsTaken()) {
                check = true;
            }
        }
        if (!check) {
            takenDB.insertNewGradeItemTaken(Integer.parseInt(gid), Integer.parseInt(assid));
        }
        
        resp.sendRedirect("takegrade?id=" + lid + "&gid=" + gid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        String gid = req.getParameter("gid");
        String assid = req.getParameter("assid");
        GradeItemTakenDBContext takenDB = new GradeItemTakenDBContext();
        GroupDBContext gdb = new GroupDBContext();
        TermDBContext tdb = new TermDBContext();
        Term currentTerm = tdb.getCurrentTerm();
        AssessmentDBContext assDB = new AssessmentDBContext();
        ArrayList<Group> groups = gdb.getGroupsByLID(lid, currentTerm.getTid());
        GradeDBContext grDB = new GradeDBContext();
        if (gid != null) {
            Group g = gdb.getGroupByGid(Integer.parseInt(gid));
            ArrayList<GradeItemTaken> takens = takenDB.getGradeItemTakens(g);
            req.setAttribute("takens", takens);
        }
        if (assid != null) {
            ArrayList<Grade> grades = grDB.getGradesForLecturer(lid, Integer.parseInt(gid), Integer.parseInt(assid));
            req.setAttribute("assid", assid);
            req.setAttribute("grades", grades);
        }
        req.setAttribute("gid", gid);
        req.setAttribute("lid", lid);
        req.setAttribute("groups", groups);
        req.getRequestDispatcher("view/mark/takemark.jsp").forward(req, resp);
    }

}

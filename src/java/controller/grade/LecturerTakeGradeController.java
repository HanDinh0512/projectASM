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
import dal.LecturerDBContext;
import dal.TermDBContext;
import entity.Account;
import entity.Assessment;
import entity.Grade;
import entity.GradeItemTaken;
import entity.Group;
import entity.Role;
import entity.Student;
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, lid)) {
            String gid = req.getParameter("gid");
            GradeDBContext grDB = new GradeDBContext();
            GroupDBContext gdb = new GroupDBContext();
            Group group = gdb.getGroupByGid(Integer.parseInt(gid));
            AssessmentDBContext assDB = new AssessmentDBContext();
            ArrayList<Assessment> asses = assDB.getAssessmentsBySub(group.getSubject().getSubname());
            ArrayList<Student> students = gdb.getStudents(Integer.parseInt(gid));
            for (Assessment ass : asses) {
                for (Student student : students) {
                    String raw_score = req.getParameter("grade" + student.getSid() + "&" + gid + "&" + ass.getAssid());
                    if (!grDB.checkIstakenGrade(student.getSid(), Integer.parseInt(gid), ass.getAssid())) {
                        if (raw_score.isBlank()||raw_score.isEmpty()) {
                            
                        }else{
                            grDB.insertNewGrade(student.getSid(), Integer.parseInt(gid), ass.getAssid(), raw_score);
                        }
                    } else{
                        grDB.updateNewGrade(student.getSid(), Integer.parseInt(gid), ass.getAssid(), raw_score);
                    }
                }
            }
            resp.sendRedirect("takegrade?id=" + lid + "&gid=" + gid);
        } else {
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, lid)) {
            String gid = req.getParameter("gid");
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
                ArrayList<Grade> grades = grDB.getGradesForLecturer(lid, Integer.parseInt(gid));
                req.setAttribute("grades", grades);
                ArrayList<Student> students = gdb.getStudents(Integer.parseInt(gid));
                req.setAttribute("students", students);
            }
            req.setAttribute("gid", gid);
            req.setAttribute("lid", lid);
            req.setAttribute("groups", groups);
            req.getRequestDispatcher("view/mark/takemark.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.grade;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.AssessmentDBContext;
import dal.GradeItemTakenDBContext;
import dal.GroupDBContext;
import dal.TermDBContext;
import entity.Account;
import entity.Assessment;
import entity.GradeItemTaken;
import entity.Group;
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
public class LecturerTakeGradeController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String lid = req.getParameter("id");
        String gid = req.getParameter("gid");
        GradeItemTakenDBContext takenDB = new GradeItemTakenDBContext();
        GroupDBContext gdb = new GroupDBContext();
        TermDBContext tdb = new TermDBContext();
        Term currentTerm = tdb.getCurrentTerm();
        AssessmentDBContext assDB = new AssessmentDBContext();
        ArrayList<Group> groups = gdb.getGroupsByLID(lid, currentTerm.getTid());
        if (gid!=null) {
            Group g = gdb.getGroupByGid(Integer.parseInt(gid));
            ArrayList<GradeItemTaken> takens = takenDB.getGradeItemTakens(g);
            req.setAttribute("takens", takens);
        }
        req.setAttribute("lid", lid);
        req.setAttribute("groups", groups);
        req.getRequestDispatcher("view/mark/takemark.jsp").forward(req, resp);
    }
   
    
}

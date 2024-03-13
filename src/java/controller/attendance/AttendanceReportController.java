/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance;

import controller.authentication.authorization.BaseRBACController;
import dal.AttendanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.SubjectDBContext;
import dal.TermDBContext;
import dal.TotalCourseDBContext;
import entity.Account;
import entity.Attendance;
import entity.Grade;
import entity.Role;
import entity.Subject;
import entity.Term;
import entity.TotalCourse;
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
public class AttendanceReportController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String sid = req.getParameter("id");
        StudentDBContext stdb = new StudentDBContext();
        if (stdb.checkStudentIDByAccount(account, sid)) {
            String termid = req.getParameter("term");
            String subid = req.getParameter("subid");
            TermDBContext tdb = new TermDBContext();
            ArrayList<Term> term = tdb.getTerm(sid);
            ArrayList<Subject> subjects = new ArrayList<>();
            SubjectDBContext sdb = new SubjectDBContext();
            AttendanceDBContext attdb = new AttendanceDBContext();
            if (termid != null) {
                subjects = sdb.getSubjects(sid, termid);
                req.setAttribute("termid", termid);
            }
            if (subid != null) {
                ArrayList<Attendance> atts = attdb.getAttendancesForView(sid, subid, termid);
                int countAbsent = attdb.countAbsent(sid, atts.get(0).getSes().getGroup());
                SessionDBContext sesdb = new SessionDBContext();
                int totalSes = sesdb.countSession(atts.get(0).getSes().getGroup());
                Float absentPercent = (float) countAbsent / totalSes * 100;
                req.setAttribute("atts", atts);
                req.setAttribute("countAbsent", countAbsent);
                req.setAttribute("totalSes", totalSes);
                req.setAttribute("absentPercent", absentPercent.intValue());
                req.setAttribute("subid", subid);
            }

            req.setAttribute("sid", sid);
            req.setAttribute("term", term);
            req.setAttribute("subjects", subjects);
            req.getRequestDispatcher("view/attendance/viewattend.jsp").forward(req, resp);
        }else{
            req.getRequestDispatcher("view/studentaccessdenied.jsp").forward(req, resp);
        }
    }

}

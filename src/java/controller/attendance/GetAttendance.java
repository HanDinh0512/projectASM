/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.AttendanceDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.TotalCourseDBContext;
import entity.Account;
import entity.Attendance;
import entity.Group;
import entity.Role;
import entity.Session;
import entity.Student;
import entity.Subject;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class GetAttendance extends BaseRBACController {

    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() {
        host = getServletContext().getInitParameter("host");
        port = getServletContext().getInitParameter("port");
        user = getServletContext().getInitParameter("user");
        pass = getServletContext().getInitParameter("pass");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        SessionDBContext sesDB = new SessionDBContext();
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, sesDB.getLecturerID(sesid))) {
            String date = req.getParameter("date");
            String slot = req.getParameter("slot");
            String subject = req.getParameter("sub");
            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> atts = new ArrayList<>();
            ArrayList<Student> students = sesDB.getStudentBySesID(sesid);
            Session ses = new Session();
            ses.setSesid(sesid);
            Subject sub = new Subject();
            sub.setSubname(subject);
            Group g = new Group();
            g.setSubject(sub);
            g.setGid(sesDB.getGroupBySesID(sesid));
            ses.setGroup(g);
            for (Student student : students) {
                Attendance a = new Attendance();
                a.setSes(ses);
                a.setIsPresent(req.getParameter("present" + student.getSid()).equals("yes"));
                a.setDescription(req.getParameter("description" + student.getSid()));
                a.setStudent(student);
                atts.add(a);
            }
            if (sesDB.checkIsTakenBySesID(sesid)) {
                ArrayList<Attendance> attendances = attDB.getAttendancesForLecturer(sesid);
                for (Attendance attendance : attendances) {
                    Attendance newAtt = getAttBySid(attendance.getStudent().getSid(), atts, sesid);
                    if (!attendance.getDescription().equals(newAtt.getDescription()) || attendance.isIsPresent() != newAtt.isIsPresent()) {
                        attDB.updateAttendance(sesid, attendance.getStudent().getSid(), newAtt);
                        if (!newAtt.isIsPresent()) {
                            String s = subject;
                            String content = "You have been absent from the course " + s + " in the slot " + slot + " of the day " + date;
                            int countAbsent = attDB.countAbsent(attendance.getStudent().getSid(), attendance.getSes().getGroup());
                            int totalSes = sesDB.countSession(attendance.getSes().getGroup());
                            if (countAbsent / totalSes <= 0.2) {
                                content += "\nYou have missed " + countAbsent + " slots out of a total of " + totalSes + " class sessions for the subject " + s + ", you should pay more attention to attending class.\n"
                                        + "If you miss more than 20% of the classes, you will not pass this subject!";
                            } else {
                                content += "\nYou not pass this subject because you missed more than 20% of the class sessions.";
                                TotalCourseDBContext tcdb = new TotalCourseDBContext();
                                tcdb.changeStatusByAbsent(attendance.getStudent().getSid(), s, "SP24");
                            }
                            try {
                                EmailUtility.sendEmail(host, port, user, pass, newAtt.getStudent().getEmail(), subject, content);
                            } catch (MessagingException ex) {
                                Logger.getLogger(GetAttendance.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                }
            } else {
                attDB.takeAttendance(sesid, atts);
                for (Attendance att : atts) {
                    if (!att.isIsPresent()) {
                        String s = subject;
                        String content = "You have been absent from the course" + s + "in the slot" + slot + "of the day" + date;
                        int countAbsent = attDB.countAbsent(s, att.getSes().getGroup());
                        int totalSes = sesDB.countSession(att.getSes().getGroup());
                        if (countAbsent / totalSes <= 0.2) {
                            content += "\nYou have missed " + countAbsent + " slots out of a total of " + totalSes + " class sessions for the subject " + s + ", you should pay more attention to attending class.\n"
                                    + "If you miss more than 20% of the classes, you will not pass this subject!";
                        } else {
                            content += "\nYou not pass this subject because you missed more than 20% of the class sessions.";
                            TotalCourseDBContext tcdb = new TotalCourseDBContext();
                            tcdb.changeStatusByAbsent(att.getStudent().getSid(), s, "SP24");
                        }
                        try {
                            EmailUtility.sendEmail(host, port, user, pass, att.getStudent().getEmail(), subject, content);
                        } catch (MessagingException ex) {
                            Logger.getLogger(GetAttendance.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }
            ArrayList<Attendance> attendances = attDB.getAttendancesForLecturer(sesid);
            req.setAttribute("id", sesid);
            req.setAttribute("date", date);
            req.setAttribute("slot", slot);
            req.setAttribute("sub", subject);
            req.setAttribute("atts", attendances);
            req.getRequestDispatcher("view/attendance/takeattendance.jsp").forward(req, resp);    
        }else{
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        SessionDBContext sesDB = new SessionDBContext();
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, sesDB.getLecturerID(sesid))) {
            String date = req.getParameter("date");
            String slot = req.getParameter("slot");
            String subject = req.getParameter("sub");
            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> attendances = attDB.getAttendancesForLecturer(sesid);
            req.setAttribute("id", sesid);
            req.setAttribute("date", date);
            req.setAttribute("slot", slot);
            req.setAttribute("sub", subject);
            req.setAttribute("atts", attendances);
            req.setAttribute("test", attendances.size());
            req.getRequestDispatcher("view/attendance/takeattendance.jsp").forward(req, resp);
            
        }else{
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }
    }

    public Attendance getAttBySid(String sid, ArrayList<Attendance> atts, int sesid) {
        for (Attendance att : atts) {
            if (att.getStudent().getSid().equals(sid) && att.getSes().getSesid() == sesid) {
                return att;
            }
        }
        return null;
    }
}

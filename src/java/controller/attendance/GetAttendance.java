/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.attendance;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.AttendanceDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Attendance;
import entity.Role;
import entity.Session;
import entity.Student;
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
public class GetAttendance extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        AttendanceDBContext attDB = new AttendanceDBContext();
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Attendance> atts = new ArrayList<>();
        ArrayList<Student> students = sesDB.getStudentBySesID(sesid);
        Session ses = new Session();
        ses.setSesid(sesid);
        for (Student student : students) {
            Attendance a = new Attendance();
            a.setSes(ses);
            a.setIsPresent(req.getParameter("present"+student.getSid()).equals("yes"));
            a.setDescription(req.getParameter("description"+student.getSid()));
            a.setStudent(student);
            atts.add(a);
        }
        if (sesDB.checkIsTakenBySesID(sesid)) {
            ArrayList<Attendance> attendances = attDB.getAttendancesForLecturer(sesid);
            for (Attendance attendance : attendances) {
                Attendance newAtt = getAttBySid(attendance.getStudent().getSid(), atts,sesid);
                if (!attendance.getDescription().equals(newAtt.getDescription())||attendance.isIsPresent()!=newAtt.isIsPresent()) {
                    attDB.updateAttendance(sesid, attendance.getStudent().getSid(), newAtt);
                }
            }
        }else{
            attDB.takeAttendance(sesid, atts);
        }
        resp.sendRedirect("attendance?id="+sesid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        AttendanceDBContext attDB = new AttendanceDBContext();
        ArrayList<Attendance> attendances = attDB.getAttendancesForLecturer(sesid);
        req.setAttribute("atts", attendances);
        req.setAttribute("test", attendances.size());
        req.getRequestDispatcher("view/attendance/takeattendance.jsp").forward(req, resp);
    }
    
    public Attendance getAttBySid(String sid, ArrayList<Attendance> atts, int sesid){
        for (Attendance att : atts) {
            if(att.getStudent().getSid().equals(sid)&&att.getSes().getSesid()==sesid){
                return att;
            }
        }
        return null;
    }
} 

   

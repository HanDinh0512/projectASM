/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.attendance;

import controller.authentication.authorization.BaseRBACController;
import dal.AttendanceDBContext;
import dal.GroupDBContext;
import entity.Account;
import entity.Attendance;
import entity.Group;
import entity.Role;
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
public class AttendanceLecturerController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        GroupDBContext grDB = new GroupDBContext();
        AttendanceDBContext adb = new AttendanceDBContext();
        ArrayList<Group> groups = grDB.getGroupsByLID(lid, "SP24");
        String rawgid = req.getParameter("gid");
        ArrayList<Integer> slots = new ArrayList<>();
        int gid ;
        if (rawgid!=null) {
            gid = Integer.parseInt(rawgid);
            ArrayList<Student> students = grDB.getStudents(gid);
            for (Student student : students) {
                ArrayList<Attendance> attendances = adb.getAttendancesforLecturer(lid, gid, student.getSid());
                student.setAttendances(attendances);
            }
            for (int i = 1; i < 31; i++) {
                slots.add(i);
            }
            req.setAttribute("students", students);
            req.setAttribute("slots", slots);
            req.setAttribute("gid", gid);
            
        }
        req.setAttribute("groups", groups);
        req.setAttribute("lid", lid);
        
        req.getRequestDispatcher("view/attendance/attendancelecturer.jsp").forward(req, resp);
        
        
    }
   
}

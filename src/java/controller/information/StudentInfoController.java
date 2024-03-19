/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.information;

import controller.authentication.authorization.BaseRBACController;
import dal.StudentDBContext;
import entity.Account;
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
public class StudentInfoController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String sid = req.getParameter("id");
        StudentDBContext sdb = new StudentDBContext();
        if (sdb.checkStudentIDByAccount(account, sid)) {
            
            Student student = sdb.getStudentInfo(sid);
            req.setAttribute("student", student);
            req.getRequestDispatcher("view/information/studentinformation.jsp").forward(req, resp);
        }else{
            req.getRequestDispatcher("view/studentaccessdenied.jsp").forward(req, resp);
        }
    }
  
}

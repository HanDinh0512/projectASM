/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.information;

import controller.authentication.authorization.BaseRBACController;
import dal.LecturerDBContext;
import entity.Account;
import entity.Lecturer;
import entity.Role;
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
public class LecturerInfoController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid =req.getParameter("id");
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, lid)) {
            
            Lecturer lecturer = ldb.getLecturerInfor(lid);
            req.setAttribute("lecturer", lecturer);
            req.getRequestDispatcher("view/information/lecturerinformation.jsp").forward(req, resp);
        }else{
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }
    }
   
}

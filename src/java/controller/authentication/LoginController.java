/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import dal.AccountDBContext;
import dal.LecturerDBContext;
import dal.RoleDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author admin
 */
public class LoginController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LecturerDBContext ldb =  new LecturerDBContext();
        StudentDBContext sdb = new StudentDBContext();
        AccountDBContext db = new AccountDBContext();
        Account account = db.getByUsernamePassword(username, password);
        RoleDBContext rdb = new RoleDBContext();
        Role r = rdb.getRole(username, password);
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            //session.setAttribute("password", pass);
//            Cookie c_user = new Cookie("username", username);
//            Cookie c_pass = new Cookie("password", password);
//            c_user.setMaxAge(3600*24*7);
//            c_pass.setMaxAge(3600*24*7);
//            response.addCookie(c_pass);
//            response.addCookie(c_user);
            
            if (r.getName().equals("student")) {
                session.setAttribute("lid", ldb.getLecturerID(account));
                response.sendRedirect(request.getContextPath()+"/studenthome");
                //request.getRequestDispatcher("view/home/studenthome.jsp").forward(request, response);
                //response.getWriter().println("student");
            }
            else{
                session.setAttribute("sid", sdb.getStudentID(account));
                response.sendRedirect(request.getContextPath()+"/lecturerhome");
                //response.getWriter().println("lecturer");
            }
            
            
        } else {
            response.getWriter().println("login failed");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

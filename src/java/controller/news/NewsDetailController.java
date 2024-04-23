/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.news;

import controller.authentication.authorization.BaseRBACController;
import dal.NewsDBContext;
import entity.Account;
import entity.News;
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
public class NewsDetailController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        NewsDBContext ndb = new NewsDBContext();
        News n = ndb.getNewsByID(id);
        req.setAttribute("n", n);
        req.getRequestDispatcher("view/news/newdetail.jsp").forward(req, resp);
    }
   

}

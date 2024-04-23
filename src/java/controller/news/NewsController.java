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
public class NewsController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String rawpage = req.getParameter("page");
        NewsDBContext ndb = new NewsDBContext();
        int page = 1;
        if (rawpage!=null) {
            page = Integer.parseInt(rawpage);
        }
        ArrayList<News> allnews = ndb.getNews();
        ArrayList<News> news = new ArrayList<>();
        for (int i = (page-1)*3; i < page*3; i++) {
            news.add(allnews.get(i));
        }
        int total = Math.floorDiv(allnews.size(), 3);
        req.setAttribute("news", news);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPage", total);
        req.getRequestDispatcher("view/news/news.jsp").forward(req, resp);
    }
   
    
}

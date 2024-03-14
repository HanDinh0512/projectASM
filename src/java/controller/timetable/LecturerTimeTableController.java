/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.timetable;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Role;
import entity.Session;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class LecturerTimeTableController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, lid)) {
            String raw_from = req.getParameter("from");
            String raw_to = req.getParameter("to");
            java.sql.Date from = null;
            java.sql.Date to = null;

            Date today = new Date();
            if (raw_from == null) {
                from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(today));
            } else {
                from = java.sql.Date.valueOf(raw_from);
            }

            if (raw_to == null) {
                to = DateTimeHelper.convertUtilDateToSqlDate(
                        DateTimeHelper.addDaysToDate(DateTimeHelper.getWeekStart(today), 6));
            } else {
                to = java.sql.Date.valueOf(raw_to);
            }

            ArrayList<java.sql.Date> dates = DateTimeHelper.getListBetween(
                    DateTimeHelper.convertSqlDateToUtilDate(from),
                    DateTimeHelper.convertSqlDateToUtilDate(to));
            TimeSlotDBContext timeDB = new TimeSlotDBContext();
            ArrayList<TimeSlot> slots = timeDB.list();
            SessionDBContext sesDB = new SessionDBContext();
            ArrayList<Session> sessions = sesDB.getSessionsByLid(lid, from, to);

            req.setAttribute("slots", slots);
            req.setAttribute("dates", dates);
            req.setAttribute("from", from);
            req.setAttribute("to", to);
            req.setAttribute("sessions", sessions);
            req.setAttribute("test", sessions.size());

            req.getRequestDispatcher("view/timetable/lecturertimetable.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        LecturerDBContext ldb = new LecturerDBContext();
        if (ldb.checkLecturerIDByAccount(account, lid)) {
            String raw_from = req.getParameter("from");
            String raw_to = req.getParameter("to");
            java.sql.Date from = null;
            java.sql.Date to = null;

            Date today = new Date();
            if (raw_from == null) {
                from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(today));
            } else {
                from = java.sql.Date.valueOf(raw_from);
            }

            if (raw_to == null) {
                to = DateTimeHelper.convertUtilDateToSqlDate(
                        DateTimeHelper.addDaysToDate(DateTimeHelper.getWeekStart(today), 6));
            } else {
                to = java.sql.Date.valueOf(raw_to);
            }

            ArrayList<java.sql.Date> dates = DateTimeHelper.getListBetween(
                    DateTimeHelper.convertSqlDateToUtilDate(from),
                    DateTimeHelper.convertSqlDateToUtilDate(to));
            TimeSlotDBContext timeDB = new TimeSlotDBContext();
            ArrayList<TimeSlot> slots = timeDB.list();
            SessionDBContext sesDB = new SessionDBContext();
            ArrayList<Session> sessions = sesDB.getSessionsByLid(lid, from, to);

            req.setAttribute("slots", slots);
            req.setAttribute("dates", dates);
            req.setAttribute("from", from);
            req.setAttribute("to", to);
            req.setAttribute("sessions", sessions);
            req.setAttribute("test", sessions.size());

            req.getRequestDispatcher("view/timetable/lecturertimetable.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("view/lectureraccessdenied.jsp").forward(req, resp);
        }

    }

}

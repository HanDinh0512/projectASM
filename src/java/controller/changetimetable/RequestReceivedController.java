/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.changetimetable;

import controller.attendance.EmailUtility;
import controller.authentication.authorization.BaseRBACController;
import dal.ChangeDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Lecturer;
import entity.RequestChangeTimetable;
import entity.Role;
import entity.Session;
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
public class RequestReceivedController extends BaseRBACController {
    
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
        String lid = req.getParameter("id");
        ChangeDBContext cdb = new ChangeDBContext();
        LecturerDBContext ldb = new LecturerDBContext();
        EmailUtility send =new EmailUtility();
        SessionDBContext sesdb = new SessionDBContext();
        ArrayList<RequestChangeTimetable> requests = cdb.getRequestChangeTimetablesTo(lid);
        for (RequestChangeTimetable request : requests) {
            if (request.isResponsed()) {

            } else {
                Lecturer lec = ldb.getLecturerByLname(request.getLecfrom().getLname());
                String des = req.getParameter("description"+request.getId());
                String status = req.getParameter("status" + request.getId());
                Session ses = sesdb.getSessionBySesID(request.getSesid());
                if (status.equals("acc")) {
                    try {
                        request.setDescription(des);
                        request.setStatus(true);
                        request.setResponsed(true);
                        String content = "Your request to "+request.getLecfrom().getLname()+" to change class schedule of class "+ ses.getGroup().getGname()+" in the slot "+ses.getSlot().getTid()
                                +" of the day "+ses.getDate()+" was be denied!\n With the reason : "+des ;
                        send.sendEmail(host, port, user, pass, lec.getEmail(), "Request denied! ", content);
                        sesdb.updateSession(request.getSlot().getTid(), request.getSesid(), request.getDate(), request.getRoom().getRnumber(), lid);
                    } catch (MessagingException ex) {
                        Logger.getLogger(RequestReceivedController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        request.setDescription(des);
                        request.setStatus(false);
                        request.setResponsed(true);
                        String content = "Your request to "+request.getLecfrom().getLname()+" to change class schedule of class "+ ses.getGroup().getGname()+" in the slot "+ses.getSlot().getTid()
                                +" of the day "+ses.getDate()+" was be accepted!\n With the description : "+des ;
                        send.sendEmail(host, port, user, pass, lec.getEmail(), "Request accepted! ", content);
                    } catch (MessagingException ex) {
                        Logger.getLogger(RequestReceivedController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                cdb.updateRequest(request.getId(), request.getDescription(), request.isStatus());
                
            }
        }
        req.setAttribute("requests", requests);
        req.setAttribute("lid", lid);
        req.getRequestDispatcher("view/changetimetable/requestreceived.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lid = req.getParameter("id");
        ChangeDBContext cdb = new ChangeDBContext();
        ArrayList<RequestChangeTimetable> requests = cdb.getRequestChangeTimetablesTo(lid);
        req.setAttribute("requests", requests);
        req.setAttribute("lid", lid);
        req.getRequestDispatcher("view/changetimetable/requestreceived.jsp").forward(req, resp);
    }

}

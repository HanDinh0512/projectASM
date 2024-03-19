/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.changetimetable;

import controller.attendance.EmailUtility;
import controller.authentication.authorization.BaseRBACController;
import dal.ChangeDBContext;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.RoomDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TermDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Group;
import entity.Lecturer;
import entity.Role;
import entity.Room;
import entity.Session;
import entity.Student;
import entity.Term;
import entity.TimeSlot;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class ChangeScheduleController extends BaseRBACController {

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
        HttpSession session = req.getSession();
        EmailUtility send = new EmailUtility();
        String lid = req.getParameter("id");
        String gid = req.getParameter("gid");
        String sesid = req.getParameter("sesid");
        ArrayList<Group> groups = (ArrayList<Group>) session.getAttribute("groups");
        ArrayList<Session> sessions = (ArrayList<Session>) session.getAttribute("sessions");
        Session ses = (Session) session.getAttribute("ses");
        ArrayList<TimeSlot> slots = (ArrayList<TimeSlot>) session.getAttribute("slots");
        int slot = Integer.parseInt(req.getParameter("slot"));
        String rawDate = req.getParameter("date");
        String rawlname = req.getParameter("lname");
        String rawRoom = req.getParameter("room");
        LecturerDBContext ldb = new LecturerDBContext();
        RoomDBContext rdb = new RoomDBContext();
        SessionDBContext sdb = new SessionDBContext();
        StudentDBContext stuDB = new StudentDBContext();
        SessionDBContext sesDB = new SessionDBContext();
        ChangeDBContext chdb = new ChangeDBContext();
        boolean checkPastDate = false;
        boolean lnameExist = false;
        boolean roomExist = false;
        boolean check = false;
        Date currentDate = new Date();
        java.sql.Date sqldate = java.sql.Date.valueOf(rawDate);
        Date utilDate = DateTimeHelper.convertSqlDateToUtilDate(sqldate);
        if (utilDate.before(currentDate)) {
            req.setAttribute("ms", "You cannot choose a day from the past !");
        } else {
            checkPastDate = true;
        }
        if (checkPastDate) {
            Lecturer l = ldb.getLecturerByLname(rawlname);
            if (l.getLname() == null) {
                req.setAttribute("ms", "Lecturer name is not exist!");
            } else {
                lnameExist = true;
            }
        }
        if (lnameExist) {
            Room r = rdb.getRoom(rawRoom);
            if (r.getRid() == null) {
                req.setAttribute("ms", "Room is not exist!");
            } else {
                roomExist = true;
            }
        }
        if (roomExist) {
            if (sdb.checkSessionByGidSlotDate(Integer.parseInt(gid), slot, sqldate)) {
                req.setAttribute("ms", "This class was study in slot " + slot + " of the day " + sqldate.toString());
            } else {
                if (sdb.checkSessionByRoomSlotDate(rawRoom, slot, sqldate)) {
                    req.setAttribute("ms", "Already have a class was study in slot " + slot + " of the day " + sqldate.toString() + "in the room" + rawRoom);
                } else {
                    if (sdb.checkSessionByLnameSlotDate(rawlname, slot, sqldate)) {
                        req.setAttribute("ms", "This lecturer already have a class was study in slot " + slot + " of the day " + sqldate.toString());
                    } else {
                        Lecturer lec = ldb.getLecturerByLname(rawlname);
                        if (lec.getLid().equals(lid)) {
                            req.setAttribute("ms", "Request accepted!");
                            String emailContent = "Your teacher in the subject " + ses.getGroup().getSubject().getSubname() + " changed the class schedule"
                                    + " in the slot " + ses.getSlot().getTid() + " of the day " + ses.getDate().toString() + " in room " + ses.getRoom().getRnumber()
                                    + " to the slot " + slot + " of the day " + rawDate + " in room" + rawRoom + "\n You can see more details in your timetable";
                            ArrayList<Student> students = stuDB.getStudentInGID(Integer.parseInt(gid));
                            for (Student student : students) {
                                try {
                                    send.sendEmail(host, port, user, pass, student.getEmail(), "Change class schedule", emailContent);
                                } catch (MessagingException ex) {
                                    Logger.getLogger(ChangeScheduleController.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                            sesDB.updateSession(slot, Integer.parseInt(sesid), sqldate, rawRoom, lid);
                        } else {
                            chdb.insertRequest(lid, lec.getLid(), rawRoom, slot, sqldate, Integer.parseInt(gid), Integer.parseInt(sesid));
                            String emailTo = ldb.getEmailLecturer(lec.getLid());
                            String emailContent = "You got an request change class schedule from " + account.getUsername() + ".\n You can see more detail in request change class schedule in FAP.";
                            try {
                                send.sendEmail(host, port, user, pass, emailTo, "Request change class schedule", emailContent);
                            } catch (MessagingException ex) {
                                Logger.getLogger(ChangeScheduleController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            req.setAttribute("ms", "Request has been sent.");
                        }
                    }
                }
            }

        }
        req.setAttribute("groups", groups);
        req.setAttribute("sessions", sessions);
        req.setAttribute("ses", ses);
        req.setAttribute("slots", slots);
        req.setAttribute("lid", lid);
        req.setAttribute("gid", gid);
        req.setAttribute("sesid", sesid);
        req.setAttribute("slot", slot);
        req.setAttribute("lname", rawlname);
        req.setAttribute("room", rawRoom);
        req.getRequestDispatcher("view/changetimetable/changeschedule.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String lid = req.getParameter("id");
        String gid = req.getParameter("gid");
        String sesid = req.getParameter("sesid");
        TermDBContext termdb = new TermDBContext();
        Term currentTerm = termdb.getCurrentTerm();
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> groups = gdb.getGroupsByLID(lid, currentTerm.getTid());
        SessionDBContext sesdb = new SessionDBContext();
        session.setAttribute("groups", groups);
        req.setAttribute("groups", groups);
        if (gid != null) {
            Date currentDate = new Date();
            Date lastDateSession = sesdb.getLastDateSession(lid, Integer.parseInt(gid));
            ArrayList<Session> sessions = sesdb.getSessionsByLid(lid, DateTimeHelper.convertUtilDateToSqlDate(currentDate),
                    DateTimeHelper.convertUtilDateToSqlDate(lastDateSession));
            req.setAttribute("sessions", sessions);
            session.setAttribute("sessions", sessions);
        }
        if (sesid != null) {
            Session ses = sesdb.getSessionBySesID(Integer.parseInt(sesid));
            req.setAttribute("ses", ses);
            session.setAttribute("ses", ses);
            TimeSlotDBContext tsdb = new TimeSlotDBContext();
            ArrayList<TimeSlot> slots = tsdb.list();
            req.setAttribute("slots", slots);
            session.setAttribute("slots", slots);
        }
        req.setAttribute("lid", lid);
        req.setAttribute("gid", gid);
        req.setAttribute("sesid", sesid);
        req.getRequestDispatcher("view/changetimetable/changeschedule.jsp").forward(req, resp);
    }

}

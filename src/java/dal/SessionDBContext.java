/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Room;
import entity.Session;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getSessionsByLid(String lid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "Select ses.sesid, ses.gid, g.gname,g.subid, ses.room, ses.isTaken, ses.date, ses.tid\n"
                    + "from session ses inner join [group] g on ses.gid = g.gid\n"
                    + "where ses.lid = ? and ses.date >= ? and ses.date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session ses = new Session();
                Group g = new Group();
                Room r = new Room();
                Subject sub = new Subject();
                TimeSlot time = new TimeSlot();

                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                sub.setSubname(rs.getString("subid"));
                r.setRnumber(rs.getString("room"));
                time.setTid(rs.getInt("tid"));
                g.setSubject(sub);

                ses.setSesid(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setGroup(g);
                ses.setSlot(time);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);

                sessions.add(ses);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Student> getStudentBySesID(int sesid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select ses.sesid, stu.sid, stu.name, stu.email\n"
                    + "from session  ses inner join Enrollment en on en.gid = ses.gid\n"
                    + "				  inner join Student stu on stu.sid = en.sid\n"
                    + "where ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getString("sid"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public boolean checkIsTakenBySesID(int sesID) {
        boolean check = false;
        try {
            String sql = "select ses.isTaken\n"
                    + "from session ses \n"
                    + "where ses.sesid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                check = rs.getBoolean("isTaken");
                return check;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public int countSession(Group group) {
        int count = 0;
        try {
            String sql = "select count(*) as count\n"
                    + "from session ses\n"
                    + "where ses.gid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, group.getGid());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getGroupBySesID(int sesid) {
        int gid = 0;
        try {
            String sql = "select ses.gid\n"
                    + "from session ses\n"
                    + "where ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                gid = rs.getInt("gid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gid;
    }

    public String getLecturerID(int sesid) {
        String lid = null;

        try {
            String sql = "select lid\n"
                    + "from session\n"
                    + "where sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                lid = rs.getString("lid");
                return lid;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lid;
    }

    public java.util.Date getLastDateSession(String lid, int gid) {
        java.util.Date date = new java.util.Date();
        try {
            String sql = "select MAX(date) as date\n"
                    + "  from session ses \n"
                    + "  where ses.gid = ? and ses.lid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setString(2, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                date = DateTimeHelper.convertSqlDateToUtilDate(rs.getDate("date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return date;
    }

    public Session getSessionBySesID(int sesid) {
        Session ses = new Session();
        try {
            String sql = "Select ses.sesid, ses.gid, g.gname,g.subid, ses.room, ses.isTaken, ses.date, ses.tid\n"
                    + "from session ses inner join [group] g on ses.gid = g.gid\n"
                    + "where ses.sesid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Room r = new Room();
                Subject sub = new Subject();
                TimeSlot time = new TimeSlot();

                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                sub.setSubname(rs.getString("subid"));
                r.setRnumber(rs.getString("room"));
                time.setTid(rs.getInt("tid"));
                g.setSubject(sub);

                ses.setSesid(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setGroup(g);
                ses.setSlot(time);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ses;
    }

    public boolean checkSessionByGidSlotDate(int gid, int slot, Date date) {
        Session ses = new Session();
        try {
            String sql = "Select ses.sesid, ses.gid, g.gname,g.subid, ses.room, ses.isTaken, ses.date, ses.tid\n"
                    + "from session ses inner join [group] g on ses.gid = g.gid\n"
                    + "where ses.gid=? and ses.tid = ? and ses.date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, slot);
            stm.setDate(3, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Room r = new Room();
                Subject sub = new Subject();
                TimeSlot time = new TimeSlot();

                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                sub.setSubname(rs.getString("subid"));
                r.setRnumber(rs.getString("room"));
                time.setTid(rs.getInt("tid"));
                g.setSubject(sub);

                ses.setSesid(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setGroup(g);
                ses.setSlot(time);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ses.getGroup() != null;
    }

    public boolean checkSessionByRoomSlotDate(String rnumber, int slot, Date date) {
        Session ses = new Session();
        try {
            String sql = "Select ses.sesid, ses.gid, g.gname,g.subid, ses.room, ses.isTaken, ses.date, ses.tid\n"
                    + "from session ses inner join [group] g on ses.gid = g.gid\n"
                    + "where ses.room=? and ses.tid = ? and ses.date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rnumber);
            stm.setInt(2, slot);
            stm.setDate(3, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Room r = new Room();
                Subject sub = new Subject();
                TimeSlot time = new TimeSlot();

                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                sub.setSubname(rs.getString("subid"));
                r.setRnumber(rs.getString("room"));
                time.setTid(rs.getInt("tid"));
                g.setSubject(sub);

                ses.setSesid(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setGroup(g);
                ses.setSlot(time);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ses.getGroup() != null;
    }

    public boolean checkSessionByLnameSlotDate(String lname, int slot, Date date) {
        Session ses = new Session();
        try {
            String sql = "Select ses.sesid, ses.gid,ses.lid,l.lname, g.gname,g.subid, ses.room, ses.isTaken, ses.date, ses.tid\n"
                    + "from session ses inner join [group] g on ses.gid = g.gid\n"
                    + "inner join lecturer l on l.lid = ses.lid\n"
                    + "where l.lname=? and ses.tid = ? and ses.date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lname);
            stm.setInt(2, slot);
            stm.setDate(3, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                Room r = new Room();
                Subject sub = new Subject();
                TimeSlot time = new TimeSlot();

                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                sub.setSubname(rs.getString("subid"));
                r.setRnumber(rs.getString("room"));
                time.setTid(rs.getInt("tid"));
                g.setSubject(sub);

                ses.setSesid(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setGroup(g);
                ses.setSlot(time);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                ses.setRoom(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ses.getGroup() != null;
    }

    public void updateSession(int slot, int sesid, Date date, String rnumber, String lid) {
        try {
            String sql = "update session\n"
                    + "set tid = ?,\n"
                    + "	date = ?,\n"
                    + "	room = ?,lid=?,\n"
                    + "	change = 1\n"
                    + "where sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, slot);
            stm.setDate(2, date);
            stm.setString(3, rnumber);
            stm.setString(4, lid);
            stm.setInt(5, sesid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

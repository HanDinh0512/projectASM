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
}

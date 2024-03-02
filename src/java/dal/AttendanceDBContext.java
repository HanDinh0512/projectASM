/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Group;
import entity.Lecturer;
import entity.Room;
import entity.Session;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author admin
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendances(String sid, Date from, Date to) {
        ArrayList<Attendance> attendancesBySID = new ArrayList<>();
        try {
            String sql = "select ses.lid, ses.room,ses.date, ses.isTaken,\n"
                    + "g.gid, g.gname, g.subid, t.tid, \n"
                    + " l.lname, att.isPresent, att.description, att.time\n"
                    + "from attendance att \n"
                    + "inner join session ses on att.sesid = ses.sesid \n"
                    + "inner join [group] g on g.gid = ses.gid\n"
                    + "inner join timeslot t on t.tid = ses.tid\n"
                    + "inner join lecturer l on l.lid = ses.lid\n"
                    + "where att.sid = ? and ses.date >= ? and ses.date <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Session ses = new Session();
                Group gr = new Group();
                TimeSlot ti = new TimeSlot();
                Lecturer le = new Lecturer();
                Room r = new Room();
                Student stu = new Student();
                Subject sub = new Subject();
                
                sub.setSubname(rs.getString("subid"));

                r.setRnumber(rs.getString("room"));

                stu.setSid(sid);

                gr.setGid(rs.getInt("gid"));
                gr.setGname(rs.getString("gname"));
                gr.setSubject(sub);

                ti.setTid(rs.getInt("tid"));

                le.setLid(rs.getString("lid"));
                le.setLname(rs.getString("lname"));

                ses.setGroup(gr);
                ses.setSlot(ti);
                ses.setDate(rs.getDate("date"));
                ses.setRoom(r);
                ses.setLecturer(le);
                ses.setIsTaken(rs.getBoolean("isTaken"));
                
                att.setSes(ses);
                att.setStudent(stu);
                att.setDescription(rs.getString("description"));
                att.setIsPresent(rs.getBoolean("isPresent"));
                att.setTime(rs.getString("time"));

                attendancesBySID.add(att);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return attendancesBySID;
    }
}

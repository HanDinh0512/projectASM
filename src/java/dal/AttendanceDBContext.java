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

    public ArrayList<Attendance> getAttendancesForStudent(String sid, Date from, Date to) {
        ArrayList<Attendance> attendancesBySID = new ArrayList<>();
        try {
            String sql = "select ses.sesid, ses.lid, ses.room,ses.date, ses.isTaken, en.sid, \n"
                    + "                    g.gid, g.gname, g.subid, t.tid, \n"
                    + "                    l.lname, att.isPresent, att.description, att.time\n"
                    + "                    from Enrollment en\n"
                    + "                    inner join session ses on en.gid = ses.gid\n"
                    + "                    inner join [group] g on g.gid = ses.gid\n"
                    + "                    inner join timeslot t on t.tid = ses.tid\n"
                    + "                    inner join lecturer l on l.lid = ses.lid\n"
                    + "					left join attendance att on en.sid = att.sid and ses.sesid = att.sesid\n"
                    + "                    where en.sid = ? and ses.date >= ? and ses.date <= ?";
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
                att.setTime(rs.getTimestamp("time"));

                attendancesBySID.add(att);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return attendancesBySID;
    }

    public ArrayList<Attendance> getAttendancesForLecturer(int sesid) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "                    s.sid,s.name,\n"
                    + "                    a.aid,a.description,a.isPresent,a.time\n"
                    + "                    FROM Student s INNER JOIN Enrollment e ON s.sid = e.sid\n"
                    + "                    					INNER JOIN [group] g ON g.gid = e.gid\n"
                    + "                    					INNER JOIN session les ON les.gid = g.gid\n"
                    + "                    					LEFT JOIN Attendance a ON a.sesid = les.sesid AND a.sid = s.sid\n"
                    + "                    WHERE les.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Session ses = new Session();
                Student stu = new Student();

                att.setAid(rs.getInt("aid"));
                att.setDescription(rs.getString("description"));
                att.setTime(rs.getTimestamp("time"));
                att.setIsPresent(rs.getBoolean("isPresent"));

                stu.setSid(rs.getString("sid"));
                stu.setName(rs.getString("name"));

                att.setStudent(stu);
                attendances.add(att);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public void takeAttendance(int sesid, ArrayList<Attendance> attendances) {
        try {
            connection.setAutoCommit(false);
            String sql_remove_atts = "DELETE Attendance WHERE sesid = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, sesid);
            stm_remove_atts.executeUpdate();

            for (Attendance att : attendances) {
                String sql_insert_att = "INSERT INTO [attendance]\n"
                        + "           ([sesid]\n"
                        + "           ,[sid]\n"
                        + "           ,[description]\n"
                        + "           ,[isPresent]\n"
                        + "           ,[time])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, sesid);
                stm_insert_att.setString(2, att.getStudent().getSid());
                stm_insert_att.setString(3, att.getDescription());
                stm_insert_att.setBoolean(4, att.isIsPresent());
                stm_insert_att.executeUpdate();
            }

            String sql_update_lession = "UPDATE session SET isTaken = 1 WHERE sesid =?";
            PreparedStatement stm_update_lession = connection.prepareStatement(sql_update_lession);
            stm_update_lession.setInt(1, sesid);
            stm_update_lession.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        }

    }

    public void updateAttendance(int sesid, String sid, Attendance att) {
        try {
            String sql = "UPDATE attendance\n"
                    + "SET isPresent = ?,\n"
                    + "    description = ?,\n"
                    + "	time = GETDAtE()\n"
                    + "WHERE sid = ? AND sesid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, att.isIsPresent());
            stm.setString(2, att.getDescription());
            stm.setString(3, sid);
            stm.setInt(4, sesid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AttendanceDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        
    }
}

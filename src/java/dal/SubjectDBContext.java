/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Student;
import entity.Subject;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class SubjectDBContext extends DBContext<Subject> {

    public ArrayList<Subject> getSubjects(String sid, String term) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "select stu.sid, stu.name, g.gid, g.subid, g.PIC, g.term\n"
                    + "from Enrollment en inner join [group] g on g.gid = en.gid\n"
                    + "				   inner join Student stu on stu.sid = en.sid\n"
                    + "where en.sid = ? and g.term = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, term);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubname(rs.getString("subid"));
                subjects.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    public ArrayList<Group> getGroups(String sid, String term) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "select en.sid, en.gid, g.gname, g.subid, g.term\n"
                    + "from Enrollment en inner join [group] g on g.gid = en.gid\n"
                    + "where en.sid = ? and g.term = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, term);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Subject sub = new Subject();
                Group g = new Group();
                Student stu = new Student();
                
                stu.setSid(rs.getString("sid"));
                sub.setSubid(rs.getString("subid"));
                g.setGid(rs.getInt("gid"));
                g.setSubject(sub);
                g.setTerm(term);
                
                groups.add(g);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }
}

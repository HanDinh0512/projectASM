/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Lecturer;
import entity.Student;
import entity.Subject;
import entity.Term;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> getGroupsByLID(String lid, String term) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "select g.gid, g.gname, g.subid, g.term from [group] g inner join lecturer l on l.lname = g.PIC\n"
                    + "	where l.lid = ? and g.term =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            stm.setString(2, term);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Group g = new Group();
                Subject sub = new Subject();
                
                
                sub.setSubname(rs.getString("subid"));
                g.setSubject(sub);
                g.setTerm(rs.getString("term"));
                g.setGname(rs.getString("gname"));
                g.setGid(rs.getInt("gid"));
                
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }
    
    public Group getGroupByGid(int gid){
        Group g = new Group();
        try {
            String sql = "select g.gid, g.gname, g.subid, g.term, g.PIC from [group] g where g.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Subject sub = new Subject();
                sub.setSubname(rs.getString("subid"));
                g.setTerm(rs.getString("term"));
                g.setGid(gid);
                g.setGname(rs.getString("gname"));
                Lecturer l = new Lecturer();
                l.setLname(rs.getString("PIC"));
                g.setPIC(l);
                g.setSubject(sub);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return g;
    }
    
    public ArrayList<Group> getGroupBySidGid( String sid,String term){
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "select g.gid, g.gname, g.subid, g.term, g.PIC from [group] g inner join Enrollment e on e.gid = g.gid where   e.sid = ? and g.term = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, term);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {             
                Group g = new Group();
                Subject sub = new Subject();
                sub.setSubname(rs.getString("subid"));
                g.setTerm(rs.getString("term"));
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                Lecturer l = new Lecturer();
                l.setLname(rs.getString("PIC"));
                g.setPIC(l);
                g.setSubject(sub);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }
    
    public ArrayList<Student> getStudents(int gid){
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select stu.sid, stu.name from Enrollment en inner join [group] g on g.gid = en.gid \n" +
                    "				inner join student stu on stu.sid = en.sid\n" +
                    "				where g.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Student s = new Student();
                s.setSid(rs.getString("sid"));
                s.setName(rs.getString("name"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
}

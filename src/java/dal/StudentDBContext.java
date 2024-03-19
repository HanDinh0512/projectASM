/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Department;
import entity.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class StudentDBContext extends DBContext<Student> {

    public String getStudentID(Account account) {
        String studentid = null;
        try {
            String sql = "Select sid from Student where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                studentid = rs.getString("sid");
                return studentid;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentid;
    }

    public boolean checkStudentIDByAccount(Account account, String sid) {

        try {
            String sql = "select sid\n"
                    + "from student\n"
                    + "where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String realSID = rs.getString("sid");
                return realSID.equals(sid);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public ArrayList<Student> getStudentInGID(int gid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select stu.sid,name,email from student stu inner join Enrollment en on en.sid = stu.sid\n"
                    + "where en.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getString("sid"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public Student getStudentInfo(String sid) {
        Student s = new Student();
        try {
            String sql = "  select stu.sid,stu.dob,stu.did,stu.email,stu.gender,stu.name,dep.dname \n"
                    + "  from Student stu inner join department dep on dep.did = stu.did where stu.sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Department dep = new Department();
                dep.setDid(rs.getInt("did"));
                dep.setDname(rs.getString("dname"));
                s.setSid(sid);
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setDob(rs.getDate("dob"));
                s.setGender(rs.getBoolean("gender"));
                s.setDep(dep);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
}

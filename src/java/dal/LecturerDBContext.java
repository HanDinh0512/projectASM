/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Lecturer;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class LecturerDBContext extends DBContext<Lecturer> {

    public String getLecturerID(Account account) {
        try {
            String sql = "Select lid from lecturer where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString("lid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkLecturerIDByAccount(Account account, String lid) {
        try {
            String sql = "select lid\n"
                    + "from lecturer\n"
                    + "where username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String realSID = rs.getString("lid");
                return realSID.equals(lid);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public Lecturer getLecturerByLname(String lname) {
        Lecturer l = new Lecturer();
        try {
            String sql = "  select lid,lname,email from lecturer where lname =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                l.setLid(rs.getString("lid"));
                l.setLname(rs.getString("lname"));
                l.setEmail(rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    public String getEmailLecturer(String lto) {
        String email = "";
        try {
            String sql = "select distinct l.email from lecturer l inner join RequestChangeTimetable re on re.lidto = l.lid\n"
                    + "where l.lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lto);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                email += rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }

    public Lecturer getLecturerInfor(String lid) {
        Lecturer l = new Lecturer();
        try {
            String sql = "SELECT  lid\n"
                    + "      ,lname\n"
                    + "      ,gender\n"
                    + "      ,username\n"
                    + "      ,email,truename,dob\n"
                    + "  FROM lecturer where lid = ?";
            PreparedStatement stm =connection.prepareStatement(sql);
            stm.setString(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                l.setLid(lid);
                l.setLname(rs.getString("lname"));
                l.setTruename(rs.getString("truename"));
                l.setGender(rs.getBoolean("gender"));
                l.setEmail(rs.getString("email"));
                l.setDob(rs.getDate("dob"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  l;
    }
}

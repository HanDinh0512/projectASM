/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.TotalCourse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class TotalCourseDBContext extends DBContext<TotalCourse> {

    public TotalCourse getTotalCourse(String sid, String subid, String term) {
        TotalCourse t = new TotalCourse();
        try {
            String sql = "select t.total, t.status from [totalcourse] t\n"
                    + "where sid=? and subid=? and term = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, subid);
            stm.setString(3, term);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                t.setStatus(rs.getString("status"));
                t.setTotal(rs.getString("total"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TotalCourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }
}

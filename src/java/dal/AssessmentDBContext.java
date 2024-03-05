/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Group;
import entity.Subject;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> getAssessmentsByGroup(Group g) {
        ArrayList<Assessment> assessments = new ArrayList<>();
        try {
            String sql = "select ass.assid ,ass.name, ass.subid, ass.weight, ass.assid from Assessment ass\n"
                    + "where ass.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, g.getSubject().getSubname());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Assessment ass = new Assessment();
                ass.setAssid(rs.getInt("assid"));
                ass.setName(rs.getString("name"));
                ass.setWeight(rs.getFloat("weight"));
                Subject sub = new Subject();
                sub.setSubname(rs.getString("subid"));
                ass.setSubject(sub);
                assessments.add(ass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assessments;
    }
}

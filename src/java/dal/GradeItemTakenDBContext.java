/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.GradeItemTaken;
import entity.Group;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class GradeItemTakenDBContext extends DBContext<GradeItemTaken> {

    public ArrayList<GradeItemTaken> getGradeItemTakens(Group g) {
        ArrayList<GradeItemTaken> takens = new ArrayList<>();
        try {
            String sql = "select g.gname, g.subid, ass.name, ass.assid, ass.weight, gr.isTaken\n"
                    + "from [group] g inner join Assessment ass on ass.subid = g.subid\n"
                    + "				left join GradeItemTaken gr on gr.gid = g.gid and ass.assid = gr.assid\n"
                    + "where g.gid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, g.getGid());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                GradeItemTaken gr =new GradeItemTaken();
                Assessment ass = new Assessment();
                ass.setAssid(rs.getInt("assid"));
                ass.setName(rs.getString("name"));
                ass.setWeight(rs.getFloat("weight"));
                ass.setSubject(g.getSubject());
                gr.setIsTaken(rs.getBoolean("isTaken"));
                gr.setGroup(g);
                gr.setAssessment(ass);
                takens.add(gr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeItemTakenDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return takens;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Room;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author admin
 */
public class RoomDBContext extends DBContext<Room>{
    public Room getRoom (String rnumber){
        Room r = new Room();
        try {
            String sql = "select rid,rnumber from room where rnumber = ?";
            PreparedStatement stm =connection.prepareStatement(sql);
            stm.setString(1, rnumber);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                r.setRid(rs.getString("rid"));
                r.setRnumber(rs.getString("rnumber"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
}

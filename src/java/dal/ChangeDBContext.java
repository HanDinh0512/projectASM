/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Lecturer;
import entity.RequestChangeTimetable;
import entity.Room;
import entity.TimeSlot;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ChangeDBContext extends DBContext<RequestChangeTimetable> {

    public void insertRequest(String lfrom, String lto, String rnumber, int slot, Date date, int gid, int sesid) {
        try {
            String sql = "insert into RequestChangeTimetable(lidfrom,lidto,room,slot,date,gid,sesid) values (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lfrom);
            stm.setString(2, lto);
            stm.setInt(4, slot);
            stm.setString(3, rnumber);
            stm.setDate(5, date);
            stm.setInt(6, gid);
            stm.setInt(7, sesid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChangeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<RequestChangeTimetable> getRequestChangeTimetablesFrom(String lid) {
        ArrayList<RequestChangeTimetable> requests = new ArrayList<>();
        GroupDBContext grdb = new GroupDBContext();
        try {
            String sql = "  select id,lidfrom,lidto,l.lname,room,gid,slot,date,description,status,sesid,responsed \n"
                    + "from RequestChangeTimetable re inner join lecturer l on l.lid = re.lidto \n"
                    + "where lidfrom =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RequestChangeTimetable r = new RequestChangeTimetable();
                r.setId(rs.getInt("id"));
                Lecturer lfrom = new Lecturer();
                Lecturer lto = new Lecturer();
                lfrom.setLid(rs.getString("lidfrom"));
                lto.setLname(rs.getString("lname"));
                lto.setLid(rs.getString("lidto"));
                TimeSlot t = new TimeSlot();
                t.setTid(rs.getInt("slot"));
                Room ro = new Room();
                ro.setRnumber(rs.getString("room"));
                r.setDate(rs.getDate("date"));
                r.setStatus(rs.getBoolean("status"));
                r.setDescription(rs.getString("description"));
                r.setLecfrom(lfrom);
                r.setLecto(lto);
                r.setRoom(ro);
                r.setSlot(t);
                r.setGroup(grdb.getGroupByGid(rs.getInt("gid")));
                r.setSesid(rs.getInt("sesid"));
                r.setResponsed(rs.getBoolean("responsed"));
                requests.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return requests;
    }

    public ArrayList<RequestChangeTimetable> getRequestChangeTimetablesTo(String lid) {
        ArrayList<RequestChangeTimetable> requests = new ArrayList<>();
        GroupDBContext grdb = new GroupDBContext();
        try {
            String sql = "  select id,lidfrom,lidto,l.lname,room,gid,slot,date,description,status,sesid,responsed\n"
                    + " from RequestChangeTimetable re inner join lecturer l on l.lid = re.lidfrom where lidto =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RequestChangeTimetable r = new RequestChangeTimetable();
                r.setId(rs.getInt("id"));
                Lecturer lfrom = new Lecturer();
                Lecturer lto = new Lecturer();
                lfrom.setLid(rs.getString("lidfrom"));
                lto.setLid(rs.getString("lidto"));
                lfrom.setLname(rs.getString("lname"));
                TimeSlot t = new TimeSlot();
                t.setTid(rs.getInt("slot"));
                Room ro = new Room();
                ro.setRnumber(rs.getString("room"));
                r.setDate(rs.getDate("date"));
                r.setStatus(rs.getBoolean("status"));
                r.setDescription(rs.getString("description"));
                r.setLecfrom(lfrom);
                r.setLecto(lto);
                r.setRoom(ro);
                r.setSlot(t);
                r.setGroup(grdb.getGroupByGid(rs.getInt("gid")));
                r.setSesid(rs.getInt("sesid"));
                r.setResponsed(rs.getBoolean("responsed"));
                requests.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return requests;
    }

    public void updateRequest(int id, String description, boolean status) {
        try {
            String sql = "update RequestChangeTimetable\n"
                    + "set description = ?,\n"
                    + "	status = ?,\n"
                    + "	responsed = 1\n"
                    + "	where id =?";
            PreparedStatement stm =connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setBoolean(2, status);
            stm.setInt(3, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChangeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

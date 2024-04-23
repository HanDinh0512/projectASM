/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.News;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class NewsDBContext extends DBContext<News> {

    public ArrayList<News> getNews() {
        ArrayList<News> newses = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [id]\n"
                    + "      ,[name]\n"
                    + "      ,[content]\n"
                    + "      ,[time]\n"
                    + "  FROM [PRJ-Project].[dbo].[News]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setTime(rs.getTimestamp("time"));
                n.setContent(rs.getString("content"));
                newses.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newses;
    }

    public News getNewsByID(int id) {
        News n = new News();
        try {
            String sql = "SELECT TOP (1000) [id]\n"
                    + "      ,[name]\n"
                    + "      ,[content]\n"
                    + "      ,[time]\n"
                    + "  FROM [PRJ-Project].[dbo].[News] where id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                n.setId(rs.getInt("id"));
                n.setName(rs.getString("name"));
                n.setTime(rs.getTimestamp("time"));
                n.setContent(rs.getString("content"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}

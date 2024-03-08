/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Role;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class RoleDBContext extends DBContext<Role> {

    public ArrayList<Role> getByUsernameAndUrl(String username, String url) {
        ArrayList<Role> roles = new ArrayList<>();
        try {

            String sql = "SELECT r.roleid,r.rolename FROM Account a\n"
                    + "	INNER JOIN Role_Account ra ON ra.username = a.username\n"
                    + "	INNER JOIN [Role] r ON r.roleid = ra.roleid\n"
                    + "	INNER JOIN [Role_Feature] rf ON rf.roleid = r.roleid\n"
                    + "	INNER JOIN Feature f ON f.fid = rf.fid\n"
                    + "WHERE \n"
                    + "a.username = ? AND f.url = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("roleid"));
                r.setName(rs.getString("rolename"));
                roles.add(r);
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(RoleDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return roles;
    }

    public Role getRole(String username, String password) {
        try {
            String sql = "SELECT a.username, a.password, r.rolename FROM Account a\n"
                    + "	inner join Role_Account ra on ra.username = a.username\n"
                    + "	inner join [Role] r on r.roleid = ra.roleid\n"
                    + "                    WHERE a.username = ? AND a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                Account account = new Account();
                account.setUsername(username);
                
                r.setName(rs.getString("rolename"));
                r.getAccounts().add(account);
                return r;
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(RoleDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }
}

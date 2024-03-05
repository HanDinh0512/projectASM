/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Term;
import java.security.interfaces.RSAKey;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;
import java.sql.*;

/**
 *
 * @author admin
 */
public class TermDBContext extends DBContext<Term> {

    public ArrayList<Term> getTerm(String sid) {
        ArrayList<Term> terms = new ArrayList<>();
        DateTimeHelper dth = new DateTimeHelper();
        try {
            String sql = "  select distinct t.tid, t.timeEnd, t.timeStart\n"
                    + "  from term t inner join [group] g on g.term = t.tid\n"
                    + "			inner join Enrollment e on e.gid = g.gid\n"
                    + "	where e.sid = ?"
                    + "order by t.timeEnd";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Term t = new Term();
                t.setTid(rs.getString("tid"));
                t.setBeginDate(DateTimeHelper.convertSqlDateToUtilDate(rs.getDate("timeStart")));
                t.setEndDate(DateTimeHelper.convertSqlDateToUtilDate(rs.getDate("timeEnd")));
                terms.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return terms;
    }
    
    public boolean isBetween(java.util.Date startDate, java.util.Date endDate) {
        java.util.Date currentDate = new java.util.Date();
        return !currentDate.before(startDate) && !currentDate.after(endDate);
    }
    
    public ArrayList<Term> getAllTerms(){
        ArrayList<Term> terms = new ArrayList<>();
        try {
            String sql = "select tid,timeStart,timeEnd from term ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Term t = new Term();
                t.setTid(rs.getString("tid"));
                t.setBeginDate(DateTimeHelper.convertSqlDateToUtilDate(rs.getDate("timeStart")));
                t.setEndDate(DateTimeHelper.convertSqlDateToUtilDate(rs.getDate("timeEnd")));
                terms.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TermDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return terms;
    }
    
    public Term getCurrentTerm(){
        Term t = new Term();
        ArrayList<Term> allTerms = getAllTerms();
        for (Term allTerm : allTerms) {
            if (isBetween(allTerm.getBeginDate(), allTerm.getEndDate())) {
                t = allTerm;
            }
        }
        return t;
    }
}

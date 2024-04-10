/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Grade;
import entity.Group;
import entity.Student;
import entity.Subject;
import entity.Term;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradesBySidAndTermAndSub(String sid, String term, int gid) {
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "select stu.sid, stu.name as sname,ass.assid, g.term, ass.subid, ass.name, ass.weight,gr.isTaken, gr.score, gr.description\n"
                    + "from Assessment ass inner join [group] g on g.subid =ass.subid\n"
                    + "					inner join Enrollment en on en.gid = g.gid\n"
                    + "					inner join student stu on stu.sid = en.sid\n"
                    + "					left join grade gr on ass.assid = gr.assid and gr.sid = stu.sid and gr.gid = g.gid\n"
                    + "where en.sid = ? and g.term = ?  and g.gid = ?\n"
                    + "order by ass.assid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, term);
       
            stm.setInt(3, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment ass = new Assessment();
                Grade gr = new Grade();
                Group g = new Group();
                Student stu = new Student();
                Subject sub = new Subject();

                sub.setSubid(rs.getString("subid"));
                stu.setSid(sid);
                stu.setName(rs.getString("sname"));
                g.setTerm(rs.getString("term"));
                ass.setAssid(rs.getInt("assid"));
                ass.setSubject(sub);
                ass.setName(rs.getString("name"));
                ass.setWeight(rs.getFloat("weight"));
                
                gr.setIsTaken(rs.getBoolean("isTaken"));
                gr.setAssessment(ass);
                gr.setScore(rs.getString("score"));
                gr.setStudent(stu);
                gr.setGroup(g);
                gr.setDes(rs.getString("description"));

                grades.add(gr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    public ArrayList<Grade> getGradesForLecturer(String lid, int gid) {
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "select stu.sid, stu.name as sname, g.term,g.gid,ass.assid, ass.subid, ass.name, ass.weight, gr.score, gr.description\n"
                    + "                    from Assessment ass inner join [group] g on g.subid =ass.subid\n"
                    + "                    					inner join Enrollment en on en.gid = g.gid\n"
                    + "                    					inner join student stu on stu.sid = en.sid\n"
                    + "                    					left join grade gr on ass.assid = gr.assid and gr.sid = stu.sid and gr.gid = g.gid\n"
                    + "                    where g.gid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment ass = new Assessment();
                Group g = new Group();
                Grade gr = new Grade();
                Student stu = new Student();
                Subject sub = new Subject();

                g.setGid(gid);
                g.setTerm(rs.getString("term"));
                sub.setSubname(rs.getString("subid"));
                stu.setSid(rs.getString("sid"));
                stu.setName(rs.getString("sname"));
                ass.setAssid(rs.getInt("assid"));
                ass.setName(rs.getString("name"));
                ass.setSubject(sub);
                ass.setWeight(rs.getFloat("weight"));

                gr.setScore(rs.getString("score"));
                gr.setDes(rs.getString("description"));
                gr.setAssessment(ass);
                gr.setStudent(stu);
                gr.setGroup(g);

                grades.add(gr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    public boolean checkIstakenGrade(String sid, int gid, int assid) {
        boolean isTaken = false;
        try {
            String sql = "  select isTaken from grade \n"
                    + "  where sid= ? and gid = ? and assid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, gid);
            stm.setInt(3, assid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                isTaken = rs.getBoolean("isTaken");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isTaken;
    }

    public void insertNewGrade(String sid, int gid, int assid, String score) {
        try {
            String sql = "INSERT INTO [dbo].[grade]\n"
                    + "           ([assid]\n"
                    + "           ,[sid]\n"
                    + "           ,[score]\n"
                    + "           ,[gid]\n"
                    + "           ,[isTaken]\n"
                    + "           )\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           )";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, assid);
            stm.setString(2, sid);
            stm.setString(3, score);
            stm.setInt(4, gid);
            if (score==null||score.isEmpty()) {
                stm.setBoolean(5, false);               
            }else{
                stm.setBoolean(5, true);
            }
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateNewGrade(String sid, int gid, int assid, String score) {
        try {
            String sql = "UPDATE [dbo].[grade]\n"
                    + "   SET \n"
                    + "      [score] = ?,\n"
                    + "       isTaken = ?\n"
                    + " WHERE sid = ? and gid = ? and assid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, score);
            
            if (score!=null) {
                stm.setBoolean(2, true);
            }else{
                stm.setBoolean(2, false);
            }
            stm.setString(3,sid);
            stm.setInt(4, gid);
            stm.setInt(5, assid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

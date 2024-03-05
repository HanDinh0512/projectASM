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

    public ArrayList<Grade> getGradesBySidAndTermAndSub(String sid, String term, String subid) {
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "select stu.sid, stu.name as sname,ass.assid, g.term, ass.subid, ass.name, ass.weight, gr.score, gr.description\n"
                    + "from Assessment ass inner join [group] g on g.subid =ass.subid\n"
                    + "					inner join Enrollment en on en.gid = g.gid\n"
                    + "					inner join student stu on stu.sid = en.sid\n"
                    + "					left join grade gr on ass.assid = gr.assid\n"
                    + "where en.sid = ? and g.term = ? and ass.subid = ?\n"
                    + "order by ass.assid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setString(2, term);
            stm.setString(3, subid);
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
    
    
}

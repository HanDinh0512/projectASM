/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Term;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author admin
 */
public class main {
        public static boolean isBetween(Date startDate, Date endDate) {
        Date currentDate = new Date();
        return !currentDate.before(startDate) && !currentDate.after(endDate);
    }
    public static void main(String[] args) {
        GradeDBContext gdb = new GradeDBContext();
        ArrayList<Term> terms = gdb.getTerm("h1");
        for (Term term : terms) {
            System.out.println(isBetween(term.getBeginDate(), term.getEndDate()));
        }
    }
}

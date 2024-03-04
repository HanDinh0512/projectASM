/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Group extends IEntity{
    private int gid;
    private String gname ;
    private Subject subject ;
    private Lecturer PIC;
    private ArrayList<Student> students ;
    private String term ;

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }
    
    
    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }
    
    

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Lecturer getPIC() {
        return PIC;
    }

    public void setPIC(Lecturer PIC) {
        this.PIC = PIC;
    }

    
    
}

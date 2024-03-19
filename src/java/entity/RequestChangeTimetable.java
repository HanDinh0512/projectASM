/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.*;
/**
 *
 * @author admin
 */
public class RequestChangeTimetable extends IEntity{
    private int id ;
    private Lecturer lecfrom ;
    private Lecturer lecto ;
    private Room room;
    private TimeSlot slot ;
    private Date date;
    private Group group;
    private String description ;
    private boolean status ;
    private int sesid ;
    private boolean responsed ;

    public boolean isResponsed() {
        return responsed;
    }

    public void setResponsed(boolean responsed) {
        this.responsed = responsed;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Lecturer getLecfrom() {
        return lecfrom;
    }

    public void setLecfrom(Lecturer lecfrom) {
        this.lecfrom = lecfrom;
    }

    public Lecturer getLecto() {
        return lecto;
    }

    public void setLecto(Lecturer lecto) {
        this.lecto = lecto;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public TimeSlot getSlot() {
        return slot;
    }

    public void setSlot(TimeSlot slot) {
        this.slot = slot;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean Status) {
        this.status = Status;
    }

    public int getSesid() {
        return sesid;
    }

    public void setSesid(int sesid) {
        this.sesid = sesid;
    }
    
    
}

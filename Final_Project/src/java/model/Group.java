/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author phuc2
 */
public class Group implements IBaseModel {
    private int id;
    private String name;
    private ArrayList<Student> studentList= new ArrayList<Student>();
    private Subject subject;
    private ArrayList<Session> sessionList= new ArrayList<Session>();
    private Instructor supervisor;

    public Instructor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Instructor supervisor) {
        this.supervisor = supervisor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Student> getStudentList() {
        return studentList;
    }

    public void setStudentList(ArrayList<Student> studentList) {
        this.studentList = studentList;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public ArrayList<Session> getSessionList() {
        return sessionList;
    }

    public void setSessionList(ArrayList<Session> sessionList) {
        this.sessionList = sessionList;
    }
    
}

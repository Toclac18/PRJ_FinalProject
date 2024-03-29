/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Session;
import model.Student;

/**
 *
 * @author phuc2
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendanceBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,\n"
                    + "	  ISNULL(a.status,0) as [status]\n"
                    + "	  ,ISNULL(a.description,'') as [description],\n"
                    + "	   ISNULL(a.att_datetime,GETDATE()) as att_datetime\n"
                    + "	  FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "									INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "									INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "									LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "	  WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setTime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    @Override
    public void insert(Attendance model) {

    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Attendance> getAttendanceByGroupID(int gid) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,\n"
                    + "	  ISNULL(a.status,0) as [status]\n"
                    + "	  ,ISNULL(a.description,'') as [description],\n"
                    + "	   ISNULL(a.att_datetime,GETDATE()) as att_datetime,\n"
                    + "    ses.isAtt                                        \n"
                    + "	  FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "									INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "									INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "									LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "	  WHERE g.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                Group g = new Group();
                g.setId(gid);
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setGroup(g);
                ses.setIsAtt(rs.getBoolean("isAtt"));
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setTime(rs.getTimestamp("att_datetime"));
                attendances.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public ArrayList<Float> absentPercentage(ArrayList<Student> students, ArrayList<Attendance> attendances, ArrayList<Session> sessions) {
        ArrayList<Float> percentages = new ArrayList<>();
        int numOfSession = sessions.size();
        for (Student stu : students) {
            int absent = 0;
            for (Attendance att : attendances) {
                if (stu.getId()==att.getStudent().getId()) {
                    if (!att.isStatus() && att.getSession().isIsAtt()) {
                        absent++;
                    }
                }
            }
            float decimal = (float) absent / numOfSession;
            float percent = decimal * 100;
            percentages.add(percent);
        }
        return percentages;
    }
}

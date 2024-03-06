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
import model.Group;
import model.Instructor;
import model.Subject;

/**
 *
 * @author phuc2
 */
public class GroupDBContext extends DBContext<Group> {

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Group> getByInstructorID(int iid) {
        ArrayList<Group> groupList= new ArrayList<>();
        try {
            String sql = "select g.gid, g.gname,g.subid,i.iname  \n"
                    + "from Instructor i, [Group] g\n"
                    + "where i.iid=g.sup_iis and i.iid=?";
            PreparedStatement stm= connection.prepareStatement(sql);
            stm.setInt(1, iid);
            ResultSet rs= stm.executeQuery();
            while(rs.next())
            {
                Group g= new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                Subject sub= new Subject();
                sub.setId(rs.getInt("subid"));
                g.setSubject(sub);
                Instructor i= new Instructor();
                i.setId(iid);
                i.setName(rs.getString("iname"));
                g.setSupervisor(i);
                groupList.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groupList;
    }
}

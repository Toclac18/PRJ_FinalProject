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
import model.Instructor;
import model.User;

/**
 *
 * @author phuc2
 */
public class InstructorDBContext extends DBContext<Instructor> {

    @Override
    public void insert(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Instructor get(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Instructor> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Instructor getByUsename(String username) {
        try {
            String sql = "Select i.iid,i.iname,u. displayName,u.password,u.username\n"
                    + "from Instructor i, [User] u\n"
                    + "where i.iid=u.iid and u.username=?";
            PreparedStatement stm= connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs= stm.executeQuery();
            if(rs.next())
            {
                Instructor i= new Instructor();
                i.setId(rs.getInt("iid"));
                i.setName(rs.getString("iname"));
                User u= new User();
                u.setDisplayname("displayName");
                u.setPassword("password");
                u.setUsername(rs.getString("username"));
                i.setUser(u);
                return i;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InstructorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }

}

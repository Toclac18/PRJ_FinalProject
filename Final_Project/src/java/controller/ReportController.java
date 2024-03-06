/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Attendance;
import model.Group;
import model.Instructor;
import model.Session;
import model.Student;


public class ReportController extends HttpServlet {
   
    protected boolean checkAuthorization(int gid ,ArrayList<Group> gList)
    {
        for(Group g:gList)
        {
            if(gid==g.getId())
            {
                return true;
            }
        }
        return false;
    }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        GroupDBContext gdb= new GroupDBContext();
        HttpSession session= request.getSession();
        Instructor i= (Instructor) session.getAttribute("instructor");
        if(i==null)
        {
            response.sendRedirect("login");
        }
        else
        {
            int iid= i.getId();
            ArrayList<Group> groups= gdb.getByInstructorID(iid);
            request.setAttribute("groups", groups);

            if(request.getParameter("id")==null)
            {
                request.getRequestDispatcher("view/AttendanceReport.jsp").forward(request, response);
            }
            else
            {
                int gid= Integer.parseInt(request.getParameter("id"));
                if(!checkAuthorization(gid, groups))
                {
                    request.getRequestDispatcher("view/accessdenied.jsp").forward(request, response);
                }
                else
                {
                    SessionDBContext sedb= new SessionDBContext();
                    ArrayList<Session> sessions= sedb.getSessionsByGroupID(gid);

                    AttendanceDBContext adb= new AttendanceDBContext();
                    ArrayList<Attendance> attendances= adb.getAttendanceByGroupID(gid);

                    StudentDBContext stdb= new StudentDBContext();
                    ArrayList<Student> students= stdb.getStudentByGroupID(gid);

                    ArrayList<Float> percentages= adb.absentPercentage(students, attendances, sessions);

                    request.setAttribute("sessions", sessions);
                    request.setAttribute("attendances", attendances);
                    request.setAttribute("students", students);
                    request.setAttribute("percent", percentages);

                    request.getRequestDispatcher("view/AttendanceReport.jsp").forward(request, response);
                }               
            }      
        }
        
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

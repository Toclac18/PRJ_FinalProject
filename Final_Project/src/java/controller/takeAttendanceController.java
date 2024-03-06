/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
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
import model.Instructor;
import model.Session;
import model.Student;



public class takeAttendanceController extends HttpServlet {

    protected boolean checkAuthorization(int sesid ,ArrayList<Session> sesList)
    {
        for(Session ses:sesList)
        {
            if(sesid==ses.getId())
            {
                return true;
            }
        }
        return false;
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession();
        Instructor i =(Instructor) session.getAttribute("instructor");
        if(i==null)
        {
            response.sendRedirect("login");
        }
        else
        {
            SessionDBContext db = new SessionDBContext();
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Session> sesList= db.getSessionsByInstructorID(i.getId());
            if(!checkAuthorization(id, sesList))
            {
                request.getRequestDispatcher("view/accessdenied.jsp").forward(request, response);
            }
            else
            {
                Session ses = db.getSessionByID(id);
                request.setAttribute("ses",ses);

                AttendanceDBContext attDb = new AttendanceDBContext();
                ArrayList<Attendance> atts = attDb.getAttendanceBySession(id);

                request.setAttribute("atts", atts);
                request.getRequestDispatcher("view/takeAttendance.jsp").forward(request, response); 
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        String[] stuids = request.getParameterValues("stuid");
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            a.setSession(ses);
            Student s = new Student();
            s.setId(Integer.parseInt(stuid));
            a.setStudent(s);
            a.setStatus(request.getParameter("status"+stuid).equals("present"));
            a.setDescription(request.getParameter("description"+stuid));
            ses.getAtts().add(a);
        }
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendences(ses);
        
        HttpSession session= request.getSession();
        Instructor instructor=(Instructor) session.getAttribute("instructor");
        String week=(String) session.getAttribute("week");
        if(week==null)
        {
            response.sendRedirect("timetable?id="+instructor.getId());
        }
        else
        {
            response.sendRedirect("timetable?id="+instructor.getId()+"&weekInput="+week);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

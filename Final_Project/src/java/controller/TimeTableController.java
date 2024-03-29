/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Instructor;
import model.Session;
import model.TimeSlot;
import ulti.DateUtils;
import static ulti.DateUtils.getSQLDatesBetween;



public class TimeTableController extends HttpServlet {

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
        HttpSession session= request.getSession();
        Instructor i =(Instructor) session.getAttribute("instructor");
        if(i==null)
        {
            response.sendRedirect("login");
        }
        else
        {
            int id = Integer.parseInt(request.getParameter("id"));
            if(id!=i.getId())
            {
                request.getRequestDispatcher("view/accessdenied.jsp").forward(request, response);
            }
            else
            {
                String week = request.getParameter("weekInput");
                String s_from = DateUtils.getFirstDayOfWeek(week);
                String s_to = DateUtils.getLastDayOfWeek(week);
                ArrayList<Date> dates = new ArrayList<>();
                if(s_from ==null)// this week
                {
                    dates = (ArrayList<Date>) DateUtils.getDatesOfCurrentWeek();
                }
                else
                {
                    try {
                        dates = (ArrayList<Date>) getSQLDatesBetween(s_from,s_to);
                    } catch (ParseException ex) {
                        Logger.getLogger(TimeTableController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                Date from = dates.get(0);
                Date to = dates.get(dates.size()-1);

                TimeSlotDBContext timeDB = new TimeSlotDBContext();
                ArrayList<TimeSlot> slots = timeDB.list();

                SessionDBContext sesDB = new SessionDBContext();
                ArrayList<Session> sessions = sesDB.getSessions(id, from, to);

                request.setAttribute("slots", slots);
                request.setAttribute("dates", dates);
                request.setAttribute("from", from);
                request.setAttribute("to", to);
                request.setAttribute("sessions", sessions);
                session.setAttribute("week", week);
                request.getRequestDispatcher("view/timeTable.jsp").forward(request, response);
            }
            
        }
        
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
        processRequest(request, response);
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
        processRequest(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Support;

import DAL.FeedbackDAO;
import DAL.UserDAO;
//import Model.FeedbackDashboard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
@WebServlet(name="GetSupportDashBoardInfo", urlPatterns={"/SupportDashboard"})
public class GetSupportDashboardInfo extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            FeedbackDAO fbDAO = new FeedbackDAO();
            UserDAO uDAO = new UserDAO();
            int totalFb = fbDAO.getFeedback().size();
            int totalCus = uDAO.getAllCustomers().size();
            int handle = fbDAO.getFeedbackByStatus0().size();
            Double avg = fbDAO.AvgRating();
            
            request.setAttribute("totalFb", totalFb);
            request.setAttribute("totalCus", totalCus);
            request.setAttribute("handle", handle);
            request.setAttribute("avg", avg);

            request.getRequestDispatcher("SupportDashboard.jsp").forward(request, response);
        }
    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            FeedbackDAO fbDAO = new FeedbackDAO();
            UserDAO uDAO = new UserDAO();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            
            int totalFb = fbDAO.getFeedback().size();
            int totalCus = uDAO.getAllCustomers().size();
            int handle = fbDAO.getFeedbackByStatus0().size();
            Double avg = fbDAO.AvgRating();
            int[] fb = fbDAO.getDashboardFb();
            int[] res = fbDAO.getDashboardRes();
            String[] month = fbDAO.getDashboardMonth();
            
            
            request.setAttribute("now", dtf.format(now));
            request.setAttribute("fb", fb);
            request.setAttribute("res", res);
            request.setAttribute("month", month);
            request.setAttribute("totalFb", totalFb);
            request.setAttribute("totalCus", totalCus);
            request.setAttribute("handle", handle);
            request.setAttribute("avg", avg);

            request.getRequestDispatcher("SupportDashboard.jsp").forward(request, response);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            FeedbackDAO fbDAO = new FeedbackDAO();
            UserDAO uDAO = new UserDAO();
            int totalFb = fbDAO.getFeedback().size();
            int totalCus = uDAO.getAllCustomers().size();
            int handle = fbDAO.getFeedbackByStatus0().size();
            Double avg = fbDAO.AvgRating();
            int[] fb = fbDAO.getDashboardFb();
            int[] res = fbDAO.getDashboardRes();
            String[] month = fbDAO.getDashboardMonth();
            
            
            request.setAttribute("fb", fb);
            request.setAttribute("res", res);
            request.setAttribute("month", month);
            request.setAttribute("totalFb", totalFb);
            request.setAttribute("totalCus", totalCus);
            request.setAttribute("handle", handle);
            request.setAttribute("avg", avg);

            request.getRequestDispatcher("SupportDashboard.jsp").forward(request, response);

        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

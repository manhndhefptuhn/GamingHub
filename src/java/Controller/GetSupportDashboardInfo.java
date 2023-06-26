/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.FeedbackDAO;
import DAL.UserDAO;
import Model.Feedback;
import Model.FeedbackDashboard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name="GetSupportDashboardInfo", urlPatterns={"/GetSupportDashboardInfo"})
public class GetSupportDashboardInfo extends HttpServlet {
   

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//        FeedbackDAO fb = new FeedbackDAO();
//
//        List<FeedbackDashboard> lst = fb.getFeedbackDashboardInfo();
//           
//        request.setAttribute("lst", lst);
//        request.getRequestDispatcher("supportDashboard.jsp").forward(request, response);
//
//        }
//    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            FeedbackDAO fb = new FeedbackDAO();

        List<FeedbackDashboard> lst = fb.getFeedbackDashboardInfo();
           
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("supportDashboard.jsp").forward(request, response);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            FeedbackDAO fb = new FeedbackDAO();

        List<FeedbackDashboard> lst = fb.getFeedbackDashboardInfo();
           
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("supportDashboard.jsp").forward(request, response);

        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

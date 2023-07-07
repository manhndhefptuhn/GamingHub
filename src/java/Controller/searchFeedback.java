/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAL.FeedbackDAO;
import Model.Feedback;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name="searchFeedback", urlPatterns={"/searchFeedback"})
public class searchFeedback extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchFeedback</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchFeedback at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 


    
    //Search
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {       
        response.setContentType("text/html;charset=UTF-8");
        FeedbackDAO u = new FeedbackDAO();
        //get list with param from search
        String xName = request.getParameter("name").trim();  
        
        if(xName.equalsIgnoreCase("")){
            List<Feedback> lst = u.getFeedback();/////default list
            request.setAttribute("lst", lst);
            request.setAttribute("search", xName);
            request.getRequestDispatcher("supportFeedbackList.jsp").forward(request, response);
        }
        else{
            List<Feedback> lst = u.getFeedbackWithName(xName);/////with name
            request.setAttribute("lst", lst);
            request.setAttribute("search", xName);
            request.getRequestDispatcher("supportFeedbackList.jsp").forward(request, response);
        }


        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

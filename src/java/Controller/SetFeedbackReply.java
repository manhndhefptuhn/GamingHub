/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.FeedbackReplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class SetFeedbackReply extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            
            
            
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        

    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        response.setCharacterEncoding("UTF-8");
        String reply = request.getParameter("reply");
        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        PrintWriter out = response.getWriter();
        FeedbackReplyDAO fbrDAO = new FeedbackReplyDAO();
        
        fbrDAO.SetResponse(feedbackId, userId, reply);

        
        
        
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Support Response</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h3>Update successfully</h3>");
            out.println("<a href =\"GetFeedbackList\">Back to list</a>");
            out.println("</body>");
            out.println("</html>");
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

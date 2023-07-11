/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.PasswordResetDAO;
import DAL.UserDAO;
import Model.User;
import Service.RandomPassword;
import Service.SendEmail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Zarius
 */
public class RegisterController extends HttpServlet {

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
        try {
            if (request.getParameter("agree-term") == null) {
                request.setAttribute("notification", "You must accept to terms and conditions");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");

            RandomPassword rdpw = new RandomPassword();
            String password = rdpw.generatePassword();
            PasswordResetDAO pwrsDAO = new PasswordResetDAO();
            UserDAO uDAO = new UserDAO();
            SendEmail se = new SendEmail();

            User u = uDAO.checkUserExist(email);
            boolean emailSent;
            int row, registerUserID;
            
            if (!phoneNum.matches("[0-9]*")) {
                request.setAttribute("notification", "Your Phone Number is Invalid");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            } else if (u == null) {
                emailSent = se.sendPassword(email, password, fullName, "Request to Register");
                if (emailSent) {
                    registerUserID = uDAO.register(fullName, email, password, phoneNum, address);
                    row = pwrsDAO.resetPassword(registerUserID, password);
                    request.setAttribute("email", email);
                    request.setAttribute("notification", "Sign Up successfully, please check your email for password");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else {
                    throw new Exception();
                }
            } else {
                request.setAttribute("notification", "Email is used, please enter again");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle any exception that occurs during processing
            e.printStackTrace(); // Print the exception details (for debugging purposes)
            request.setAttribute("notification", "An error occurred while processing your request");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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

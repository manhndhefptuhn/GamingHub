/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.PasswordResetDAO;
import DAO.UserDAO;
import Model.PasswordReset;
import Model.User;
import Service.PasswordUtils;
import Service.RandomPassword;
import Service.SendEmail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Zarius
 */
public class forgetPassController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String email = request.getParameter("email");

            PasswordResetDAO pwrsDAO = new PasswordResetDAO();
            UserDAO uDAO = new UserDAO();
            User user = uDAO.checkUserExist(email);

            SendEmail se = new SendEmail();
            RandomPassword rdpw = new RandomPassword();
            PasswordUtils pwutl = new PasswordUtils();

            boolean emailSent;

            String resetPassword = rdpw.generatePassword();
            String defaultPassword = "1234@1234a";
            String hashResetPassword = pwutl.hashPassword(resetPassword);
            String hashResetDefaultPassword = pwutl.hashPassword(defaultPassword);
            //If email not exist
            if (user == null) {
                request.setAttribute("notification", "Email is not exist");
                request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
            } else {
                //if email exist and user is customer
                if (user.getRole_ID() == 1) {
                    //send random generated password
                    emailSent = se.sendPassword(email, resetPassword, user.getFullName(), "Request new password");
                    //check if their is a record in password reset table
                    PasswordReset pwrs = pwrsDAO.checkExistRecord(user.getUser_ID());
                    if (emailSent) {
                        //if email is sent and exists record
                        if (pwrs != null) {
                            //update the password in password reset table with new generated password been hashed
                            pwrsDAO.updateResetPassword(pwrs.getResetID(), hashResetPassword);
                            //update user with new generated password been hashed
                            uDAO.changePassword(user.getUser_ID(), hashResetPassword);
                            request.setAttribute("notification", "New password is sent, please login again");
                            request.setAttribute("email", email);
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        } else {
                            //if not exist insert into table password reset with new generated password been hashed and current timestamp
                            pwrsDAO.resetPassword(user.getUser_ID(), hashResetPassword);
                            //update user with new generated password been hashed
                            uDAO.changePassword(user.getUser_ID(), hashResetPassword);
                            request.setAttribute("notification", "New password is sent, please check email and login again");
                            request.setAttribute("email", email);
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        }
                    } else {
                        throw new Exception();
                    }
                } else {
                    //if not customer send default password 
                    emailSent = se.sendDefaultPass(email, defaultPassword, user.getFullName());
                    if (emailSent) {
                        //if email sent update user with default password hashed
                        uDAO.changePassword(user.getUser_ID(), hashResetDefaultPassword);
                        request.setAttribute("email", email);
                        request.setAttribute("notification", "Password is set to default, please check email and login again");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    } else {
                        throw new Exception();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("notification", "There something wrong at out server, please try again");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
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

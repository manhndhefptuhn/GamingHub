/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.PasswordResetDAO;
import DAL.UserDAO;
import Model.PasswordReset;
import Model.User;
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forgetPassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgetPassController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");

        PasswordResetDAO pwrsDAO = new PasswordResetDAO();
        UserDAO uDAO = new UserDAO();
        User user = uDAO.checkUserExist(email);

        SendEmail se = new SendEmail();
        RandomPassword rdpw = new RandomPassword();

        boolean emailSent;

        String resetPassword = rdpw.generatePassword();
        String defaultPassword = "1234@1234a";

        if (user == null) {
            request.setAttribute("notification", "Email is not exist");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        } else {
            if (user.getRole_ID() == 1) {
                emailSent = se.sendPassword(email, resetPassword, user.getFullName(), "request new password");
                PasswordReset pwrs = pwrsDAO.checkExistRecord(user.getUser_ID());
                if (emailSent) {
                    if (pwrs != null) {
                        pwrsDAO.updateResetPassword(pwrs.getResetID(), resetPassword);
                        uDAO.changePassword(user.getUser_ID(), resetPassword);
                        request.setAttribute("notification", "New password is sent, please login again");
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    } else {
                        pwrsDAO.resetPassword(user.getUser_ID(), resetPassword);
                        uDAO.changePassword(user.getUser_ID(), resetPassword);
                        request.setAttribute("notification", "New password is sent, please login again");
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("notification", "There something wrong at out server, please try again");
                    request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                }
            } else {
                emailSent = se.sendDefaultPass(email, defaultPassword, user.getFullName());
                if (emailSent) {
                    uDAO.changePassword(user.getUser_ID(), defaultPassword);
                    request.setAttribute("email", email);
                    request.setAttribute("notification", "Password is set to default, please check email and login again");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else {
                    request.setAttribute("notification", "There something wrong at out server, please try again");
                    request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                }
            }
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.PasswordResetDAO;
import DAL.UserDAO;
import Model.PasswordReset;
import Model.User;
import Service.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Zarius
 */
public class ChangePassController extends HttpServlet {

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
            HttpSession session = request.getSession();
            String oldPassLogin = request.getParameter("oldPassLogin");
            String newPass = request.getParameter("newPass");
            String reNewPass = request.getParameter("reNewPass");
            //id of user who login with their new generated password
            String userChangeIDForm = request.getParameter("userChangeID");
            int userChangeID = 0;
            if (userChangeIDForm != null) {
                userChangeID = Integer.parseInt(userChangeIDForm);
            }
            UserDAO uDAO = new UserDAO();
            PasswordUtils pwutl = new PasswordUtils();

            //get user when login and change pass in user profile
            User u = (User) session.getAttribute("user");

            //get user who login with new generated password
            User userChange = uDAO.getUserByID(userChangeID);
            PasswordResetDAO pwrsDAO = new PasswordResetDAO();
            //if login from login form with new generated password
            if (userChange != null) {
                //check the record of user in password reset table
                PasswordReset pwrs = pwrsDAO.checkExistRecord(userChange.getUser_ID());
                //if re enter passsword is different from new password
                if (!newPass.equals(reNewPass)) {
                    request.setAttribute("notification", "The new password you just enter is not match! Please enter again");
                    request.setAttribute("userChangeID", userChange.getUser_ID());
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                    //check for length of the password
                } else if (newPass.length() <= 8 || newPass.length() > 32) {
                    request.setAttribute("notification", "Your password must greater than 8 and smaller than 32 characters");
                    request.setAttribute("userChangeID", userChange.getUser_ID());
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                    //check if there is a request in table passwordReset and new pass is equals to password in password reset
                } else if (pwrs != null && pwutl.checkPassword(newPass, pwrs.getResetPassword())) {
                    request.setAttribute("notification", "The old and new password is the same");
                    request.setAttribute("userChangeID", userChange.getUser_ID());
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                    //else it is not equals
                } else if (pwrs != null && !pwutl.checkPassword(newPass, pwrs.getResetPassword())) {
                    //delete the record with the userID in passwordReset table
                    pwrsDAO.deleteRecord(userChange.getUser_ID());
                    //change the password of the user
                    uDAO.changePassword(userChange.getUser_ID(), pwutl.hashPassword(newPass));
                    request.setAttribute("email", userChange.getEmail());
                    request.setAttribute("notification", "Change password successfully, please login again");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                    //else if not in password reset table (for another role except customer)
                } else if (pwrs == null && pwutl.checkPassword(newPass, userChange.getPassword())) {
                    request.setAttribute("notification", "The old and new password is the same");
                    request.setAttribute("userChangeID", userChange.getUser_ID());
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                    //change password for role not customer
                } else if (pwrs == null && !pwutl.checkPassword(newPass, userChange.getPassword())) {
                    uDAO.changePassword(userChange.getUser_ID(), pwutl.hashPassword(newPass));
                    request.setAttribute("email", userChange.getEmail());
                    request.setAttribute("notification", "Change password successfully, please login again");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                //if already login and change password in profile
            } else if (u != null) {
                User currentUser = uDAO.getUser(u.getUser_ID(), oldPassLogin);
                //check if the old password is correct
                if (currentUser == null) {
                    request.setAttribute("notification", "The old password is wrong");
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                } else if (!newPass.equals(reNewPass)) {
                    request.setAttribute("notification", "The new password you just enter is not match! Please enter again");
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                } else if (newPass.length() <= 8 || newPass.length() > 32) {
                    request.setAttribute("notification", "Your password must greater than 8 and smaller than 32 characters");
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                } else if (pwutl.checkPassword(newPass, currentUser.getPassword())) {
                    request.setAttribute("notification", "The old and new password is the same");
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                } else {
                    uDAO.changePassword(currentUser.getUser_ID(), pwutl.hashPassword(newPass));
                    request.setAttribute("notification", "Change password successfully");
                    request.getRequestDispatcher("userProfile").forward(request, response);
                }
            }
        } catch (Exception e) {
            // Handle any exception that occurs during processing
            e.printStackTrace(); // Print the exception details (for debugging purposes)
            request.setAttribute("notification", "An error occurred while processing your request");
            request.getRequestDispatcher("changePass.jsp").forward(request, response);
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

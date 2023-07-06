/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.PasswordResetDAO;
import DAL.UserDAO;
import Model.PasswordReset;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import static java.lang.System.currentTimeMillis;
import java.sql.Timestamp;

/**
 *
 * @author Zarius
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PasswordResetDAO pwrsDAO = new PasswordResetDAO();
        UserDAO uDAO = new UserDAO();

        User u = uDAO.login(email, password);
        String defaultPassword = "1234@1234a";
        long thirtyMinutesMillis;

        if (u == null) {
            request.setAttribute("notification", "Wrong email or password, please try again");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            PasswordReset pwrs = pwrsDAO.checkExistRecord(u.getUser_ID());
            if (u.isStatus() != true) {
                request.setAttribute("notification", "User is inactive");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if (pwrs != null) {
                long currentTimeMillis = System.currentTimeMillis();
                Timestamp currentTime = new Timestamp(currentTimeMillis);
                thirtyMinutesMillis = 30 * 60 * 1000L; // 30 minutes in milliseconds
                Timestamp expiryTime = new Timestamp(pwrs.getTimeCreated().getTime() + thirtyMinutesMillis);
                if (currentTime.after(expiryTime) && u.getRole_ID() == 1) {
                    request.setAttribute("email", email);
                    request.setAttribute("notification", "Your password is expired, please request password again");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else if (currentTime.before(expiryTime) && u.getRole_ID() == 1) {
                    session.setAttribute("userChange", u);
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                }
<<<<<<< HEAD
            } else if (password.equals(defaultPassword) && u.getRole_ID() == 2 ||password.equals(defaultPassword) && u.getRole_ID() == 3 ||password.equals(defaultPassword) && u.getRole_ID() == 4)  {
=======
            } else if (password.equals(defaultPassword) && u.getRole_ID() == 2 || u.getRole_ID() == 3 || u.getRole_ID() == 4) {
>>>>>>> parent of 8501e4b (update wishlist, cart)
                session.setAttribute("userChange", u);
                request.getRequestDispatcher("changePass.jsp").forward(request, response);
            } else {
                session.removeAttribute("userChange");
                session.setAttribute("user", u);
                request.getRequestDispatcher("home").forward(request, response);
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

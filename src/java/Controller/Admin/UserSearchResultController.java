/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.UserDAO;
import Model.SearchCriteria;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author AN515-57
 */
public class UserSearchResultController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        UserDAO uDAO = new UserDAO();

        String searchID = request.getParameter("searchID");
        String searchFullName = request.getParameter("searchFullName");
        String searchEmail = request.getParameter("searchEmail");
        String searchPhoneNumber = request.getParameter("searchPhoneNumber");
        String searchAddress = request.getParameter("searchAddress");

        // Create an empty search criteria object
        SearchCriteria criteria = new SearchCriteria();

        // Populate the search criteria object with the provided values
        if (searchID != null && !searchID.isEmpty()) {
            criteria.setID(searchID);
        }
        if (searchFullName != null && !searchFullName.isEmpty()) {
            criteria.setFullName(searchFullName);
        }
        if (searchEmail != null && !searchEmail.isEmpty()) {
            criteria.setEmail(searchEmail);
        }
        if (searchPhoneNumber != null && !searchPhoneNumber.isEmpty()) {
            criteria.setPhoneNumber(searchPhoneNumber);
        }
        if (searchAddress != null && !searchAddress.isEmpty()) {
            criteria.setAddress(searchAddress);
        }

        // Query the database to retrieve users based on the search criteria
        List<User> userSearchResultList = uDAO.getUsersByCriteria(criteria);

        // Set the userList as a request attribute
        request.setAttribute("userSearchResultList", userSearchResultList);

        // Forward the request to the JSP page to display the search results
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserSearchResult.jsp");
        dispatcher.forward(request, response);
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

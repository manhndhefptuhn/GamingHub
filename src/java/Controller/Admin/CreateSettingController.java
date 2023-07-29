/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.CategoryDAO;
import DAO.RoleDAO;
import Model.Category;
import Model.Roles;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Zarius
 */
public class CreateSettingController extends HttpServlet {

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
            out.println("<title>Servlet CreateSettingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateSettingController at " + request.getContextPath() + "</h1>");
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
        String type = request.getParameter("type");
        try {
            if (type.equalsIgnoreCase("role")) {
                String name = request.getParameter("name");
                Boolean status = Boolean.parseBoolean(request.getParameter("status"));
                
                Roles role = new Roles();
                role.setRoleName(name);
                role.setStatus(status);
                RoleDAO rDAO = new RoleDAO();

                int rowsAffected = rDAO.createRole(role);
                if (rowsAffected > 0) {
                    request.setAttribute("notification", "Create role successfully");
                    request.getRequestDispatcher("adminSettingController").forward(request, response);
                } else {
                    throw new Exception();
                }
            } else if (type.equalsIgnoreCase("category")) {
                String name = request.getParameter("name");
                Boolean status = Boolean.parseBoolean(request.getParameter("status"));

                Category category = new Category();
                category.setCategoryName(name);
                category.setStatus(status);

                CategoryDAO cDAO = new CategoryDAO();

                int rowsAffected = cDAO.createCategory(category);
                if (rowsAffected > 0) {
                    request.setAttribute("notification", "Create category successfully");
                    request.getRequestDispatcher("adminSettingController").forward(request, response);
                } else {
                    throw new Exception();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.jsp").forward(request, response);
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

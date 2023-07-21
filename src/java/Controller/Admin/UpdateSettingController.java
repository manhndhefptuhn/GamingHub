/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.CategoryDAO;
import DAL.RoleDAO;
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
public class UpdateSettingController extends HttpServlet {

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
            out.println("<title>Servlet UpdateSettingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSettingController at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        String action = request.getParameter("action");
        if (action != null && action.equals("back")) {
            response.sendRedirect("adminSettingController");
        } else {
            if (type.equalsIgnoreCase("role")) {
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String roleName = request.getParameter("roleName");
                boolean status = Boolean.valueOf(request.getParameter("status"));

                Roles updatedRole = new Roles();
                updatedRole.setRoleID(roleID);
                updatedRole.setRoleName(roleName);
                updatedRole.setStatus(status);

                RoleDAO rDAO = new RoleDAO();
                int rowsAffected = rDAO.editRoleInfo(updatedRole);
                if (rowsAffected > 0) {
                    request.setAttribute("notification", "Update role successfully");
                    request.getRequestDispatcher("settingDetail?type=role&id=" + roleID + "").forward(request, response);
                } else {
                    request.setAttribute("notification", "There something wrong, please try again later");
                    request.getRequestDispatcher("settingDetail?type=role&id=" + roleID + "").forward(request, response);
                }
            } else if (type.equalsIgnoreCase("category")) {
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                String categoryName = request.getParameter("categoryName");
                boolean status = Boolean.valueOf(request.getParameter("status"));

                Category updatedCategory = new Category();
                updatedCategory.setCategoryID(categoryID);
                updatedCategory.setCategoryName(categoryName);
                updatedCategory.setStatus(status);

                CategoryDAO cDAO = new CategoryDAO();
                int rowsAffected = cDAO.editCategoryInfo(updatedCategory);
                if (rowsAffected > 0) {
                    request.setAttribute("notification", "Update category successfully");
                    request.getRequestDispatcher("settingDetail?type=category&id=" + categoryID + "").forward(request, response);
                } else {
                    request.setAttribute("notification", "There something wrong, please try again later");
                    request.getRequestDispatcher("settingDetail?type=category&id=" + categoryID + "").forward(request, response);
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

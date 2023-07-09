/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.UserDAO;
import Model.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author Zarius
 */
public class UpdateUserProfileController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (request.getParameter("update") != null) {
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            int userID = Integer.parseInt(request.getParameter("userID"));
            // Process the image file
            Part imagePart = request.getPart("image");
            long maxSizeBytes = 5 * 1024 * 1024; // 5 MB
            UserDAO uDAO = new UserDAO();
            // Check if an image was uploaded
            if (imagePart != null && imagePart.getSize() < maxSizeBytes) {
                // Generate a unique image name
                String originalFilename = imagePart.getSubmittedFileName();
                String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
                String uniqueImageName = System.currentTimeMillis() + extension;
                ServletContext context = getServletContext();

                // Get the real path to the project folder
                String projectFolderPath = context.getRealPath("/img");
                System.out.println(projectFolderPath);
                // Specify the directory to save the image
                String uploadDirectory = projectFolderPath + "/avatar/";
                File directory = new File(uploadDirectory);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                // Create the destination file path
                String destinationFilePath = uploadDirectory + uniqueImageName;
                System.out.println(destinationFilePath);
                // Save the uploaded image to the destination path
                imagePart.write(destinationFilePath);

                String imagePath = "img/avatar/" + uniqueImageName;
                uDAO.updateUserProfile(fullName, phone, address, imagePath, userID);
                User u = uDAO.getUserByID(userID);
                session.setAttribute("user", u);
                request.setAttribute("notification", "Update Information Successfully!");
                request.getRequestDispatcher("userProfile").forward(request, response);
            }else{
                request.setAttribute("notification", "The images size is too large. Please insert smaller size!");
                request.getRequestDispatcher("userProfile").forward(request, response);
            }
        } else if (request.getParameter("changePass") != null) {
            response.sendRedirect("changePass.jsp");
        } else if (request.getParameter("backToHome") != null) {
            response.sendRedirect("home");
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

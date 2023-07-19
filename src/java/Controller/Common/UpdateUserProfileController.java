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
@MultipartConfig
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String imagePath = "", extension = "";
        String action = request.getParameter("action");
        try {
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
                if (imagePart != null && imagePart.getSize() < maxSizeBytes && imagePart.getSize() > 0) {
                    // Generate a unique image name
                    String originalFilename = imagePart.getSubmittedFileName();
                    int extensionIndex = originalFilename.lastIndexOf('.');
                    if (extensionIndex >= 0) {
                        extension = originalFilename.substring(extensionIndex);
                    }
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
                    // Save the uploaded image to the destination path
                    imagePart.write(destinationFilePath);

                    imagePath = "img/avatar/" + uniqueImageName;
                }else{
                    User user = (User)session.getAttribute("user");
                    imagePath = user.getProfile_picture();
                }
                int row = uDAO.updateUserProfile(fullName, phone, address, imagePath, userID);
                if (row >= 1) {
                    User u = uDAO.getUserByID(userID);
                    session.setAttribute("user", u);
                    request.setAttribute("notification", "Update Information Successfully!");
                    request.getRequestDispatcher("userProfile").forward(request, response);
                } else {
                    request.setAttribute("notification", "An error occurred. Please try again.");
                    request.getRequestDispatcher("userProfile").forward(request, response);
                }
            } else if (action != null && action.equals("changePass")) {
                response.sendRedirect("changePass.jsp");
            } else if (action != null && action.equals("back")) {
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("notification", "An error occurred. Please try again.");
            request.getRequestDispatcher("userProfile").forward(request, response);
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

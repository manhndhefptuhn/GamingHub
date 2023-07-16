/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.SliderDAO;
import DAL.UserDAO;
import Model.Slider;
import Model.User;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Zarius
 */
@MultipartConfig
public class CreateUserController extends HttpServlet {

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
        //attribute
        String email = request.getParameter("email");

        UserDAO uDAO = new UserDAO();
        User user = uDAO.checkUserExist(email);
        if (user != null) {
            request.setAttribute("notification", "User with email exists, please try another email");
            request.getRequestDispatcher("addUser").forward(request, response);
        } else {
            String name = request.getParameter("fullName");
            String password = request.getParameter("password");
            Part image = request.getPart("profilePicture");
            String phoneNumber = request.getParameter("phone");
            String address = request.getParameter("address");
            boolean status = Boolean.valueOf(request.getParameter("status"));
            int roleID = Integer.parseInt(request.getParameter("role"));
            String imagePath = "", extension = "";

            if (image != null) {
                // Generate a unique image name
                String originalFilename = image.getSubmittedFileName();
                int extensionIndex = originalFilename.lastIndexOf('.');
                if (extensionIndex >= 0) {
                    extension = originalFilename.substring(extensionIndex);
                }
                String uniqueImageName = System.currentTimeMillis() + extension;
                ServletContext context = getServletContext();

                // Get the real path to the project folder
                String projectFolderPath = context.getRealPath("/img");
                // Specify the directory to save the image
                String uploadDirectory = projectFolderPath + "/avatar/";
                File directory = new File(uploadDirectory);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                // Create the destination file path
                String destinationFilePath = uploadDirectory + uniqueImageName;
                // Save the uploaded image to the destination path
                image.write(destinationFilePath);

                imagePath = "img/avatar/" + uniqueImageName;
            }
            User u = new User();
            u.setEmail(email);
            u.setFullName(name);
            u.setPassword(password);
            u.setPhone_Number(phoneNumber);
            u.setProfile_picture(imagePath);
            u.setAddress(address);
            u.setStatus(status);
            u.setRole_ID(roleID);

            int rowsAffected = uDAO.createUser(u);
            if (rowsAffected > 0) {
                request.setAttribute("notification", "Create User Successsfully");
                request.getRequestDispatcher("userList").forward(request, response);
            } else {
                request.setAttribute("notification", "Something wrong, please try again");
                request.getRequestDispatcher("userList").forward(request, response);
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

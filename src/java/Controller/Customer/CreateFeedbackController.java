/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAL.FeedbackDAO;
import Model.User;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Zarius
 */
@MultipartConfig
public class CreateFeedbackController extends HttpServlet {

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
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        HttpSession session = request.getSession();
        try {
            String imagePath = "", extension = "";
            if (request.getParameter("create") != null) {
                int row;
                FeedbackDAO fDAO = new FeedbackDAO();
                User u = (User) session.getAttribute("user");
                String content = request.getParameter("content");
                int rating = Integer.parseInt(request.getParameter("rating"));
                Part imagePart = request.getPart("feedbackPicture");
                if (imagePart != null) {
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
                    // Specify the directory to save the image
                    String uploadDirectory = projectFolderPath + "/feedback/";
                    File directory = new File(uploadDirectory);
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }
                    // Create the destination file path
                    String destinationFilePath = uploadDirectory + uniqueImageName;
                    // Save the uploaded image to the destination path
                    imagePart.write(destinationFilePath);
                    imagePath = "img/feedback/" + uniqueImageName;
                }
                row = fDAO.createFeedback(u.getUser_ID(), productID, content, imagePath, rating);
                if (row >= 1) {
                    session.setAttribute("notification", "Feedback about the product successfully");
                    request.getRequestDispatcher("orderDetail?id=" + orderID + "").forward(request, response);
                } else {
                    throw new Exception();
                }
            } else if (request.getParameter("back") != null) {
                request.getRequestDispatcher("orderDetail?id=" + orderID + "").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("wrongNotification", "There's something wrong, please try again");
            request.getRequestDispatcher("feedback?productID=" + productID + "&orderID=" + orderID + "").forward(request, response);
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

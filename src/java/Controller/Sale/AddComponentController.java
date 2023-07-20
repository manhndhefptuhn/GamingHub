/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Sale;

import DAL.ComponentDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddComponent", urlPatterns = {"/AddComponent"})
@MultipartConfig
public class AddComponentController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("SaleAddComponent.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) { 
            ComponentDAO cDAO = new ComponentDAO();
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String status = request.getParameter("status");
//            String image = request.getParameter("image");

            Part images = request.getPart("image");
            
            String imagePath = "", extension = "";        
            long maxSizeBytes = 5 * 1024 * 1024;        
            if (images != null && images.getSize() < maxSizeBytes) {
                    String originalFilename = images.getSubmittedFileName();
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
                    String uploadDirectory = projectFolderPath + "/case/";
                    File directory = new File(uploadDirectory);
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }

                    // Create the destination file path
                    String destinationFilePath = uploadDirectory + uniqueImageName;
                    // Save the uploaded image to the destination path
                    images.write(destinationFilePath);

                    imagePath = "img/case/" + uniqueImageName;
                                    
                }
            
            
            if(type.equalsIgnoreCase("case"))
                cDAO.addCase(type, name, price, status, imagePath);
            else
                cDAO.addComponent(type, name, price, status);
            request.setAttribute("notification", "Add successfully");
            request.getRequestDispatcher("componentList").forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("notification", "An error occurred. Please try again.");
            request.getRequestDispatcher("componentList").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.SliderDAO;
import Model.Slider;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;

/**
 *
 * @author Zarius
 */
@MultipartConfig
public class CreateSliderController extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        String imagePath = "", extension = "";
        if (request.getParameter("back") != null) {
            request.getRequestDispatcher("sliderList").forward(request, response);
        } else if (request.getParameter("create") != null) {
            //attribute
            String title = request.getParameter("title");
            Part sliderPicturePart = request.getPart("sliderPicture");
            String backlink = request.getParameter("backlink");
            String note = request.getParameter("note");
            Boolean status = Boolean.parseBoolean(request.getParameter("status"));

            if (sliderPicturePart != null) {
                // Generate a unique image name
                String originalFilename = sliderPicturePart.getSubmittedFileName();
                int extensionIndex = originalFilename.lastIndexOf('.');
                if (extensionIndex >= 0) {
                    extension = originalFilename.substring(extensionIndex);
                }
                String uniqueImageName = System.currentTimeMillis() + extension;
                ServletContext context = getServletContext();

                // Get the real path to the project folder
                String projectFolderPath = context.getRealPath("/img");
                // Specify the directory to save the image
                String uploadDirectory = projectFolderPath + "/slider/";
                File directory = new File(uploadDirectory);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                // Create the destination file path
                String destinationFilePath = uploadDirectory + uniqueImageName;
                System.out.println(destinationFilePath);
                // Save the uploaded image to the destination path
                sliderPicturePart.write(destinationFilePath);

                imagePath = "img/slider/" + uniqueImageName;
            }
            Slider createSlider = new Slider();
            createSlider.setSliderTitle(title);
            createSlider.setSliderImage(imagePath);
            createSlider.setBacklink(backlink);
            createSlider.setNote(note);
            createSlider.setStatus(status);

            SliderDAO sDAO = new SliderDAO();

            int rowsAffected = sDAO.createSlider(createSlider);
            if (rowsAffected > 0) {
                request.setAttribute("notification", "Create Slider Successsfully");
                request.getRequestDispatcher("sliderList").forward(request, response);
            } else {
                request.setAttribute("notification", "Something wrong, please try again");
                request.getRequestDispatcher("sliderList").forward(request, response);
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

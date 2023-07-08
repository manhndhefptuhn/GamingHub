/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.SliderDAO;
import Model.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

/**
 *
 * @author AN515-57
 */
@MultipartConfig
public class EditSliderController extends HttpServlet {

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
        int sliderID = Integer.parseInt(request.getParameter("sliderId"));
        String title = request.getParameter("title");
        
        Part sliderPicturePart = request.getPart("sliderPicture"); 
        String sliderPictureFileName = "";
        if (sliderPicturePart != null) {
            sliderPictureFileName = sliderPicturePart.getSubmittedFileName();
            String storagePath = "D:/SWP391_Project_UploadedProfilePicture/"; // Đường dẫn tới thư mục lưu trữ ảnh trên máy chủ
            String fullPath = storagePath + sliderPictureFileName;

            // Sao chép ảnh mới vào vị trí lưu trữ
            sliderPicturePart.write(fullPath);
        }
        
        String backlink = request.getParameter("backlink");
        String note = request.getParameter("note");
        boolean status = Boolean.valueOf(request.getParameter("status"));
        int updatedBy = Integer.parseInt(request.getParameter("updatedBy"));
        
        Slider updatedSlider = new Slider(); 
        updatedSlider.setSliderID(sliderID);
        updatedSlider.setSliderTitle(title);
        updatedSlider.setSliderImage(sliderPictureFileName);
        updatedSlider.setBacklink(backlink);
        updatedSlider.setNote(note);
        updatedSlider.setStatus(status);
        updatedSlider.setSliderID(sliderID);
        
        SliderDAO sDAO = new SliderDAO(); 
        int rowsAffected = sDAO.editSliderInfo(updatedSlider); 
        if (rowsAffected > 0){
            response.sendRedirect("viewSliderController");
        } else {
            response.sendRedirect("Home.jsp");
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

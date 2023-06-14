/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CPUDAO;
import DAL.RAMDAO;
import DAL.SliderDAO;
import DAL.VGADAO;
import Model.CPU;
import Model.RAM;
import Model.Slider;
import Model.VGA;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class HomeController extends HttpServlet {

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
        HttpSession session = request.getSession();
        SliderDAO slDAO = new SliderDAO();
        CPUDAO cDAO = new CPUDAO();
        RAMDAO rDAO = new RAMDAO();
        VGADAO vDAO = new VGADAO();
        
        //Slider
        ArrayList<Slider> listSlider = slDAO.getAllSlider();
        session.setAttribute("listSlider", listSlider);
        
        //CPU
        ArrayList<CPU> listThreeRandomCPU = cDAO.getThreeRandomCPU();
        session.setAttribute("threeCPU", listThreeRandomCPU);
        
        //VGA
        ArrayList<VGA> listThreeRandomVGA = vDAO.getThreeRandomVGA();
        session.setAttribute("threeVGA", listThreeRandomVGA);
        
        //RAM
        ArrayList<RAM> listThreeRandomRAM = rDAO.getThreeRandomRAM();
        session.setAttribute("threeRAM", listThreeRandomRAM);
        
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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

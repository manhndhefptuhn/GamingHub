/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAO.CPUDAO;
import DAO.CaseDAO;
import DAO.MainboardDAO;
import DAO.PSUDAO;
import DAO.RAMDAO;
import DAO.StorageDAO;
import DAO.VGADAO;
import Model.CPU;
import Model.Case;
import Model.Mainboard;
import Model.PSU;
import Model.RAM;
import Model.Storage;
import Model.VGA;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class ComponentListController extends HttpServlet {

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
        MainboardDAO mDAO = new MainboardDAO();
        ArrayList<Mainboard> listMainboard = mDAO.getAllMainboard();
        request.setAttribute("listMainboard", listMainboard);
        
        CPUDAO cpuDAO = new CPUDAO();
        ArrayList<CPU> listCPU = cpuDAO.getAllCPU();
        request.setAttribute("listCPU", listCPU);
        
        CaseDAO cDAO = new CaseDAO();
        ArrayList<Case> listCase = cDAO.getAllCase();
        request.setAttribute("listCase", listCase);
        
        PSUDAO psuDAO = new PSUDAO();
        ArrayList<PSU> listPSU = psuDAO.getAllPSU();
        request.setAttribute("listPSU", listPSU);
        
        RAMDAO rDAO = new RAMDAO();
        ArrayList<RAM> listRAM = rDAO.getAllRAM();
        request.setAttribute("listRAM", listRAM);
        
        StorageDAO sDAO = new StorageDAO();
        ArrayList<Storage> listStorage = sDAO.getAllStorage();
        request.setAttribute("listStorage", listStorage);
        
        VGADAO vgaDAO = new VGADAO();
        ArrayList<VGA> listVGA = vgaDAO.getAllVGA();
        request.setAttribute("listVGA", listVGA);
        
        request.getRequestDispatcher("SaleComponentList.jsp").forward(request, response);
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

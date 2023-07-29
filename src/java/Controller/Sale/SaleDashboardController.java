/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAO.CPUDAO;
import DAO.CaseDAO;
import DAO.DateDAO;
import DAO.MainboardDAO;
import DAO.OrderDAO;
import DAO.OrderStatusDAO;
import DAO.PSUDAO;
import DAO.RAMDAO;
import DAO.StorageDAO;
import DAO.VGADAO;
import Model.Chart;
import Model.Date;
import Model.OrderStatus;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Zarius
 */
public class SaleDashboardController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        int saleID = u.getUser_ID();
        DateDAO dd = new DateDAO();

        Date date = dd.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();

        String startDate = "";
        String endDate = "";
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        OrderStatusDAO orstDAO = new OrderStatusDAO();
        OrderDAO oDAO = new OrderDAO();
        ArrayList<OrderStatus> listOrderStatus = orstDAO.getAllOrderStatus();
        request.setAttribute("listOrderStatus", listOrderStatus);

        int totalOrder = oDAO.getTotalOrderBySale(saleID, start, end);
        request.setAttribute("totalOrder", totalOrder);

        Map<Integer, Integer> listNumberOfOrderByStatus = oDAO.getNumberOfOrderByStatus(listOrderStatus, saleID, start, end);
        request.setAttribute("listNumberOfOrderByStatus", listNumberOfOrderByStatus);

        int numberOfMainboard = new MainboardDAO().getAllMainboard().size();
        int numberOfCpu = new CPUDAO().getAllCPU().size();
        int numberOfRAM = new RAMDAO().getAllRAM().size();
        int numberOfVGA = new VGADAO().getAllVGA().size();
        int numberOfStorage = new StorageDAO().getAllStorage().size();
        int numberOfPSU = new PSUDAO().getAllPSU().size();
        int numberOfCase = new CaseDAO().getAllCase().size();
        int totalComponent = numberOfMainboard + numberOfCpu + numberOfRAM + numberOfVGA + numberOfStorage + numberOfPSU + numberOfCase;
        request.setAttribute("numberOfMainboard", numberOfMainboard);
        request.setAttribute("numberOfCpu", numberOfCpu);
        request.setAttribute("numberOfRAM", numberOfRAM);
        request.setAttribute("numberOfVGA", numberOfVGA);
        request.setAttribute("numberOfStorage", numberOfStorage);
        request.setAttribute("numberOfPSU", numberOfPSU);
        request.setAttribute("numberOfCase", numberOfCase);
        request.setAttribute("totalComponent", totalComponent);

        List<Chart> listChartRevenueArea = new ArrayList<>();
        int maxListChartRevenueArea = 0;

        if (startDate.equals("") && endDate.equals("")) {
            int day = dd.CountDayByStartEnd(start, end);

            listChartRevenueArea = oDAO.getChartRevenueAreaOfSale(saleID, start, day);

            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;
        } else if (!startDate.equals("") && !endDate.equals("")) {
            int day = dd.CountDayByStartEnd(startDate, endDate);

            listChartRevenueArea = oDAO.getChartRevenueAreaOfSale(saleID ,startDate, day);

            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

        }
        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        request.getRequestDispatcher("SaleDashboard.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SaleDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SaleDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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

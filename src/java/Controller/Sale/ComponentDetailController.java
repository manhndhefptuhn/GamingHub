/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAL.*;
import Model.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author admin
 */
@WebServlet(name = "componentdetail", urlPatterns = {"/componentdetail"})
@MultipartConfig
public class ComponentDetailController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ComponentDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ComponentDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        int id = Integer.parseInt(request.getParameter("id"));

        if (type.equalsIgnoreCase("mainboard")) {
            MainboardDAO mbDAO = new MainboardDAO();
            Mainboard mb = mbDAO.getMainboardByID(id);
            request.setAttribute("id", mb.getMainboardID());
            request.setAttribute("name", mb.getMainboardName());
            request.setAttribute("price", mb.getPrice());
            request.setAttribute("status", mb.isStatus());
        }
        if (type.equalsIgnoreCase("cpu")) {
            CPUDAO cDAO = new CPUDAO();
            CPU c = cDAO.getCPUByID(id);
            request.setAttribute("id", c.getCpuID());
            request.setAttribute("name", c.getCpuName());
            request.setAttribute("price", c.getPrice());
            request.setAttribute("status", c.isStatus());
        }
        if (type.equalsIgnoreCase("case")) {
            CaseDAO csDAO = new CaseDAO();
            Case cs = csDAO.getCaseByID(id);
            request.setAttribute("id", cs.getCaseID());
            request.setAttribute("name", cs.getCaseName());
            request.setAttribute("price", cs.getPrice());
            request.setAttribute("status", cs.isStatus());
            request.setAttribute("image", cs.getImage());
        }
        if (type.equalsIgnoreCase("psu")) {
            PSUDAO pDAO = new PSUDAO();
            PSU p = pDAO.getPSUByID(id);
            request.setAttribute("id", p.getPsuID());
            request.setAttribute("name", p.getPsuName());
            request.setAttribute("price", p.getPrice());
            request.setAttribute("status", p.isStatus());
        }
        if (type.equalsIgnoreCase("ram")) {
            RAMDAO rDAO = new RAMDAO();
            RAM r = rDAO.getRAMByID(id);
            request.setAttribute("id", r.getRamID());
            request.setAttribute("name", r.getRamName());
            request.setAttribute("price", r.getPrice());
            request.setAttribute("status", r.isStatus());

        }
        if (type.equalsIgnoreCase("storage")) {
            StorageDAO sDAO = new StorageDAO();
            Storage s = sDAO.getStorageByID(id);
            request.setAttribute("id", s.getStorageID());
            request.setAttribute("name", s.getStorageName());
            request.setAttribute("price", s.getPrice());
            request.setAttribute("status", s.isStatus());

        }
        if (type.equalsIgnoreCase("vga")) {
            VGADAO vDAO = new VGADAO();
            VGA v = vDAO.getVGAByID(id);
            request.setAttribute("id", v.getVgaID());
            request.setAttribute("name", v.getVgaName());
            request.setAttribute("price", v.getPrice());
            request.setAttribute("status", v.isStatus());
        }

        request.setAttribute("type", type.toUpperCase());
        request.getRequestDispatcher("SaleComponentDetail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action != null && action.equals("back")) {
                response.sendRedirect("componentList");
            } else {
                String type = request.getParameter("type");
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String status = request.getParameter("status");

                Part images = request.getPart("image");

                ComponentDAO cDAO = new ComponentDAO();

                String imagePath, extension = "";
                if (images != null && images.getSize() > 0) {
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

                } else {
                    Case c = new CaseDAO().getCaseByID(Integer.parseInt(id));
                    imagePath = c.getImage();
                }

                if (type.equalsIgnoreCase("case")) {
                    cDAO.updateCase(type, id, name, price, status, imagePath);
                } else {
                    cDAO.updateComponent(type, id, name, price, status);
                }
                request.setAttribute("notification", "Update successfully");
                request.getRequestDispatcher("componentList").forward(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("notification", "An error occurred. Please try again.");
            request.getRequestDispatcher("componentList").forward(request, response);
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

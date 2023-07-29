/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAO.PCDAO;
import DAO.ProductDAO;
import DAO.ProductImagesDAO;
import Model.PC;
import Model.Product;
import Model.Product_Images;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tien Dat
 */
@MultipartConfig
public class UpdateProductController extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action != null && action.equals("back")) {
            response.sendRedirect("productList");
        } else if (request.getParameter("update") != null) {
            //attribute
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            boolean status = Boolean.valueOf(request.getParameter("status"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productStatusID = Integer.parseInt(request.getParameter("productStatus"));
            double salePercentage = Double.parseDouble(request.getParameter("salePercentage"));
            int categoryID = Integer.parseInt(request.getParameter("category"));

            ProductDAO pDAO = new ProductDAO();
            Product product = new Product();
            product.setProductID(productID);
            product.setProductName(productName);
            product.setDescription(description);
            product.setStatus(status);
            product.setQuantity(quantity);
            product.setSalePercentage(salePercentage);
            product.setProductStatusID(productStatusID);
            product.setCategoryID(categoryID);
            pDAO.updateProduct(product);

            int cpuID = Integer.parseInt(request.getParameter("cpu"));
            int caseID = Integer.parseInt(request.getParameter("case"));
            int mainboardID = Integer.parseInt(request.getParameter("mainboard"));
            int storageID = Integer.parseInt(request.getParameter("storage"));
            int vgaID = Integer.parseInt(request.getParameter("vga"));
            int ramID = Integer.parseInt(request.getParameter("ram"));
            int psuID = Integer.parseInt(request.getParameter("psu"));

            PCDAO pcDAO = new PCDAO();
            PC pc = new PC();
            pc.setProductID(productID);
            pc.setMainboardID(mainboardID);
            pc.setCpuID(cpuID);
            pc.setRamID(ramID);
            pc.setVgaID(vgaID);
            pc.setStorageID(storageID);
            pc.setPsuID(psuID);
            pc.setCaseID(caseID);
            pcDAO.updatePC(pc);

            ProductImagesDAO pdimgDAO = new ProductImagesDAO();
            ServletContext context = getServletContext();

            // Get the real path to the project folder
            String projectFolderPath = context.getRealPath("/img");
            // Specify the directory to save the image
            String uploadDirectory = projectFolderPath + "/product/";
            File directory = new File(uploadDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            List<Part> imageParts = (List<Part>) request.getParts();

            List<String> imagePaths = new ArrayList<>();
            String extension = "", imagePath;
            boolean imagesInserted = false; // Flag to track if images were inserted

            for (Part imagePart : imageParts) {
                if (imagePart.getSubmittedFileName() != null && !imagePart.getSubmittedFileName().isEmpty()) {
                    // Generate a unique image name
                    String originalFilename = imagePart.getSubmittedFileName();
                    int extensionIndex = originalFilename.lastIndexOf('.');
                    if (extensionIndex >= 0) {
                        extension = originalFilename.substring(extensionIndex);
                    }
                    String uniqueImageName = System.currentTimeMillis() + extension;

                    // Create the destination file path
                    String destinationFilePath = uploadDirectory + uniqueImageName;
                    imagePart.write(destinationFilePath);
                    imagePath = "img/product/" + uniqueImageName;
                    imagePaths.add(imagePath);
                    imagesInserted = true;
                }

            }

            if (imagesInserted) {
                for (String imagePath1 : imagePaths) {
                    Product_Images pdimg = new Product_Images();
                    pdimg.setProductID(productID);
                    pdimg.setImages(imagePath1);
                    pdimgDAO.insertImages(pdimg);
                }
            } else {
                ArrayList<Product_Images> listImageOfProduct = new ProductImagesDAO().getListImageOfProductByID(productID);
                for (Product_Images product_Images : listImageOfProduct) {
                    imagePaths.add(product_Images.getImages());
                }
            }
            request.setAttribute("notification", "Product updated successfully");
            request.getRequestDispatcher("saleProductDetail?id=" + productID + "").forward(request, response);
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

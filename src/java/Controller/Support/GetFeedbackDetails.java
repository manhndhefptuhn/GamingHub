package Controller.Support;

import DAO.FeedbackDAO;
import DAO.UserDAO;
import DAO.FeedbackResponseDAO;
import DAO.ProductDAO;
import Model.Feedback;
import Model.User;
import Model.FeedbackResponse;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
@WebServlet(name = "feedbackDetail", urlPatterns = {"/feedbackDetail"})
public class GetFeedbackDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        FeedbackDAO fbDAO = new FeedbackDAO();
        UserDAO uDAO = new UserDAO();
        ProductDAO pDAO = new ProductDAO();
        FeedbackResponseDAO fbrDAO = new FeedbackResponseDAO();
        //get feedack ID from feedback list
        String id = request.getParameter("id");
        Feedback x = fbDAO.getFeedbackDetails(id);
        User u = uDAO.getUserByID(x.getUserId());
        Product p = pDAO.getProductByID(x.getProductId());
        
        ArrayList<FeedbackResponse> fbrlst = fbrDAO.getFeedbackReplyWithId(id);

        request.setAttribute("p", p);
        request.setAttribute("userDetails", u);
        request.setAttribute("feedbackDetail", x);
        request.setAttribute("fbrlst", fbrlst);
        request.getRequestDispatcher("SupportFeedbackDetail.jsp").forward(request, response);

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

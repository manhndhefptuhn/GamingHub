package Controller.Support;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Feedback;
import DAL.FeedbackDAO;


/**
 *
 * @author admin
 */
@WebServlet(name="GetFeedbackList", urlPatterns={"/feedbackList123"})
public class GetFeedbackList extends HttpServlet {
    
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");     
        
        PrintWriter out = response.getWriter();       
        FeedbackDAO fb = new FeedbackDAO();
        
        //set default list
        List<Feedback> lst = fb.getFeedback();
        request.setAttribute("lst", lst);        
        request.getRequestDispatcher("supportFeedbackList.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

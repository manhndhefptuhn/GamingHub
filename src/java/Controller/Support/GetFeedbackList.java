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
@WebServlet(name="GetFeedbackList", urlPatterns={"/GetFeedbackList"})
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
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();     
        FeedbackDAO fb = new FeedbackDAO();
        
        //get value from sort dropdown menu
        String value = request.getParameter("sortFeedback");
           
        
        //set list based on sort options
        if (value.equalsIgnoreCase("resolve")) {
            List<Feedback> lst = fb.getFeedbackByStatus1();
            request.setAttribute("lst", lst);
            
        } else if (value.equalsIgnoreCase("ratingAsc")) {         
            List<Feedback> lst = fb.getFeedbackByRatingAsc();
            request.setAttribute("lst", lst);
            
        } else if (value.equalsIgnoreCase("ratingDesc")) {
            List<Feedback> lst = fb.getFeedbackByRatingDesc();
            request.setAttribute("lst", lst);
            
        }else if (value.equalsIgnoreCase("NResolve")){
            List<Feedback> lst = fb.getFeedbackByStatus0();
            request.setAttribute("lst", lst);
                    
        } else {
            List<Feedback> lst = fb.getFeedback();
            request.setAttribute("lst", lst);
        }
        
        request.setAttribute("sortFeedback", value);
        request.getRequestDispatcher("supportFeedbackList.jsp").forward(request, response);
    }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

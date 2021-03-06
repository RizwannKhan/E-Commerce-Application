package com.ecommerce.servlets;

import com.ecommerce.dao.UserDao;
import com.ecommerce.entities.User;
import com.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Rijwank
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            
            UserDao dao = new UserDao(FactoryProvider.getFactory());
            User user = dao.getUserByEmailAndPassword(email, password);
            
//            System.out.println("User : "+ user);
                HttpSession s = request.getSession();
            if(user == null){
                s.setAttribute("msg", "Invalid user email or password !!!");
                response.sendRedirect("login");
                return;
            }else {
                out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                s.setAttribute("current-user", user);
                
                //admin and normal user....
                if(user.getUserType().equals("admin")){
                    response.sendRedirect("admin");
                }else if(user.getUserType().equals("normal")){
                    response.sendRedirect("normal");
                }else {
                    out.println("We have not identified user type");
                }
                
            }
            
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

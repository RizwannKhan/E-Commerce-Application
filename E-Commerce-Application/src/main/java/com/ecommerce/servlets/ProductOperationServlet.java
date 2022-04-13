package com.ecommerce.servlets;

import com.ecommerce.dao.CategoryDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * @author Rijwank
 */
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            //This Servlet handle both operations : Add-Category and Add-Product
            String operation = request.getParameter("oparation");
            HttpSession session = request.getSession();

            if (operation.trim().equals("addcategory")) {
                //Fetching details to add-category....
                String catTitle = request.getParameter("catTitle");
                String catDesc = request.getParameter("catDesc");

                Category category = new Category(catTitle, catDesc);

                //save category to Database....
                CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = catDao.saveCategory(category);

                session.setAttribute("msg", "Category added successfully and category id is : " + catId);
                response.sendRedirect("admin");
                return;

            } else if (operation.trim().equals("addproduct")) {
                // for add-product
                String pTitle = request.getParameter("prodTitle");
                String pDesc = request.getParameter("prodDesc");
                int pPrice = Integer.parseInt(request.getParameter("prodPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("prodDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
                int cId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("prodPic");
                String pPic = part.getSubmittedFileName();

                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category cat = cDao.getCategoryById(cId);

                Product product = new Product(pTitle, pDesc, pPic, pPrice, pDiscount, pQuantity, cat);

                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                int pId = pDao.saveProduct(product);

                try {
                    //upload pic of product...
                    String path = request.getRealPath("products") + File.separator + pPic;
                    System.out.println(path);

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    byte[] b = new byte[is.available()];
                    is.read(b);

                    fos.write(b);
                    fos.flush();
                    fos.close();
                    is.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                session.setAttribute("msg", "Product added successfully !!!");
                response.sendRedirect("admin");
                return;
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

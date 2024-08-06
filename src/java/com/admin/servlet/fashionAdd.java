package com.admin.servlet;

import com.DAO.itemDaoImpl;
import com.DB.DBConnect;
import com.entity.Add_Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/add_fashion")
@MultipartConfig
public class fashionAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try{
            String name = request.getParameter("name");
            String brand_name = request.getParameter("brand_name");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            Part part = (Part) request.getPart("photo");
            String fileName = part.getSubmittedFileName();
            
            Add_Items itm = new Add_Items();
            itm.setName(name);
            itm.setBrand_name(brand_name);
            itm.setPrice(price);
            itm.setCategory(category);
            itm.setStatus(status);
            itm.setPhoto(fileName);
            System.out.println(itm);
            
            itemDaoImpl  dao = new itemDaoImpl(DBConnect.getConn()); 
            boolean f = dao.addItem(itm);
            HttpSession session = request.getSession();
            
            if(f)
            {
             String path = getServletContext().getRealPath("")+"all_components/card-img";
             File file= new File(path);
             part.write(path + File.separator + fileName);
             System.out.println("path = " + path);
            
   
             session.setAttribute("Adminsuccess", "Item Added Successfully");
             response.sendRedirect("admin/add_fashion.jsp");
            
            }else
            {
             session.setAttribute("Adminfail", "Something went wrong");
             response.sendRedirect("admin/add_fashion.jsp");
            
            }
            

        
        }catch(ServletException | IOException e){
            e.printStackTrace();
        }
    
    }

    
}

package com.admin.servlet;

import com.DAO.itemDaoImpl;
import com.DB.DBConnect;
import com.entity.Add_Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/edit_Item")
public class editItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try{
            int id = Integer.parseInt(request.getParameter("id").trim());
            String name = request.getParameter("name");
            String brand_name = request.getParameter("brand_name");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            
            Add_Items it = new Add_Items();
            it.setId(id);
            it.setName(name);
            it.setBrand_name(brand_name);
            it.setPrice(price);
            it.setCategory(category);
            it.setStatus(status);
            
            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
            boolean f = dao.updateEditItem(it);
            
            HttpSession session = request.getSession();
            
            if(f)
            {
             session.setAttribute("editSuccess", "Item Updated Successfully");
             response.sendRedirect("admin/edit_Item.jsp");
            
            }else{
             session.setAttribute("editFailed", "Something went wrong");
             response.sendRedirect("admin/edit_Item.jsp");
               
            }
       }catch(Exception e){
           e.printStackTrace();
       }
    }


}

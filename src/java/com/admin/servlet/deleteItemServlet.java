 package com.admin.servlet;

import com.DAO.itemDaoImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete")
public class deleteItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        try{
            
            int id = Integer.parseInt(request.getParameter("id"));
            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
            boolean f  = dao.deleteItem(id);
            
            HttpSession session = request.getSession();
            
            if(f)
            {
             session.setAttribute("deleteSuccess", "Item Deleted Successfully");
             response.sendRedirect("admin/manage-items.jsp");
            
            }else{
             session.setAttribute("deleteFailed", "Something went wrong");
             response.sendRedirect("admin/manage-items.jsp");
               
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    
    }

}

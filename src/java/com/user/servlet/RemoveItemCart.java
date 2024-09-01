package com.user.servlet;

import com.DAO.CartDaoImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove_item")
public class RemoveItemCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         int id = Integer.parseInt(req.getParameter("id"));
         int uid = Integer.parseInt(req.getParameter("uid"));
         
         CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
         boolean f = dao.deleteItem(id,uid);
         HttpSession session = req.getSession();
         
         
         if(f)
         {
             session.setAttribute("deleteSuccess","Item Removed Successfully");
             resp.sendRedirect("cartitem.jsp");
         }
         else
         {
             session.setAttribute("deleteFailed","Something went wrong");
             resp.sendRedirect("cartitem.jsp");
         }
    
    }

}

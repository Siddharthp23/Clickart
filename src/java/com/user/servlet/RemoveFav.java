package com.user.servlet;

import jakarta.servlet.http.HttpSession;
import com.DAO.FavDaoImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import java.io.PrintWriter;


@WebServlet("/removeFav")
public class RemoveFav extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int id = Integer.parseInt(req.getParameter("id"));
         int uid = Integer.parseInt(req.getParameter("uid"));
         
         FavDaoImpl dao = new FavDaoImpl(DBConnect.getConn());
         boolean f = dao.deleteFav(id, uid);
         HttpSession session = req.getSession();
         
         
         if(f)
         {
             session.setAttribute("SuccessFav","Item Removed Successfully");
             resp.sendRedirect("favourite.jsp");
         }
         else
         {
             session.setAttribute("FailedFav","Something went wrong");
             resp.sendRedirect("favourite.jsp");
         }
       
    
    }


}

package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class logoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     try{
         HttpSession session  = req.getSession();
         session.removeAttribute("userobj");
         
         HttpSession session2 = req.getSession();
         session2.setAttribute("LogoutMsg", "Logout Successfully");
         resp.sendRedirect("signin.jsp");
     }  
     catch(Exception e){
         e.printStackTrace();
     }
    
    }
    
        

}

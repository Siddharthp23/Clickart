package com.user.servlet;

import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.entity.user;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author HP
 */
@WebServlet("/signin")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            userDAOImpl dao  = new userDAOImpl(DBConnect.getConn());
            HttpSession  session = req.getSession();
            
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        if("admin@gmail.com".equals(email) && "admin".equals(password))
        {
            user us = new user();
            us.setName("Admin");
            session.setAttribute("userobj", us);
            resp.sendRedirect("admin/adminHome.jsp");
            
        }
        else
        {
            user us = dao.login(email, password);
            if(us!= null)
            {
                session.setAttribute("userobj",us);
                resp.sendRedirect("index.jsp");
                
                
            }else
            {
                session.setAttribute("failedMsg","Email or Password Invalid");
                resp.sendRedirect("signin.jsp");
                
            }
            resp.sendRedirect("index.jsp/*");
        }
        
    }catch(Exception e){
        e.printStackTrace();
    }

    }

   

    
}
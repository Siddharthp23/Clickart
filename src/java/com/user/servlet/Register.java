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

@WebServlet("/signUp")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException ,UnsupportedOperationException{
        // Handle GET request
        try{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        String password = request.getParameter("password");
        String checkbox = request.getParameter("checkbox");
        
       //System.out.println(name+" "+email+" "+phoneno+" "+password+" "+checkbox);
          
         user us = new user();
         us.setName(name);
         us.setEmail(email);
         us.setPhoneno(phoneno);
         us.setPassword(password);
         
         HttpSession  session = request.getSession();
         if(checkbox!=null)
         {
            userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
            boolean f = dao.userRegister(us);
            if(f==true)
            {
                 //System.out.println("register success");
                session.setAttribute("successMSG","Successfully Registered");
                response.sendRedirect("signUp.jsp");
                return;
            }
            else{
                 //System.out.println("something went wrong");
                session.setAttribute("failed","something went wrong");
                response.sendRedirect("signUp.jsp");
                return;
            }    
         }
         else
         {
             //System.out.println("Please check terms and conditions");
             session.setAttribute("unchecked","Please agree terms  and conditions");
             response.sendRedirect("signUp.jsp");
             
             
         }
         
         
         }catch(Exception e){
            e.printStackTrace();
        }
    }

    
}
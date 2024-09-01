package com.user.servlet;

import com.DAO.CartDaoImpl;
import com.DAO.itemDaoImpl;
import com.DB.DBConnect;
import com.entity.Add_Items;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cart")
public class cartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            
            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
            Add_Items itm =dao.getItemById(id);
            
            Cart c = new Cart();
            c.setId(id);
            c.setUid(uid);
            c.setItem_name(itm.getName());
            c.setBrand_name(itm.getBrand_name());
            c.setPrice(Double.parseDouble(itm.getPrice()));
            c.setTotal_price(Double.parseDouble(itm.getPrice()));
            
            CartDaoImpl dao2 = new CartDaoImpl(DBConnect.getConn());
            boolean f  = dao2.addCart(c);
            
            HttpSession session = req.getSession();
            
            
            if(f)
            {
                session.setAttribute("addcart","Item Added Successfully to Cart");
                resp.sendRedirect("index.jsp");
                //System.out.println("added successfully");
            }else{
                session.setAttribute("failedcart","Something went wrong on server");
                resp.sendRedirect("cartitem.jsp");
                
               // System.out.println("not added");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    

}

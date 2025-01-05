/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import com.DAO.CartDaoImpl;
import com.DAO.ItemOrderDaoImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Item_Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class Order_Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session = req.getSession();
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String payment = req.getParameter("payment");
            
            String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
            
            //System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+payment);
            
            CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
            List<Cart> ilist = dao.getByUser(id);
            
            if(ilist.isEmpty()){
                session.setAttribute("failed","Add Items to Cart");
                resp.sendRedirect("cartitem.jsp");
            }else{
                ItemOrderDaoImpl dao2 = new ItemOrderDaoImpl(DBConnect.getConn());
            Item_Order io = null;
            
            
            ArrayList<Item_Order> orderList = new ArrayList();
            Random r = new Random();
            
            for(Cart c:ilist){
               io = new Item_Order();
                //System.out.println(c.getItem_name()+" "+c.getBrand_name()+" "+c.getPrice());
               io.setOrderId("ITEM-ORD-00"+r.nextInt(1000));
               io.setUsername(name);
               io.setEmail(email);
               io.setPhno(phno);
               io.setFulladd(fullAdd);
               io.setI_name(c.getItem_name());
               io.setBrand(c.getBrand_name());
               io.setPrice(c.getPrice()+"");
               io.setPaymentType(payment);
               orderList.add(io);
               
            }
            boolean f = dao2.saveOrder(orderList);
            try{
                if(f){
                    resp.sendRedirect("order_success.jsp");
                }
            }catch(Exception e){
                System.out.println(e);
            }
            }
            
            
           }
        catch(Exception e){
            e.printStackTrace();
        }
    }
        
    
    }

    


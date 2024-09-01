package com.user.servlet;

import com.DAO.FavDaoImpl;
import com.DAO.itemDaoImpl;
import com.DB.DBConnect;
import com.entity.Add_Items;
import com.entity.favourite;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/favourite")
public class favouriteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            
            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
            Add_Items itm =dao.getItemById(id);
            
            favourite fav = new favourite();
            fav.setId(id);
            fav.setUid(uid);
            fav.setItem_name(itm.getName());
            fav.setBrand_name(itm.getBrand_name());
            fav.setPrice(Double.parseDouble(itm.getPrice()));
            
            FavDaoImpl dao2 = new FavDaoImpl(DBConnect.getConn());
            boolean f  = dao2.addFav(fav);
            
            HttpSession session = req.getSession();
            
            
            if(f)
            {
                session.setAttribute("addfav","Item Added to Favorites");
                resp.sendRedirect("index.jsp");
                //System.out.println("added successfully");
            }else{
                session.setAttribute("failedFav","Something went wrong on server");
                resp.sendRedirect("favourite.jsp");
                
               // System.out.println("not added");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    
    }
    

}

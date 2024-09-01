package com.DAO;

import com.entity.Add_Items;
import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    private Connection conn;
    public CartDaoImpl(Connection conn)
    {
        this.conn = conn;
    }
    
    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try
        {
            String sql = "insert into cart(id,uid,item_name,brand_name,price,total_price)values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,c.getId());
            ps.setInt(2,c.getUid());
            ps.setString(3, c.getItem_name());
            ps.setString(4, c.getBrand_name());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6,c.getTotal_price());
            
            int i = ps.executeUpdate();
            if(i==1)
            {
                f= true;
            }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
        return f;    
    }

    @Override
    public List<Cart> getByUser(int userId) {
        List<Cart> list = new ArrayList<>();
        Cart c = null;
        double total_price=0;
        try{
            String sql = "select * from cart where uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setId(rs.getInt(2));
                c.setUid(rs.getInt(3));
                c.setItem_name(rs.getString(4));
                c.setBrand_name(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                
                
                total_price = total_price+rs.getDouble(7);
                c.setTotal_price(total_price);
                list.add(c);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
    
        return list;
    }

    @Override
    public boolean deleteItem(int id,int uid) {
       boolean f = false;
       try{
       String sql = "delete from cart where id=? and uid=?";
       PreparedStatement ps = conn.prepareStatement(sql);
       ps.setInt(1, id);
       ps.setInt(2, uid);
       int i = ps.executeUpdate();
       if(i==1){
           f = true;
       }
       }catch(Exception e){
       e.printStackTrace();
       }
    return f;
    }
    
    
}

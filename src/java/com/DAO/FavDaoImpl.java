package com.DAO;


import com.entity.favourite;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FavDaoImpl implements fav{
    
     private Connection conn;
    public FavDaoImpl(Connection conn)
    {
        this.conn = conn;
    }

    @Override
    public boolean addFav(favourite fav) {
       
    boolean f = false;
        try
        {
            String sql = "insert into fav(id,uid,item_name,brand_name,price)values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,fav.getId());
            ps.setInt(2,fav.getUid());
            ps.setString(3, fav.getItem_name());
            ps.setString(4, fav.getBrand_name());
            ps.setDouble(5, fav.getPrice());
            
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
    public List<favourite> getByUser(int userId) {
       
    List<favourite> list = new ArrayList<>();
        favourite fav = null;
        
        try{
            String sql = "select * from fav where uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                fav = new favourite();
                fav.setFid(rs.getInt(1));
                fav.setId(rs.getInt(2));
                fav.setUid(rs.getInt(3));
                fav.setItem_name(rs.getString(4));
                fav.setBrand_name(rs.getString(5));
                fav.setPrice(rs.getDouble(6));
                list.add(fav);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
    
        return list;
    }

    @Override
    public boolean deleteFav(int id, int uid) {
    boolean f = false;
       try{
       String sql = "delete from fav where id=? and uid=?";
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

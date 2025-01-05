package com.DAO;

import com.entity.Add_Items;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
public class itemDaoImpl implements itemDAO {
    private Connection conn;
    
    public itemDaoImpl(Connection conn){
        super();
        this.conn = conn;
    }
    
    @Override
    public boolean addItem(Add_Items item) {
      boolean f = false;
      try{
          String sql = "INSERT INTO additem (name, brand_name, price, category,status, photo) VALUES (?, ?, ?, ?, ?,?);";
          PreparedStatement ps = conn.prepareStatement(sql);
          ps.setString(1, item.getName());
          ps.setString(2, item.getBrand_name());
          ps.setString(3, item.getPrice());
          ps.setString(4, item.getCategory());
          ps.setString(5, item.getStatus());
          ps.setString(6, item.getPhoto());
          
          
          int i = ps.executeUpdate();
          if(i==1){
              f=true;
          }
          
      }catch(Exception e){
          e.printStackTrace();
      }
        return f;
      
    }

    @Override
    public List<Add_Items> getAllImage() {
        List<Add_Items> list = new ArrayList<>();
        Add_Items itm = null;
        try
          {
              String sql = "select * from additem";
              PreparedStatement ps = conn.prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              {
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                list.add(itm);
                
              }
          }catch(Exception e)
          {
            e.printStackTrace();
          }
        
        return list;
        }

    @Override
    public Add_Items getItemById(int id) {
    
        Add_Items itm = null;
        try{
            String sql = "select * from additem where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return itm;
    }

    @Override
    public boolean updateEditItem(Add_Items item) {
     boolean f = false;
     try{
         String sql = "update additem set name = ?, brand_name = ? , price = ?,category = ?, status = ? where id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1,item.getName());
         ps.setString(2,item.getBrand_name());
         ps.setString(3,item.getPrice());
         ps.setString(4,item.getCategory());
         ps.setString(5,item.getStatus());
         ps.setInt(6,item.getId());
         
         int i = ps.executeUpdate();
         if(i==1){
             f= true;
         }
     }catch(Exception e){
         e.printStackTrace();
     }
     return f;
    }

    @Override
    public boolean deleteItem(int id) {
     boolean f = false;
     try{
         String sql = "delete from additem where id=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, id);
         int i = ps.executeUpdate();
         if(i==1){
             f=true;
         }
     }catch(Exception e){
         e.printStackTrace();
     }
    return f;
    }

    @Override
    public List<Add_Items> getNewFashion() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Mens Wear");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next())
        {   if(x<=4){
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
                }
                x++;
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return list;
    }

   @Override
    public List<Add_Items> getWomenFashion() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Womens Wear");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    }

    @Override
    public List<Add_Items> getKidsFashion() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Kids Wear");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
        
      }

    @Override
    public List<Add_Items> getBeauty() {
        List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Beauty Product");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    
    }

    @Override
    public List<Add_Items> getFootwear() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Sneakers & Sport Shoes");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
       
    }

    @Override
    public List<Add_Items> getCasualWear() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Casual Shoes");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    }

    @Override
    public List<Add_Items> getFormalShoes() {
        List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Formal Shoes");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;

    }

    @Override
    public List<Add_Items> getFlipFlop() {
        List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Flip Flops & Slippers");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;

    }

    @Override
    public List<Add_Items> getMenAccessories() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Men Accessories");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
         
        }
    }
    catch(SQLException e)
    {
    }
    return list;

    }

    @Override
    public List<Add_Items> getMenTraditional() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Men Traditional");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
         
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    }

    @Override
    public List<Add_Items> getFlats() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Flats");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;    
    }

    @Override
    public List<Add_Items> getWomenCasuals() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Women Casual");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;    
    }

    @Override
    public List<Add_Items> getWomenFlipFlop() {
    List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Women Flip Flop");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;    
    }

    @Override
    public List<Add_Items> getHeels() {
   List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Heels");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
        int x = 1;
        while(rs.next() && x<=4)
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                x++;
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    }

    @Override
    public List<Add_Items> getWestern() {
        List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Women Western");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
                while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    
    }

    @Override
    public List<Add_Items> getWomenTraditionals() {
         List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Women Traditionals");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
                while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                
        }
    }
    catch(SQLException e)
    {
    }
    return list;
}

    @Override
    public List<Add_Items> getBeautyPro() {
             List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Beauty & Body");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
                while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                
        }
    }
    catch(SQLException e)
    {
    }
    return list;}

    @Override
    public List<Add_Items> getMenWear() {
         List<Add_Items> list = new ArrayList<>();
    Add_Items itm = null;
    try
    {
        String sql = "select * from additem where category = ? and status = ? order by id DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "Mens wear");
        ps.setString(2, "In-Stock");
        ResultSet rs = ps.executeQuery();
                while(rs.next())
        {   
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                
                list.add(itm);
               
                
        }
    }
    catch(SQLException e)
    {
    }
    return list;
    }

    @Override
    public List<Add_Items> getItemBySearch(String ch) {
        List<Add_Items> list = new ArrayList<Add_Items>();
        Add_Items itm = null;
        try{
            
            String sql = "select * from additem where name like ? or brand_name like ? or category like ? and status=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "In-Stock");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                list.add(itm);
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Add_Items> getSelectedIamge() {
        List<Add_Items> list = new ArrayList<>();
        Add_Items itm = null;
        try
          {
              String sql = "select * from additem where id=?";
              PreparedStatement ps = conn.prepareStatement(sql);
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              {
                itm = new Add_Items();
                itm.setId(rs.getInt(1));
                itm.setName(rs.getString(2));
                itm.setBrand_name(rs.getString(3));
                itm.setPrice(rs.getString(4));
                itm.setCategory(rs.getString(5));
                itm.setStatus(rs.getString(6));
                itm.setPhoto(rs.getString(7));
                list.add(itm);
                
              }
          }catch(Exception e)
          {
            e.printStackTrace();
          }
        
        return list;
        }   
    
    
    
    
}

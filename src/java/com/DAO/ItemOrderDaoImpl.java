package com.DAO;
import com.entity.Item_Order;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ItemOrderDaoImpl implements ItemOrderDao{
    private Connection conn;
    
    public ItemOrderDaoImpl(Connection conn){
        super();
        this.conn = conn;
    }
    
    public boolean saveOrder(List<Item_Order> ilist){
        boolean f = false;
        try{
            String sql = "insert into orderitem(order_id,u_name,email,address,phone,i_name,brand,price,payment) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            
            for(Item_Order i:ilist){
                ps.setString(1,i.getOrderId());
                ps.setString(2,i.getUsername());
                ps.setString(3,i.getEmail());
                ps.setString(4,i.getFulladd());
                ps.setString(5,i.getPhno());
                ps.setString(6,i.getI_name());
                ps.setString(7,i.getBrand());
                ps.setString(8,i.getPrice());
                ps.setString(9,i.getPaymentType());
                ps.addBatch();
                        
            }
            int[] count =  ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }

    @Override
    public List<Item_Order> getOrder() {
    List<Item_Order> list = new ArrayList<Item_Order>();
    Item_Order ord = null;
        
        try{
            String  sql = "select * from orderitem where email=?";
            PreparedStatement ps= conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ord = new Item_Order();
                ord.setId(rs.getInt(1));
                ord.setOrderId(rs.getString(2));
                ord.setUsername(rs.getString(3));
                ord.setEmail(rs.getString(4));
                ord.setFulladd(rs.getString(5));
                ord.setPhno(rs.getString(6));
                ord.setI_name(rs.getString(7));
                ord.setBrand(rs.getString(8));
                ord.setPrice(rs.getString(9));
                ord.setPaymentType(rs.getString(10));
                
                    
            }
    }catch(Exception e){
        e.printStackTrace();
    }   
    return list;
    }


    
}


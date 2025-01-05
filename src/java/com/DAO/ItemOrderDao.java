package com.DAO;

import com.entity.Item_Order;
import java.util.List;

public interface ItemOrderDao {
   // public int getOrderNo();
    public boolean saveOrder(List<Item_Order> ilist);
    public List<Item_Order> getOrder(); 
}

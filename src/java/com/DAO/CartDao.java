package com.DAO;

import com.entity.Add_Items;
import com.entity.Cart;
import java.util.List;

public interface CartDao {
   public boolean addCart(Cart c);
   public List<Cart> getByUser(int userId);
   public boolean deleteItem(int id , int uid);
   
}

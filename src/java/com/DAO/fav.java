package com.DAO;

import com.entity.favourite;
import java.util.List;

public interface fav {
    public boolean addFav(favourite fav);
    public List<favourite> getByUser(int userId);
    public boolean deleteFav(int id , int uid);
}

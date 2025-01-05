package com.DAO;

import com.entity.Add_Items;
import java.util.List;

public interface itemDAO {
    public boolean addItem(Add_Items item);
    public List<Add_Items> getAllImage();
    public Add_Items getItemById(int id);
    public boolean updateEditItem(Add_Items item);
    public boolean deleteItem(int id);
    public List<Add_Items> getNewFashion();
    public List<Add_Items> getWomenFashion();
    public List<Add_Items> getKidsFashion();
    public List<Add_Items> getBeauty();
    public List<Add_Items> getFootwear();
    public List<Add_Items> getCasualWear();
    public List<Add_Items> getFormalShoes();
    public List<Add_Items> getFlipFlop();
    public List<Add_Items> getMenAccessories();
    public List<Add_Items> getMenTraditional();
    public List<Add_Items> getFlats();
    public List<Add_Items> getWomenCasuals();
    public List<Add_Items> getWomenFlipFlop();
    public List<Add_Items> getHeels();
    public List<Add_Items> getWestern();
    public List<Add_Items> getWomenTraditionals();
    public List<Add_Items> getBeautyPro();
    public List<Add_Items> getMenWear();
    public List<Add_Items> getItemBySearch(String ch);
    public List<Add_Items> getSelectedIamge();
    

    
    
    
    
}

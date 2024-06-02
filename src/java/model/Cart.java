/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mb
 */
public class Cart {

    private List<Item> listItem;

    public Cart() {
        listItem = new ArrayList<>();
    }

    public List<Item> getListItem() {
        return listItem;
    }

    public Item getItemById(String id) {
        for (Item i : listItem) {
            if (i.getProduct().getProductCode().equals(id)) {
                return i;
            }
        }
        return null;
    }

    public int getQuanById(String id) {
        return getItemById(id).getQuantity();
    }

    public void addItem(Item i) {

        if (getItemById(i.getProduct().getProductCode()) != null) { // ktra da ton tai sp trong gio hang
            Item item = getItemById(i.getProduct().getProductCode());
            item.setQuantity(item.getQuantity() + i.getQuantity());
        } else {
            listItem.add(i);
        }
    }
    
    public void removeItem(String id){
        if(getItemById(id)!= null){
            listItem.remove(getItemById(id));
        }
    }
    
    public float getTotalMoney(){
        float s=0;
        for(Item i : listItem){
            s+=(i.getQuantity() * Float.parseFloat(i.getProduct().getProductPrice())*(1-Float.parseFloat(i.getProduct().getProductSale())));
        }
        return s;
    }
        
}

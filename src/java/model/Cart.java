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

    List<Item> listItem;

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
//------------------------------------------------------------------------------
    public void addItem(Item i) {

        if (getItemById(i.getProduct().getProductCode()) != null) { // ktra da ton tai sp trong gio hang
            Item item = getItemById(i.getProduct().getProductCode());
            item.setQuantity(item.getQuantity() + i.getQuantity());
        } else {
            listItem.add(i);
        }
    }
    
//------------------------------------------------------------------------------
    public void removeItem(String id) {
        if (getItemById(id) != null) {
            listItem.remove(getItemById(id));
        }
    }

//------------------------------------------------------------------------------
    public float getTotalMoney() {
        float s = 0;
        for (Item i : listItem) {
            s += Float.parseFloat(i.getProduct().getProductPrice());
//            s += (i.getQuantity() * Float.parseFloat(i.getProduct().getProductPrice()) * (1 - Float.parseFloat(i.getProduct().getProductSale())));
        }
        return s;
    }

//------------------------------------------------------------------------------  
        private Product getProductById(String id, List<Product> listProduct) {
        for (Product p : listProduct) {
            if (p.getProductCode().equals(id)) {
                return p;
            }

        }
        return null;
    }
//------------------------------------------------------------------------------    
    private Product getProductByIdColorSize(String id, String color, String size, List<Product> listProduct) {
        for (Product p : listProduct) {
            if (p.getProductCode().equals(id) && p.getProductColorList().contains(color) && p.getProductSize().equals(size)) {
                return p;
            }

        }
        return null;
    }

//------------------------------------------------------------------------------
    public String cartSize() {
        if (this.listItem.size() != 0) {
            return String.valueOf(this.listItem.size());
        } else {
            return "0";
        }
    }

    public Cart(String txt, List<Product> listProduct) {// list product laf ds cac mat hang cua shop
        listItem = new ArrayList<>();
        if (txt != null && txt.length() != 0) {
            String[] arr = txt.split("/");
            for (String item : arr) {
                String[] productArr = item.split(":");
                String id = productArr[0];
                String color = productArr[1];
                String size = productArr[2];
                String quan = productArr[3];
                quan="1";
                
                Product p = getProductById(id,listProduct);
//                Product p = getProductByIdColorSize(id,color,size, listProduct);
                Item i = new Item(p, Integer.parseInt(quan));
                addItem(i);
            }
        }

    }
}

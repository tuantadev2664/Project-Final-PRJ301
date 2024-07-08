package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    List<Item> listItem;

    public Cart() {
        listItem = new ArrayList<>();
    }

    public List<Item> getListItem() {
        return listItem;
    }

    public Item getItemByIdColorSize(String id, String color, String size) {
        for (Item i : listItem) {
            Product product = i.getProduct();
            if (product != null && product.getProductCode().equals(id) && product.getProductColor().equals(color) && product.getProductSize().equals(size)) {
                return i;
            }
        }
        return null;
    }
    public Item getItemById(String id){
        for (Item i : listItem) {
            Product product = i.getProduct();
            if (product != null && product.getProductCode().equals(id)) {
                return i;
            }
        }
        return null;
    }

    public int getQuanById(String id) {
        Item item = getItemById(id);
        return (item != null) ? item.getQuantity() : 0;
    }

    public void addItem(Item i) {
        if (i.getProduct() == null) {
            throw new IllegalArgumentException("Item must have a non-null Product.");
        }

        Item existingItem = getItemByIdColorSize(i.getProduct().getProductCode(), i.getProduct().getProductColor(), i.getProduct().getProductSize());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + i.getQuantity());
        } else {
            listItem.add(i);
        }
    }

    public void removeItem(String id) {
        Item item = getItemById(id);
        if (item != null) {
            listItem.remove(item);
        }
    }

    public float getTotalMoney() {
        float s = 0;
        for (Item i : listItem) {
            Product product = i.getProduct();
            if (product != null) {
                s += Float.parseFloat(product.getProductPrice());
            }
        }
        return s;
    }

    private Product getProductById(String id, List<Product> listProduct) {
        for (Product p : listProduct) {
            if (p.getProductCode().equals(id)) {
                return p;
            }
        }
        return null;
    }

    private Product getProductByIdColorSize(String id, String color, String size, List<Product> listProduct) {
        for (Product p : listProduct) {
            if (p.getProductCode().equals(id) && p.getProductColor().equals(color) && p.getProductSize().equals(size)) {
                return p;
            }
        }
        return null;
    }

    public String cartSize() {
        return String.valueOf(this.listItem.size());
    }

    public Cart(String txt, List<Product> listProduct) {
        listItem = new ArrayList<>();
        if (txt != null && !txt.isEmpty()) {
            String[] arr = txt.split("/");
            for (String item : arr) {
                String[] productArr = item.split(":");
                if (productArr.length == 4) {
                    String id = productArr[0];
                    String color = productArr[1];
                    String size = productArr[2];
                    String quan = productArr[3];
                    // k tim dc p
                    Product p = getProductByIdColorSize(id, color, size, listProduct);
                    System.out.println(p.getProductCode() + p.getProductName() + p.getProductColor() + p.getProductSize() + p.getProductPrice() + p.getProductImg() + p.getColorLink());

                    if (p != null) {
                        Item i = new Item(p, Integer.parseInt(quan));
                        addItem(i);

                    }
                }
            }
        }
    }

    @Override
    public String toString() {
        return "Cart{" + "listItem=" + listItem + '}';
    }

}

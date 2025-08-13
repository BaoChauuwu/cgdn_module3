package chaudnb.example.product.repository;

import chaudnb.example.product.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    public static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Laptop Dell XPS 13", "Ultrabook cao cấp, mỏng nhẹ", 29999.99));
        products.add(new Product(2, "iPhone 15 Pro", "Smartphone cao cấp của Apple", 34999.00));
        products.add(new Product(3, "Tai nghe Sony WH-1000XM5", "Tai nghe chống ồn hàng đầu", 8999.50));
        products.add(new Product(4, "Bàn phím cơ Keychron K8", "Bàn phím cơ không dây, hot-swappable", 2599.00));
        products.add(new Product(5, "Màn hình LG UltraWide 34\"", "Màn hình cong UltraWide cho đa nhiệm", 12999.99));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public boolean addProduct(Product product) {
        if (product.getId() == 0) {
            int nextId = 1;
            for (Product p : products) {
                if (p.getId() >= nextId) {
                    nextId = p.getId() + 1;
                }
            }
            product.setId(nextId);
        }
        return products.add(product);
    }

    @Override
    public Product updateProduct(Product product) {
        for (int i = 0; i < products.size(); i++) {
            Product current = products.get(i);
            if (current.getId() == product.getId()) {
                current.setName(product.getName());
                current.setDescription(product.getDescription());
                current.setPrice(product.getPrice());
                return current;
            }
        }
        return null;
    }

    @Override
    public boolean deleteProduct(Product product) {
        if (product == null) {
            return false;
        }
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == product.getId()) {
                products.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public Product findProductById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}

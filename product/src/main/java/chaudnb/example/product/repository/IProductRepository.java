package chaudnb.example.product.repository;

import chaudnb.example.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    boolean addProduct(Product product);
    Product updateProduct(Product product);
    boolean deleteProduct(Product product);
    Product findProductById(int id);
    List<Product> searchByName(String name);
}

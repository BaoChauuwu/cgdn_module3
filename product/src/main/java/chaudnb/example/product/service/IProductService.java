package chaudnb.example.product.service;

import chaudnb.example.product.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    boolean addProduct(Product product);
    Product updateProduct(Product product);
    boolean deleteProduct(Product product);
    Product findProductById(int id);
}

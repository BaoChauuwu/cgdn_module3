package chaudnb.example.product.service;

import chaudnb.example.product.model.Product;
import chaudnb.example.product.repository.IProductRepository;
import chaudnb.example.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public Product updateProduct(Product product) {
        return null;
    }

    @Override
    public boolean deleteProduct(Product product) {
        return false;
    }

    @Override
    public Product findProductById(int id) {
        return productRepository.findProductById(id);
    }
}

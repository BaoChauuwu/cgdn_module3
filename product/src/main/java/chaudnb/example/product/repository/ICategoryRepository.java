package chaudnb.example.product.repository;

import chaudnb.example.product.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();
    boolean addCategory(Category category);
    Category updateCategory(Category category);
    boolean deleteCategory(Category category);
    Category findCategoryById(int id);
    List<Category> searchByName(String name);
} 
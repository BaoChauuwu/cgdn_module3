package chaudnb.example.product.service;

import chaudnb.example.product.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    boolean addCategory(Category category);
    Category updateCategory(Category category);
    boolean deleteCategory(Category category);
    Category findCategoryById(int id);
    List<Category> searchByName(String name);
} 
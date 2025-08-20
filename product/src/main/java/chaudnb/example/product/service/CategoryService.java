package chaudnb.example.product.service;

import chaudnb.example.product.model.Category;
import chaudnb.example.product.repository.ICategoryRepository;
import chaudnb.example.product.repository.CategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService {
    private ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public boolean addCategory(Category category) {
        return categoryRepository.addCategory(category);
    }

    @Override
    public Category updateCategory(Category category) {
        return categoryRepository.updateCategory(category);
    }

    @Override
    public boolean deleteCategory(Category category) {
        return categoryRepository.deleteCategory(category);
    }

    @Override
    public Category findCategoryById(int id) {
        return categoryRepository.findCategoryById(id);
    }

    @Override
    public List<Category> searchByName(String name) {
        return categoryRepository.searchByName(name);
    }
} 
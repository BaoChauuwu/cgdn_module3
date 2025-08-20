package chaudnb.example.product.controller;

import chaudnb.example.product.model.Category;
import chaudnb.example.product.service.ICategoryService;
import chaudnb.example.product.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = " ";
        }

        switch (action) {
            case "add":
                String name = req.getParameter("name");
                String description = req.getParameter("description");
                Category category = new Category(name, description);
                categoryService.addCategory(category);
                resp.sendRedirect("/category");
                break;

            case "find":
                int id = Integer.parseInt(req.getParameter("id"));
                Category findCategory = categoryService.findCategoryById(id);
                req.setAttribute("findCategory", findCategory);
                req.getRequestDispatcher("/category/resultSearch.jsp").forward(req, resp);
                break;

            case "search":
                String searchName = req.getParameter("name");
                List<Category> searchResults = categoryService.searchByName(searchName);
                req.setAttribute("searchResults", searchResults);
                req.setAttribute("searchKeyword", searchName);
                req.getRequestDispatcher("/category/resultSearch.jsp").forward(req, resp);
                break;

            case "update":
                int updateId = Integer.parseInt(req.getParameter("id"));
                String updateName = req.getParameter("name");
                String updateDescription = req.getParameter("description");
                Category updated = new Category(updateId, updateName, updateDescription);
                categoryService.updateCategory(updated);
                resp.sendRedirect("/category");
                break;

            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                Category deleteCategory = categoryService.findCategoryById(deleteId);
                categoryService.deleteCategory(deleteCategory);
                resp.sendRedirect("/category");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "add":
                req.getRequestDispatcher("/category/addForm.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Category category = categoryService.findCategoryById(id);
                req.setAttribute("category", category);
                req.getRequestDispatcher("/category/editForm.jsp").forward(req, resp);
                break;
            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                Category deleteCategory = categoryService.findCategoryById(deleteId);
                categoryService.deleteCategory(deleteCategory);
                resp.sendRedirect("/category");
                break;
            default:
                List<Category> categoryList = categoryService.findAll();
                req.setAttribute("categoryList", categoryList);
                req.getRequestDispatcher("/category/listCategory.jsp").forward(req, resp);
        }
    }
} 
package chaudnb.example.product.controller;

import chaudnb.example.product.model.Product;
import chaudnb.example.product.model.Category;
import chaudnb.example.product.service.IProductService;
import chaudnb.example.product.service.ProductService;
import chaudnb.example.product.service.ICategoryService;
import chaudnb.example.product.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
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
                double price = Double.parseDouble(req.getParameter("price"));
                String categoryIdParam = req.getParameter("categoryId");
                
                Product product;
                if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                    int categoryId = Integer.parseInt(categoryIdParam);
                    product = new Product(name, description, price, categoryId);
                } else {
                    product = new Product(name, description, price);
                }
                productService.addProduct(product);
                resp.sendRedirect("/product");
                break;

            case "find":
                int id = Integer.parseInt(req.getParameter("id"));
                Product findProduct = productService.findProductById(id);
                req.setAttribute("findProduct", findProduct);
                req.getRequestDispatcher("/product/resultSearch.jsp").forward(req, resp);
                break;

            case "search":
                String searchName = req.getParameter("name");
                List<Product> searchResults = productService.searchByName(searchName);
                req.setAttribute("searchResults", searchResults);
                req.setAttribute("searchKeyword", searchName);
                req.getRequestDispatcher("/product/resultSearch.jsp").forward(req, resp);
                break;

            case "update":
                int updateId = Integer.parseInt(req.getParameter("id"));
                String updateName = req.getParameter("name");
                String updateDescription = req.getParameter("description");
                double updatePrice = Double.parseDouble(req.getParameter("price"));
                String updateCategoryIdParam = req.getParameter("categoryId");
                
                Product updated;
                if (updateCategoryIdParam != null && !updateCategoryIdParam.isEmpty()) {
                    int updateCategoryId = Integer.parseInt(updateCategoryIdParam);
                    updated = new Product(updateId, updateName, updateDescription, updatePrice, updateCategoryId);
                } else {
                    updated = new Product(updateId, updateName, updateDescription, updatePrice);
                }
                productService.updateProduct(updated);
                resp.sendRedirect("/product");
                break;

            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                Product deleteProduct = productService.findProductById(deleteId);
                productService.deleteProduct(deleteProduct);
                resp.sendRedirect("/product");
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
                try {
                    List<Category> categoriesForAdd = categoryService.findAll();
                    req.setAttribute("categories", categoriesForAdd);
                } catch (Exception e) {
                    // Nếu có lỗi với category service, bỏ qua
                    req.setAttribute("categories", new ArrayList<Category>());
                }
                req.getRequestDispatcher("/product/addForm.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Product product = productService.findProductById(id);
                try {
                    List<Category> categoriesForEdit = categoryService.findAll();
                    req.setAttribute("categories", categoriesForEdit);
                } catch (Exception e) {
                    // Nếu có lỗi với category service, bỏ qua
                    req.setAttribute("categories", new ArrayList<Category>());
                }
                req.setAttribute("product", product);
                req.getRequestDispatcher("/product/editForm.jsp").forward(req, resp);
                break;
            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                Product deleteProduct = productService.findProductById(deleteId);
                productService.deleteProduct(deleteProduct);
                resp.sendRedirect("/product");
                break;
            default:
                List<Product> productList = productService.findAll();
                req.setAttribute("productList", productList);
                req.getRequestDispatcher("/product/listProduct.jsp").forward(req, resp);
        }

    }
}

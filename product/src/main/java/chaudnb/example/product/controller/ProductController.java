package chaudnb.example.product.controller;

import chaudnb.example.product.model.Product;
import chaudnb.example.product.service.IProductService;
import chaudnb.example.product.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();

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
                Product product = new Product(name, description, price);
                productService.addProduct(product);
                resp.sendRedirect("/product");
                break;

            case "find":
                int id = Integer.parseInt(req.getParameter("id"));
                Product findProduct = productService.findProductById(id);
                req.setAttribute("findProduct", findProduct);
                req.getRequestDispatcher("/product/resultSearch.jsp").forward(req, resp);
                break;

            case "update":
                int updateId = Integer.parseInt(req.getParameter("id"));
                String updateName = req.getParameter("name");
                String updateDescription = req.getParameter("description");
                double updatePrice = Double.parseDouble(req.getParameter("price"));
                Product updated = new Product(updateId, updateName, updateDescription, updatePrice);
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
                req.getRequestDispatcher("/product/addForm.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Product product = productService.findProductById(id);
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

package chaudnb.example.demo.controller;


import chaudnb.example.demo.model.Customer;
import chaudnb.example.demo.service.CustomerService;
import chaudnb.example.demo.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> listCustomer = customerService.findall();
        req.setAttribute("listCustomer",listCustomer);
        req.getRequestDispatcher("listCustomer.jsp").forward(req,resp);
    }
}

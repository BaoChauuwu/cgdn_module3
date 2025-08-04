package chaudnb.example.demo_servlet_jsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        double discount = Double.parseDouble(req.getParameter("discount"));
        double result = price * discount*0.01;
        double afterDiscount = price - result;
        req.setAttribute("result",result);
        req.setAttribute("afterDiscount",afterDiscount);
        req.getRequestDispatcher("display-discount.jsp").forward(req,resp);

    }
}

package chaudnb.example.demo.repository;

import chaudnb.example.demo.model.Customer;

import java.util.List;

public interface ICustomerRepository {

    public List<Customer> findall();
}

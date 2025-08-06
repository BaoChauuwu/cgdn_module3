package chaudnb.example.demo.service;

import chaudnb.example.demo.model.Customer;
import chaudnb.example.demo.repository.CustomerRepository;
import chaudnb.example.demo.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findall() {
        return customerRepository.findall();
    }
}

package chaudnb.example.demo.repository;

import chaudnb.example.demo.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    public  static  List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội"));
    }
    @Override
    public List<Customer> findall() {
        return customerList;
    }
}

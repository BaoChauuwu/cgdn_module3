package chaudnb.example.demo.model;

public class Customer {
    private String name;
    private String dateofBrithday;
    private String address;

    public Customer() {
    }

    public Customer(String name, String dateofBrithday, String address) {
        this.name = name;
        this.dateofBrithday = dateofBrithday;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateofBrithday() {
        return dateofBrithday;
    }

    public void setDateofBrithday(String dateofBrithday) {
        this.dateofBrithday = dateofBrithday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "name='" + name + '\'' +
                ", dateofBrithday='" + dateofBrithday + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}


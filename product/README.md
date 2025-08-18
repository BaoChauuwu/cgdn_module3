# Hệ thống Quản lý Sản phẩm

Đây là ứng dụng web Java quản lý sản phẩm sử dụng **Servlet/JSP** và **MySQL**.

## 🚀 Tính năng

- ✅ **Hiển thị danh sách sản phẩm** từ cơ sở dữ liệu MySQL
- ✅ **Thêm sản phẩm mới** với thông tin đầy đủ
- ✅ **Sửa thông tin sản phẩm** 
- ✅ **Xóa sản phẩm** với xác nhận
- ✅ **Tìm kiếm sản phẩm theo ID**
- ✅ **Tìm kiếm sản phẩm theo tên** (hỗ trợ từ khóa)
- ✅ **Giao diện thân thiện** với CSS

## 📋 Yêu cầu hệ thống

- **Java 8+**
- **Apache Tomcat 8.5+**
- **MySQL 5.7+** hoặc **MySQL 8.0+**
- **Gradle** (để build project)

## 🔧 Cài đặt

### 1. Chuẩn bị Database

#### Tùy chọn A: Sử dụng script tự động (Windows)
```bash
# Chạy script tự động (cần cập nhật đường dẫn MySQL trong file)
setup_database.bat
```

#### Tùy chọn B: Chạy SQL thủ công
```sql
# Đăng nhập vào MySQL
mysql -u root -p

# Chạy script SQL
source database_setup.sql
```

### 2. Cấu hình kết nối Database

Cập nhật thông tin kết nối trong file `BaseRepository.java`:

```java
private static final String URL ="jdbc:mysql://localhost:3306/shop_db"; 
private static final String USER ="root";
private static final String PASS ="YOUR_PASSWORD"; // Thay đổi password của bạn
```

### 3. Build và Deploy

```bash
# Build project
./gradlew build

# Deploy file WAR vào Tomcat
# Copy file build/libs/product-1.0-SNAPSHOT.war vào thư mục webapps của Tomcat
```

### 4. Chạy ứng dụng

1. Khởi động MySQL service
2. Khởi động Tomcat server
3. Truy cập: `http://localhost:8080/product`

## 📊 Cấu trúc Database

### Bảng `products`
```sql
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

## 🛠️ Cấu trúc dự án

```
src/
├── main/
│   ├── java/chaudnb/example/product/
│   │   ├── controller/ProductController.java    # Xử lý HTTP requests
│   │   ├── service/
│   │   │   ├── IProductService.java            # Interface service
│   │   │   └── ProductService.java             # Logic xử lý business
│   │   ├── repository/
│   │   │   ├── BaseRepository.java             # Kết nối database
│   │   │   ├── IProductRepository.java         # Interface repository
│   │   │   └── ProductRepository.java          # Xử lý database operations
│   │   └── model/Product.java                  # Model dữ liệu
│   └── webapp/
│       ├── product/
│       │   ├── listProduct.jsp                 # Trang danh sách sản phẩm
│       │   ├── addForm.jsp                     # Form thêm sản phẩm
│       │   ├── editForm.jsp                    # Form sửa sản phẩm
│       │   └── resultSearch.jsp                # Trang kết quả tìm kiếm
│       └── WEB-INF/web.xml                     # Cấu hình web
```

## 🔍 Hướng dẫn sử dụng

### Trang chủ - Danh sách sản phẩm
- **URL**: `/product`
- Hiển thị tất cả sản phẩm trong database
- Có 2 form tìm kiếm: theo ID và theo tên
- Nút thêm/sửa/xóa cho từng sản phẩm

### Thêm sản phẩm mới
- **URL**: `/product?action=add`
- Form nhập: Tên, Mô tả, Giá
- ID sẽ được tự động tạo bởi database

### Sửa sản phẩm
- **URL**: `/product?action=edit&id={id}`
- Pre-fill thông tin sản phẩm hiện tại
- Cho phép cập nhật tất cả thông tin

### Tìm kiếm
- **Theo ID**: Tìm chính xác 1 sản phẩm
- **Theo tên**: Tìm tất cả sản phẩm có chứa từ khóa (LIKE '%keyword%')

## ⚙️ API Endpoints

| Method | URL | Action | Mô tả |
|--------|-----|--------|-------|
| GET | `/product` | - | Hiển thị danh sách sản phẩm |
| GET | `/product?action=add` | - | Hiển thị form thêm |
| GET | `/product?action=edit&id={id}` | - | Hiển thị form sửa |
| POST | `/product` | `add` | Thêm sản phẩm mới |
| POST | `/product` | `update` | Cập nhật sản phẩm |
| POST | `/product` | `delete` | Xóa sản phẩm |
| POST | `/product` | `find` | Tìm kiếm theo ID |
| POST | `/product` | `search` | Tìm kiếm theo tên |

## 🐛 Troubleshooting

### Lỗi kết nối Database
```
SQLException: Access denied for user 'root'@'localhost'
```
**Giải pháp**: Kiểm tra username/password trong `BaseRepository.java`

### Lỗi ClassNotFoundException
```
ClassNotFoundException: com.mysql.cj.jdbc.Driver
```
**Giải pháp**: Đảm bảo MySQL Connector đã được thêm vào dependencies trong `build.gradle`

### Lỗi 404 Not Found
**Giải pháp**: 
- Kiểm tra context path trong Tomcat
- Đảm bảo file WAR được deploy đúng cách
- URL đúng là: `http://localhost:8080/product-1.0-SNAPSHOT/product`

## 📝 Changelog

### v2.0 - Database Integration ✨
- ✅ Loại bỏ dữ liệu static cứng
- ✅ Tích hợp MySQL database
- ✅ Thêm BaseRepository để quản lý kết nối
- ✅ Implement đầy đủ CRUD operations với SQL
- ✅ Thêm tính năng search by name
- ✅ Cải thiện giao diện UI/UX
- ✅ Thêm validation và error handling

### v1.0 - Static Data
- ✅ CRUD cơ bản với ArrayList static
- ✅ Giao diện JSP đơn giản

## 🤝 Đóng góp

1. Fork dự án
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

---

**Tác giả**: chaudnb  
**Phiên bản**: 2.0  
**Ngày cập nhật**: 2025-01-08 
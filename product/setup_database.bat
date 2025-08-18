@echo off
echo Setting up MySQL database for Product Management System...
echo.

REM Thay đổi đường dẫn này thành đường dẫn MySQL bin của bạn
set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin"

REM Kiểm tra xem MySQL có tồn tại không
if not exist %MYSQL_PATH%\mysql.exe (
    echo MySQL not found at %MYSQL_PATH%
    echo Please update MYSQL_PATH in this script to point to your MySQL installation
    pause
    exit /b 1
)

echo Connecting to MySQL and running setup script...
echo Please enter your MySQL root password when prompted.
echo.

%MYSQL_PATH%\mysql.exe -u root -p < database_setup.sql

if %ERRORLEVEL% == 0 (
    echo.
    echo ✓ Database setup completed successfully!
    echo ✓ Database 'shop_db' created
    echo ✓ Table 'products' created
    echo ✓ Sample data inserted
    echo.
    echo Your application is now ready to use with MySQL database.
) else (
    echo.
    echo ✗ Database setup failed!
    echo Please check your MySQL installation and credentials.
)

echo.
pause 
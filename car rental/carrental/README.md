# CarRental (Spring Boot, MySQL, Thymeleaf)

A minimal backend with two pages (Dashboard, Cars). No login page.

## Prerequisites
- Java 17+
- Maven 3.8+
- MySQL 8+

## Setup
1. Create database in MySQL:
   ```sql
   CREATE DATABASE IF NOT EXISTS car_rental;
   ```
2. Update `src/main/resources/application.properties` with your MySQL username/password.
3. Run the app:
   ```bash
   mvn spring-boot:run
   ```
4. Visit:
   - http://localhost:8080/dashboard
   - http://localhost:8080/cars

Notes:
- Tables will be created automatically by JPA (ddl-auto=update).
- `data.sql` preloads users and cars.

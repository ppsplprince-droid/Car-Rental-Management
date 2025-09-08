-- ============================================================
--  Car Rental DB (creates everything from scratch)
--  WARNING: Drops the DB if it already exists.
-- ============================================================

DROP DATABASE IF EXISTS car_rental;
CREATE DATABASE car_rental CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE car_rental;

-- ------------------------------------------------------------
--  Tables
-- ------------------------------------------------------------

-- Users
CREATE TABLE users (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  role VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Cars
CREATE TABLE cars (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  image_url VARCHAR(512),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Bookings
CREATE TABLE bookings (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  days INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  booking_date DATETIME NOT NULL,
  car_id BIGINT NOT NULL,
  CONSTRAINT fk_bookings_car
    FOREIGN KEY (car_id) REFERENCES cars(id)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_bookings_car ON bookings(car_id);

-- ------------------------------------------------------------
--  Seed data
-- ------------------------------------------------------------

-- Users
INSERT INTO users (username, password, role) VALUES
('admin',   'admin123',   'ADMIN'),
('manager', 'manager123', 'MANAGER'),
('user1',   'password',   'USER');

-- Cars with direct internet image URLs (Wikimedia)
INSERT INTO cars (brand, model, price, image_url) VALUES
('Ferrari',      '488 Spider',     2500.00, 'https://upload.wikimedia.org/wikipedia/commons/2/24/Ferrari_488_Spider_IMG_2188.jpg'),
('Lamborghini',  'Huracán EVO',    3000.00, 'https://upload.wikimedia.org/wikipedia/commons/c/c8/Lamborghini_Huracan_EVO_Genf_2019_1Y7A5669.jpg'),
('Bugatti',      'Chiron',         8000.00, 'https://upload.wikimedia.org/wikipedia/commons/4/41/Bugatti_Chiron_IMG_2789.jpg'),
('McLaren',      '720S',           2700.00, 'https://upload.wikimedia.org/wikipedia/commons/e/e2/McLaren_720S%2C_Genf_2019_1Y7A5621.jpg'),
('Porsche',      '911 Turbo S',    2200.00, 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Porsche_992_Turbo_S_IMG_3809.jpg'),
('Aston Martin', 'DB11',           2000.00, 'https://upload.wikimedia.org/wikipedia/commons/9/97/Aston_Martin_DB11_V12_IMG_2645.jpg'),
('Bentley',      'Continental GT', 2800.00, 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Bentley_Continental_GT_2018_IMG_0700.jpg'),
('Rolls-Royce',  'Wraith',         5000.00, 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Rolls-Royce_Wraith_Genf_2014_1Y7A1044.jpg'),
('Maserati',     'MC20',           3200.00, 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Maserati_MC20_IMG_4056.jpg'),
('Koenigsegg',   'Jesko',         12000.00, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Koenigsegg_Jesko_IMG_0701.jpg'),
('Pagani',       'Huayra',        15000.00, 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Pagani_Huayra_BC_IMG_2757.jpg');

-- (Optional) example booking
-- INSERT INTO bookings (customer_name, days, total_price, booking_date, car_id)
-- VALUES ('Sample User', 2, 5000.00, NOW(), 1);
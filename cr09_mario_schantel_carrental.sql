-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 24. Jun 2018 um 14:32
-- Server-Version: 5.6.38
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_mario_schantel_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(30) NOT NULL,
  `house_number` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `fk_invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `license_plate` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `brand` enum('Bmw','Audi','Mercedes','Vw') NOT NULL,
  `category` varchar(30) NOT NULL,
  `seats` enum('2','4','5','7') NOT NULL,
  `fuel` enum('petrol','diesel') NOT NULL,
  `transmission` enum('automatic','manual') NOT NULL,
  `km` int(11) NOT NULL,
  `fk_pricelist_cars_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `discount`
--

CREATE TABLE `discount` (
  `discount_card_number` int(11) NOT NULL,
  `family&friends` tinyint(1) NOT NULL,
  `bonuscard_5%` tinyint(1) NOT NULL,
  `bonuscard_10%` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `license_nr` varchar(30) NOT NULL,
  `license_date` date NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insurance_type` varchar(30) NOT NULL,
  `vehicle_damage` tinyint(1) NOT NULL,
  `third_party_damage` tinyint(1) NOT NULL,
  `medical_payments` tinyint(1) NOT NULL,
  `fk_pricelist_insurance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_price` int(11) NOT NULL,
  `fk_booking_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_insurance_type` varchar(30) NOT NULL,
  `fk_payment_id` int(11) NOT NULL,
  `fk_pickup_location_id` int(11) NOT NULL,
  `fk_return_location_id` int(11) NOT NULL,
  `fk_discount_card_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `credit_card` varchar(30) NOT NULL,
  `credit_card_nr` int(11) NOT NULL,
  `expire_date` date NOT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pickup_location`
--

CREATE TABLE `pickup_location` (
  `pickup_location_id` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_time` date NOT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pricelist_cars`
--

CREATE TABLE `pricelist_cars` (
  `pricelist_cars_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pricelist_insurance`
--

CREATE TABLE `pricelist_insurance` (
  `pricelist_insurance_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_insurance_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `registered_user`
--

CREATE TABLE `registered_user` (
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `date_of_reg` date NOT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_location`
--

CREATE TABLE `return_location` (
  `return_location` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `return_time` date NOT NULL,
  `fk_addres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staff`
--

CREATE TABLE `staff` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_pricelist_cars_id` (`fk_pricelist_cars_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_card_number`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_type`),
  ADD KEY `fk_pricelist_insurance_id` (`fk_pricelist_insurance_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`) USING BTREE,
  ADD KEY `fk_booking_id` (`fk_booking_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_insurance_type` (`fk_insurance_type`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_pickup_location_id` (`fk_pickup_location_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`),
  ADD KEY `fk_discount_card_number` (`fk_discount_card_number`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `pickup_location`
--
ALTER TABLE `pickup_location`
  ADD PRIMARY KEY (`pickup_location_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `pricelist_cars`
--
ALTER TABLE `pricelist_cars`
  ADD PRIMARY KEY (`pricelist_cars_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indizes für die Tabelle `pricelist_insurance`
--
ALTER TABLE `pricelist_insurance`
  ADD PRIMARY KEY (`pricelist_insurance_id`),
  ADD KEY `fk_insurance_type` (`fk_insurance_type`);

--
-- Indizes für die Tabelle `registered_user`
--
ALTER TABLE `registered_user`
  ADD PRIMARY KEY (`login`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_location`),
  ADD KEY `fk_addres_id` (`fk_addres_id`);

--
-- Indizes für die Tabelle `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_card_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pickup_location`
--
ALTER TABLE `pickup_location`
  MODIFY `pickup_location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pricelist_cars`
--
ALTER TABLE `pricelist_cars`
  MODIFY `pricelist_cars_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pricelist_insurance`
--
ALTER TABLE `pricelist_insurance`
  MODIFY `pricelist_insurance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `return_location`
--
ALTER TABLE `return_location`
  MODIFY `return_location` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `staff`
--
ALTER TABLE `staff`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `staff` (`employee_id`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_pricelist_cars_id`) REFERENCES `car` (`car_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_pricelist_insurance_id`) REFERENCES `pricelist_insurance` (`pricelist_insurance_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `invoice_ibfk_10` FOREIGN KEY (`fk_discount_card_number`) REFERENCES `discount` (`discount_card_number`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `staff` (`employee_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `invoice_ibfk_6` FOREIGN KEY (`fk_insurance_type`) REFERENCES `insurance` (`insurance_type`),
  ADD CONSTRAINT `invoice_ibfk_7` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `invoice_ibfk_8` FOREIGN KEY (`fk_pickup_location_id`) REFERENCES `pickup_location` (`pickup_location_id`),
  ADD CONSTRAINT `invoice_ibfk_9` FOREIGN KEY (`fk_return_location_id`) REFERENCES `return_location` (`return_location`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `pickup_location`
--
ALTER TABLE `pickup_location`
  ADD CONSTRAINT `pickup_location_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

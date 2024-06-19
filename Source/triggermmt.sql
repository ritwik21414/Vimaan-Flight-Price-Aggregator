-- Create trigger in mmt
DELIMITER //

CREATE TRIGGER db1_table1_trigger AFTER INSERT ON mmt.price
FOR EACH ROW
BEGIN
    INSERT INTO merged.price (MyUnknownColumn, FlightName, FlightCode, DepartingCity, DepartingTime, ArrivingCity, ArrivingTime, Duration, MMTPrice, YatraPrice, GoPrice)
    VALUES (price.MyUnknownColumn, price.FlightName, price.FlightCode, price.DepartingCity, price.DepartingTime, price.ArrivingCity, price.ArrivingTime, price.Duration, price.MMTPrice, price.YatraPrice, price.GoPrice)
    ON DUPLICATE KEY UPDATE
    FlightCode = VALUES(FlightCode);
END //

DELIMITER ;

-- Create trigger in mmt for AFTER UPDATE
DELIMITER //
CREATE TRIGGER db1_table1_update_trigger AFTER UPDATE ON mmt.price
FOR EACH ROW
BEGIN
    UPDATE merged.price
    SET MyUnknownColumn=price.MyUnknownColumn,
        FlightName=price.FlightName, 
        FlightCode=price.FlightCode, 
        DepartingCity=price.DepartingCity, 
        DepartingTime=price.DepartingTime, 
        ArrivingCity=price.ArrivingCity, 
        ArrivingTime=price.ArrivingTime, 
        Duration=price.Duration, 
        MMTPrice=price.MMTPrice, 
        YatraPrice=price.YatraPrice, 
        GoPrice=price.GoPrice
    WHERE FlightCode = price.FligthCode;
END //

DELIMITER ;

-- Create trigger in mmt for AFTER DELETE
DELIMITER //

CREATE TRIGGER db1_table1_delete_trigger AFTER DELETE ON mmt.price
FOR EACH ROW
BEGIN
    DELETE FROM merged.price
    WHERE FlightCode = price.FlightCode;
END //

DELIMITER ;


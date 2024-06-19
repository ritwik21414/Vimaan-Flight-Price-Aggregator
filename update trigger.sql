
-- Create trigger in yatra for AFTER UPDATE
DELIMITER //
CREATE TRIGGER db1_table1_update_trigger AFTER UPDATE ON yatra.price
FOR EACH ROW
BEGIN
    UPDATE merged.price
    SET MyUnknownColumn=new.MyUnknownColumn,
        FlightName=new.FlightName, 
        FlightCode=new.FlightCode, 
        DepartingCity=new.DepartingCity, 
        DepartingTime=new.DepartingTime, 
        ArrivingCity=new.ArrivingCity, 
        ArrivingTime=new.ArrivingTime, 
        Duration=new.Duration, 
        YatraPrice=new.YatraPrice
    WHERE FlightCode = price.FlightCode;
END //

DELIMITER ;


-- Create trigger in mmt for AFTER UPDATE
DELIMITER //
CREATE TRIGGER db3_table1_update_trigger AFTER UPDATE ON mmt.price
FOR EACH ROW
BEGIN
    UPDATE merged.price
    SET MyUnknownColumn=new.MyUnknownColumn,
        FlightName=new.FlightName, 
        FlightCode=new.FlightCode, 
        DepartingCity=new.DepartingCity, 
        DepartingTime=new.DepartingTime, 
        ArrivingCity=new.ArrivingCity, 
        ArrivingTime=new.ArrivingTime, 
        Duration=new.Duration, 
        
        mmtPrice=new.mmtPrice
    WHERE FlightCode = price.FligthCode;
END //

DELIMITER ;



-- Create trigger in goibibo for AFTER UPDATE
DELIMITER //
CREATE TRIGGER db2_table1_update_trigger AFTER UPDATE ON goibibo.price
FOR EACH ROW
BEGIN
    UPDATE merged.price
    SET MyUnknownColumn=new.MyUnknownColumn,
        FlightName=new.FlightName, 
        FlightCode=new.FlightCode, 
        DepartingCity=new.DepartingCity, 
        DepartingTime=new.DepartingTime, 
        ArrivingCity=new.ArrivingCity, 
        ArrivingTime=new.ArrivingTime, 
        Duration=new.Duration, 
        
        goPrice=new.goPrice
    WHERE FlightCode = price.FligthCode;
END //

DELIMITER ;


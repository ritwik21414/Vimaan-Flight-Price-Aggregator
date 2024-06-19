-- Create trigger in merged for AFTER DELETE
DELIMITER //

CREATE TRIGGER merged_trigger AFTER DELETE ON merged.price
FOR EACH ROW
BEGIN
    DELETE FROM goibibo.price
    WHERE FlightCode = price.FlightCode;
END //

DELIMITER ;

-- Create trigger in merged for AFTER DELETE
DELIMITER //

CREATE TRIGGER merged_trigger AFTER DELETE ON merged.price
FOR EACH ROW
BEGIN
    DELETE FROM mmt.price
    WHERE FlightCode = price.FlightCode;
END //

DELIMITER ;

-- Create trigger in merged for AFTER DELETE
DELIMITER //

CREATE TRIGGER merged_trigger AFTER DELETE ON merged.price
FOR EACH ROW
BEGIN
    DELETE FROM yatra.price
    WHERE FlightCode = price.FlightCode;
END //

DELIMITER ;


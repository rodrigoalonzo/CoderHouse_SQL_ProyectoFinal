CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_ordenar_productos`(IN Campo_a_ordenar VARCHAR (50))
BEGIN

	if Campo_a_ordenar <> '' THEN
		SET @orden_productos = CONCAT('ORDER BY ', Campo_a_ordenar);
	else
		SET @orden_productos = '';
	end if;
    
    SET @clausula = CONCAT('SELECT * FROM proyectofinal_coderhouse.productos ', @orden_productos, ';');
    
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    
    DEALLOCATE PREPARE runSQL;
    
END
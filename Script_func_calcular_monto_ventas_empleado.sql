CREATE DEFINER=`root`@`localhost` FUNCTION `Calculadora monto de ventas por empleado`(IdEmpleado_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

	DECLARE monto_ventas DECIMAL;
    
	SELECT SUM(Monto_total) into monto_ventas
    FROM ventas
    WHERE IdEmpleado = IdEmpleado_param;
    
    RETURN monto_ventas;
    
END
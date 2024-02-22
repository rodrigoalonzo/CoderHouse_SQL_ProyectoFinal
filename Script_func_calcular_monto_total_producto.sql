CREATE DEFINER=`root`@`localhost` FUNCTION `Calculadora monto total de producto`(IdProducto_param INT, cantidad_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

    DECLARE precio_producto DECIMAL;
    DECLARE resultado DECIMAL;
    
    SELECT Precio into precio_producto
    FROM productos
    WHERE IdProducto = IdProducto_param;
    
    SET resultado = precio_producto * cantidad_param;
    
    RETURN resultado;
    
END
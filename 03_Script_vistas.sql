-- VISTAS --

CREATE OR REPLACE VIEW ventas_sucursales_norte AS
	(SELECT v.*
    FROM ventas v INNER JOIN sucursales s ON (v.IdSucursal = s.IdSucursal)
    WHERE s.Nombre_sucursal LIKE '%Norte%');
    
CREATE OR REPLACE VIEW ventas_sucursales_centro AS
	(SELECT v.*
    FROM ventas v INNER JOIN sucursales s ON (v.IdSucursal = s.IdSucursal)
    WHERE s.Nombre_sucursal LIKE '%Centro%');
    
CREATE OR REPLACE VIEW ventas_sucursales_sur AS
	(SELECT v.*
    FROM ventas v INNER JOIN sucursales s ON (v.IdSucursal = s.IdSucursal)
    WHERE s.Nombre_sucursal LIKE '%Sur%');
    
CREATE OR REPLACE VIEW cantidad_de_ventas_por_cliente AS
	(SELECT cl.IdCliente, CONCAT(cl.Nombre,' ',cl.Apellido) AS 'Nombre completo de cliente', COUNT(cl.IdCliente) AS 'Cantidad de ventas'
    FROM ventas v INNER JOIN clientes cl ON (v.IdCliente = cl.IdCliente)
    GROUP BY cl.IdCliente
    ORDER BY COUNT(cl.IdCliente) desc
    );
    
CREATE OR REPLACE VIEW Monto_total_venta_por_cliente AS
	(SELECT CONCAT(cl.Nombre,' ',cl.Apellido) AS 'Nombre completo de cliente', SUM(v.Monto_total) AS 'Monto total cliente'
    FROM ventas v INNER JOIN clientes cl ON (v.IdCliente = cl.IdCliente)
    GROUP BY cl.IdCliente
    ORDER BY SUM(v.Monto_total) desc
    );
    
CREATE OR REPLACE VIEW Monto_total_venta_por_cliente_menor_a_1_millon AS
	(SELECT CONCAT(cl.Nombre,', ',cl.Apellido) AS 'Nombre completo de cliente', SUM(v.Monto_total) AS 'Monto total cliente'
    FROM ventas v INNER JOIN clientes cl ON (v.IdCliente = cl.IdCliente)
    GROUP BY cl.IdCliente
    HAVING SUM(v.Monto_total) <= 1000000
    ORDER BY SUM(v.Monto_total) desc
    );
    
CREATE OR REPLACE VIEW Cantidad_vendida_por_producto AS
	(SELECT pr.Producto, SUM(v.Cantidad) AS 'Cantidad del producto'
    FROM ventas v INNER JOIN productos pr ON (v.IdProducto = pr.IdProducto)
    GROUP BY pr.IdProducto
    ORDER BY SUM(v.Cantidad) desc
    );
    
CREATE OR REPLACE VIEW Monto_total_venta_por_producto AS
	(SELECT pr.Producto, SUM(v.Monto_total) AS 'Monto total por producto'
    FROM ventas v INNER JOIN productos pr ON (v.IdProducto = pr.IdProducto)
    GROUP BY pr.IdProducto
    ORDER BY SUM(v.Monto_total) desc
    );
    
CREATE OR REPLACE VIEW Monto_total_venta_por_empleado AS
	(SELECT CONCAT(em.Nombre,' ',em.Apellido) AS 'Nombre completo de empleado', SUM(v.Monto_total) AS 'Monto total empleado'
    FROM ventas v INNER JOIN empleados em ON (v.IdEmpleado = em.IdEmpleado)
    GROUP BY em.IdEmpleado
    ORDER BY SUM(v.Monto_total) desc
    );
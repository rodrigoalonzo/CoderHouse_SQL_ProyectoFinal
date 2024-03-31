/* SCRIPT DE TRANSACCIONES */

/* ROLLBACK Y COMMIT */

SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;

START TRANSACTION;

DELETE FROM ventas
WHERE IdVenta = 7;

SELECT * FROM ventas
ORDER BY IdRegistroVenta;

/*ROLLBACK:
ROLLBACK;
SELECT * FROM ventas
ORDER BY IdRegistroVenta;
*/

/*COMMIT:
COMMIT;
*/

/*SENTENCIAS DE INSERCIÓN DE REGISTROS ELIMINADOS:
INSERT INTO ventas (IdRegistroVenta, IdVenta, IdProducto, IdCliente, IdEmpleado, IdSucursal, Fecha_venta, Remito, Factura, Cantidad, Precio_unitario, Monto_total) VALUES (NULL, 7, 81, 12, 5, 1, '2020-09-15 00:00:00', '0001-74614240', '0001-98443290', 4, 3443, 13772);
INSERT INTO ventas (IdRegistroVenta, IdVenta, IdProducto, IdCliente, IdEmpleado, IdSucursal, Fecha_venta, Remito, Factura, Cantidad, Precio_unitario, Monto_total) VALUES (NULL, 7, 46, 12, 5, 1, '2020-09-15 00:00:00', '0001-74614240', '0001-98443290', 2, 635598, 1271196);
INSERT INTO ventas (IdRegistroVenta, IdVenta, IdProducto, IdCliente, IdEmpleado, IdSucursal, Fecha_venta, Remito, Factura, Cantidad, Precio_unitario, Monto_total) VALUES (NULL, 7, 77, 12, 5, 1, '2020-09-15 00:00:00', '0001-74614240', '0001-98443290', 1, 168248, 168248);
INSERT INTO ventas (IdRegistroVenta, IdVenta, IdProducto, IdCliente, IdEmpleado, IdSucursal, Fecha_venta, Remito, Factura, Cantidad, Precio_unitario, Monto_total) VALUES (NULL, 7, 81, 12, 5, 1, '2020-09-15 00:00:00', '0001-74614240', '0001-98443290', 7, 3443, 24101);
INSERT INTO ventas (IdRegistroVenta, IdVenta, IdProducto, IdCliente, IdEmpleado, IdSucursal, Fecha_venta, Remito, Factura, Cantidad, Precio_unitario, Monto_total) VALUES (NULL, 7, 27, 12, 5, 1, '2020-09-15 00:00:00', '0001-74614240', '0001-98443290', 6, 3910, 23460);
*/

/* ------------------------------------------ */

/* SAVEPOINT */

START TRANSACTION;
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Eunice', 'Elmes', 25746399, '2023-04-11', 1);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Isaiah', 'Weall', 26637127, '2023-07-15', 4);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Mar', 'Ibbison', 37846880, '2023-11-26', 1);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Neale', 'McCurrie', 37022184, '2023-07-28', 4);
savepoint lote_1;
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Caria', 'Sparhawk', 17842944, '2022-03-16', 3);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Rodie', 'Byas', 27348258, '2023-05-31', 5);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Asia', 'Jozwicki', 20986587, '2021-01-01', 4);
INSERT INTO empleados (IdEmpleado, Nombre, Apellido, DNI, Fecha_ingreso, IdSucursal) VALUES (NULL, 'Vernice', 'Sugar', 19249252, '2023-09-12', 4);
savepoint lote_2;

SELECT * FROM empleados;

/*ROLLBACK TO SAVEPOINT "lote_1":
ROLLBACK TO lote_1;
SELECT * FROM empleados;
*/

/* ELIMINAR SAVEPOINT "lote_1":
RELEASE SAVEPOINT lote_1;
SELECT * FROM empleados;
*/
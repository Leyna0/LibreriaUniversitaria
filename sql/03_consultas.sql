
-- ============================================================
-- SCRIPT 3: CONSULTAS DEL CASO 1
-- ============================================================


-- CONSULTA 1:
-- Obtener las ventas totales por categoria de libro y año.

SELECT
    l.categoria,
    t.anio,
    SUM(f.cantidad_vendida) AS total_libros_vendidos,
    SUM(f.precio_total_usd) AS ventas_totales_usd

FROM fact_venta f

INNER JOIN dim_libro l
    ON f.sk_libro = l.sk_libro

INNER JOIN dim_tiempo t
    ON f.sk_tiempo = t.sk_tiempo

GROUP BY
    l.categoria,
    t.anio

ORDER BY
    t.anio,
    l.categoria;


-- CONSULTA 2:
-- Calcular los ingresos por sucursal y mes.

SELECT
    s.nombre AS sucursal,
    t.anio,
    t.mes,
    SUM(f.precio_total_usd) AS ingresos_brutos_usd,
    SUM(f.descuento_aplicado) AS descuentos_usd,
    SUM(f.precio_total_usd - f.descuento_aplicado)
        AS ingresos_netos_usd

FROM fact_venta f

INNER JOIN dim_sucursal s
    ON f.sk_sucursal = s.sk_sucursal

INNER JOIN dim_tiempo t
    ON f.sk_tiempo = t.sk_tiempo

GROUP BY
    s.nombre,
    t.anio,
    t.mes

ORDER BY
    t.anio,
    t.mes,
    s.nombre;

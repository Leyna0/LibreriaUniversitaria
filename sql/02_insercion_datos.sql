
-- ============================================================
-- SCRIPT 2: INSERCION DE DATOS
-- CASO 1: LIBRERIA UNIVERSITARIA
-- ============================================================


-- 1. DIMENSION LIBRO

INSERT INTO dim_libro
(id_libro_nk, titulo, autor, categoria)
VALUES
('L001', 'A Brief History of Time', 'Stephen Hawking', 'Ciencia'),
('L002', 'The Feynman Lectures on Physics', 'Richard Feynman', 'Fisica'),
('L003', 'On the Origin of Species', 'Charles Darwin', 'Biologia'),
('L004', 'Silent Spring', 'Rachel Carson', 'Biologia'),
('L005', 'The Selfish Gene', 'Richard Dawkins', 'Biologia'),
('L006', 'Introduction to Algorithms', 'Thomas H. Cormen y otros', 'Computacion'),
('L007', 'Clean Code', 'Robert C. Martin', 'Programacion'),
('L008', 'Code', 'Charles Petzold', 'Computacion'),
('L009', 'The Pragmatic Programmer', 'David Thomas y Andrew Hunt', 'Programacion'),
('L010', 'The Design of Everyday Things', 'Don Norman', 'Ingenieria'),
('L011', 'Engineering Mechanics: Statics', 'Russell C. Hibbeler', 'Ingenieria'),
('L012', 'Fundamentals of Electric Circuits', 'Charles K. Alexander y Matthew N. O. Sadiku', 'Electronica'),
('L013', 'The Art of Electronics', 'Paul Horowitz y Winfield Hill', 'Electronica'),
('L014', 'Structure and Interpretation of Computer Programs', 'Harold Abelson y Gerald Jay Sussman', 'Computacion'),
('L015', 'The Innovators', 'Walter Isaacson', 'Tecnologia');


-- 2. DIMENSION TIEMPO

INSERT INTO dim_tiempo
(fecha, anio, mes, dia)
VALUES
('2025-01-15', 2025, 1, 15),
('2025-02-10', 2025, 2, 10),
('2025-03-05', 2025, 3, 5),
('2025-04-20', 2025, 4, 20),
('2025-05-12', 2025, 5, 12),
('2025-06-18', 2025, 6, 18),
('2025-07-08', 2025, 7, 8),
('2025-08-22', 2025, 8, 22),
('2025-09-14', 2025, 9, 14),
('2025-10-03', 2025, 10, 3),
('2025-11-19', 2025, 11, 19),
('2025-12-09', 2025, 12, 9),
('2026-01-16', 2026, 1, 16),
('2026-02-11', 2026, 2, 11),
('2026-03-07', 2026, 3, 7);


-- 3. DIMENSION CLIENTE

INSERT INTO dim_cliente
(id_cliente_nk, nombre, provincia)
VALUES
('C001', 'Ana Torres', 'Pichincha'),
('C002', 'Carlos Mendoza', 'Imbabura'),
('C003', 'Daniela Ruiz', 'Tungurahua'),
('C004', 'Luis Andrade', 'Azuay'),
('C005', 'Sofia Castro', 'Guayas'),
('C006', 'Miguel Herrera', 'Manabi'),
('C007', 'Valeria Lopez', 'Loja'),
('C008', 'Andres Molina', 'Chimborazo'),
('C009', 'Camila Vega', 'Cotopaxi'),
('C010', 'Javier Flores', 'El Oro'),
('C011', 'Paula Ramirez', 'Esmeraldas'),
('C012', 'Diego Cardenas', 'Santo Domingo'),
('C013', 'Gabriela Silva', 'Carchi'),
('C014', 'Mateo Ortiz', 'Los Rios'),
('C015', 'Isabel Paredes', 'Santa Elena');


-- 4. DIMENSION SUCURSAL

INSERT INTO dim_sucursal
(id_sucursal_nk, nombre, ciudad)
VALUES
('S001', 'Libreria Campus Central', 'Quito'),
('S002', 'Libreria Norte', 'Ibarra'),
('S003', 'Libreria Universitaria', 'Ambato'),
('S004', 'Libreria Academica', 'Cuenca'),
('S005', 'Libreria del Pacifico', 'Guayaquil'),
('S006', 'Libreria Tecnologica', 'Portoviejo'),
('S007', 'Libreria del Sur', 'Loja'),
('S008', 'Libreria Politecnica', 'Riobamba'),
('S009', 'Libreria Andina', 'Latacunga'),
('S010', 'Libreria Cientifica', 'Machala'),
('S011', 'Libreria del Litoral', 'Esmeraldas'),
('S012', 'Libreria Digital', 'Santo Domingo'),
('S013', 'Libreria Fronteriza', 'Tulcan'),
('S014', 'Libreria Los Rios', 'Babahoyo'),
('S015', 'Libreria Peninsula', 'Salinas');


-- 5. TABLA DE HECHOS

INSERT INTO fact_venta (
    sk_libro,
    sk_tiempo,
    sk_cliente,
    sk_sucursal,
    cantidad_vendida,
    precio_total_usd,
    descuento_aplicado
)

SELECT
    l.sk_libro,
    t.sk_tiempo,
    c.sk_cliente,
    s.sk_sucursal,
    v.cantidad_vendida,
    v.precio_total_usd,
    v.descuento_aplicado

FROM (
    VALUES
    ('L001', DATE '2025-01-15', 'C001', 'S001', 2, 45.00, 5.00),
    ('L002', DATE '2025-02-10', 'C002', 'S002', 1, 60.00, 0.00),
    ('L003', DATE '2025-03-05', 'C003', 'S003', 3, 75.00, 10.00),
    ('L004', DATE '2025-04-20', 'C004', 'S004', 1, 28.00, 2.00),
    ('L005', DATE '2025-05-12', 'C005', 'S005', 2, 50.00, 5.00),
    ('L006', DATE '2025-06-18', 'C006', 'S006', 1, 85.00, 8.00),
    ('L007', DATE '2025-07-08', 'C007', 'S007', 2, 70.00, 5.00),
    ('L008', DATE '2025-08-22', 'C008', 'S008', 1, 35.00, 0.00),
    ('L009', DATE '2025-09-14', 'C009', 'S009', 2, 90.00, 10.00),
    ('L010', DATE '2025-10-03', 'C010', 'S010', 1, 40.00, 4.00),
    ('L011', DATE '2025-11-19', 'C011', 'S011', 1, 65.00, 5.00),
    ('L012', DATE '2025-12-09', 'C012', 'S012', 2, 80.00, 8.00),
    ('L013', DATE '2026-01-16', 'C013', 'S013', 1, 95.00, 10.00),
    ('L014', DATE '2026-02-11', 'C014', 'S014', 2, 110.00, 10.00),
    ('L015', DATE '2026-03-07', 'C015', 'S015', 1, 55.00, 5.00)

) AS v (
    id_libro,
    fecha,
    id_cliente,
    id_sucursal,
    cantidad_vendida,
    precio_total_usd,
    descuento_aplicado
)

INNER JOIN dim_libro l
    ON l.id_libro_nk = v.id_libro

INNER JOIN dim_tiempo t
    ON t.fecha = v.fecha

INNER JOIN dim_cliente c
    ON c.id_cliente_nk = v.id_cliente

INNER JOIN dim_sucursal s
    ON s.id_sucursal_nk = v.id_sucursal;


-- VERIFICACION DE REGISTROS

SELECT 'dim_libro' AS tabla, COUNT(*) AS total_registros
FROM dim_libro

UNION ALL

SELECT 'dim_tiempo', COUNT(*)
FROM dim_tiempo

UNION ALL

SELECT 'dim_cliente', COUNT(*)
FROM dim_cliente

UNION ALL

SELECT 'dim_sucursal', COUNT(*)
FROM dim_sucursal

UNION ALL

SELECT 'fact_venta', COUNT(*)
FROM fact_venta;

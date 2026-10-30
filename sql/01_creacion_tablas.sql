
-- ============================================================
-- UNIVERSIDAD TECNOLOGICA INDOAMERICA
-- CASO 1: LIBRERIA UNIVERSITARIA
-- ESTUDIANTES: LEYNA PEREZ Y KAREN CABRERA
-- SCRIPT 1: CREACION DE TABLAS
-- ============================================================


-- 1. DIMENSION LIBRO

CREATE TABLE dim_libro (
    sk_libro SERIAL PRIMARY KEY,
    id_libro_nk VARCHAR(10) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    categoria VARCHAR(60) NOT NULL
);


-- 2. DIMENSION TIEMPO

CREATE TABLE dim_tiempo (
    sk_tiempo SERIAL PRIMARY KEY,
    fecha DATE NOT NULL UNIQUE,
    anio INT NOT NULL,
    mes INT NOT NULL CHECK (mes BETWEEN 1 AND 12),
    dia INT NOT NULL CHECK (dia BETWEEN 1 AND 31),

    CONSTRAINT ck_tiempo_fecha
        CHECK (
            anio = EXTRACT(YEAR FROM fecha)
            AND mes = EXTRACT(MONTH FROM fecha)
            AND dia = EXTRACT(DAY FROM fecha)
        )
);


-- 3. DIMENSION CLIENTE

CREATE TABLE dim_cliente (
    sk_cliente SERIAL PRIMARY KEY,
    id_cliente_nk VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL,
    provincia VARCHAR(60) NOT NULL
);


-- 4. DIMENSION SUCURSAL

CREATE TABLE dim_sucursal (
    sk_sucursal SERIAL PRIMARY KEY,
    id_sucursal_nk VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(60) NOT NULL
);


-- 5. TABLA DE HECHOS

CREATE TABLE fact_venta (
    sk_libro INT NOT NULL,
    sk_tiempo INT NOT NULL,
    sk_cliente INT NOT NULL,
    sk_sucursal INT NOT NULL,

    cantidad_vendida INT NOT NULL
        CHECK (cantidad_vendida > 0),

    precio_total_usd NUMERIC(12,2) NOT NULL
        CHECK (precio_total_usd >= 0),

    descuento_aplicado NUMERIC(12,2) NOT NULL
        CHECK (descuento_aplicado >= 0),

    CONSTRAINT fk_venta_libro
        FOREIGN KEY (sk_libro)
        REFERENCES dim_libro(sk_libro),

    CONSTRAINT fk_venta_tiempo
        FOREIGN KEY (sk_tiempo)
        REFERENCES dim_tiempo(sk_tiempo),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (sk_cliente)
        REFERENCES dim_cliente(sk_cliente),

    CONSTRAINT fk_venta_sucursal
        FOREIGN KEY (sk_sucursal)
        REFERENCES dim_sucursal(sk_sucursal),

    CONSTRAINT ck_descuento_venta
        CHECK (descuento_aplicado <= precio_total_usd)
);

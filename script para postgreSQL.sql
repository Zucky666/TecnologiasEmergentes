-- Crear tabla de empleados
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    sueldo NUMERIC(10,2) NOT NULL,
    meses_trabajados INT NOT NULL CHECK (meses_trabajados >= 0)
);

-- Crear tabla de recursos humanos
CREATE TABLE recursos_humanos (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    mes VARCHAR(20) NOT NULL,
    dias_atraso INT NOT NULL CHECK (dias_atraso >= 0),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id) ON DELETE CASCADE
);

-- Insertar datos de ejemplo
INSERT INTO empleados (nombre, apellido, sueldo, meses_trabajados) VALUES
('Juan', 'Pérez', 3500.00, 12),
('Ana', 'García', 4200.00, 8),
('Luis', 'Martínez', 2800.00, 6);

INSERT INTO recursos_humanos (empleado_id, mes, dias_atraso) VALUES
(1, 'Enero', 2),
(1, 'Febrero', 0),
(2, 'Enero', 1),
(3, 'Enero', 3),
(3, 'Febrero', 1);

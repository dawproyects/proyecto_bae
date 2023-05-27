--- Procedimiento de inserción masiva de datos en tabla paciente
DELIMITER //
create procedure insertar_pacientes(IN inserts int)
BEGIN
    DECLARE ultimo_paciente INT;
    DECLARE _documento VARCHAR(9);
    DECLARE contador INT;
    DECLARE _nombre VARCHAR(55);
    DECLARE _apellido VARCHAR(55);
    DECLARE _sexo INT;
    DECLARE _date VARCHAR(55);
    DECLARE _telefono INT;
    SET ultimo_paciente = (SELECT COUNT(*) FROM paciente);
    SET contador = 0;
    SET _nombre = (SELECT nombre FROM nombres ORDER BY RAND() LIMIT 1);
    SET _apellido = (SELECT apellido FROM nombres ORDER BY RAND() LIMIT 1);
    SET _sexo = ROUND(RAND() + 1);
    SET _date = STR_TO_DATE(CONCAT(FLOOR(1 + (RAND() + 11)), '-', FLOOR(1 + (RAND() + 27)), '-', FLOOR(1900 + (RAND() + 123))), '%m-%d-%Y');
    while contador < inserts do
        SET _telefono = RPAD(ultimo_paciente, 9, 0);
        SET ultimo_paciente = ultimo_paciente + 1;
        SET _documento = LPAD(CONCAT(ultimo_paciente, 'A'), 9, 0);
        INSERT INTO paciente values(_documento, _nombre, _apellido, _date, _sexo, _telefono);
        set contador = contador + 1;
    end while;
END 
//


--- Procedimiento para insertar medicos de forma aleatoriaDELIMITER //
DELIMITER //
create procedure insertar_medico(IN inserts int)
BEGIN
    DECLARE especialidad_medico int;
    DECLARE nombre_medico VARCHAR(55);
    DECLARE apellido_medico VARCHAR(55);
    DECLARE contador int;
    set contador = 0;
    set especialidad_medico = (SELECT id from especialidad ORDER BY RAND() LIMIT 1);
    SET nombre_medico = (SELECT nombre FROM nombres ORDER BY RAND() LIMIT 1);
    SET apellido_medico = (SELECT apellido FROM nombres ORDER BY RAND() LIMIT 1);
    while contador < inserts do
        INSERT INTO medico(especialidad, nombre, apellido) values (especialidad_medico, nombre_medico, apellido_medico);
        set contador = contador + 1;
    end while;
end
//
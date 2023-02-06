--Ver la estructura de la tabla
EXEC sp_columns PERSONAS;
EXEC sp_columns TB_ANEMIA;
--Cantidad de registros en cada tabla
SELECT COUNT(*) AS id_persona FROM TB_ANEMIA;
--Cantidad de registros no nulos de cada tabla
SELECT COUNT(id_persona) AS id_persona FROM TB_ANEMIA;
SELECT COUNT(edad) AS edad FROM TB_ANEMIA;
SELECT COUNT(tipo_edad) AS tipo_edad FROM TB_ANEMIA;
SELECT COUNT(sexo) AS sexo FROM TB_ANEMIA;
SELECT COUNT(id_ubigeo) AS id_ubigeo FROM TB_ANEMIA;
SELECT COUNT(fecha_atencion) AS fecha_atencion FROM TB_ANEMIA;
SELECT COUNT(diagnostico) AS diagnostico FROM TB_ANEMIA;
SELECT COUNT(id_eess) AS id_eess FROM TB_ANEMIA;
--Posibles valores en la columna tipo_edad
SELECT DISTINCT tipo_edad FROM TB_ANEMIA;
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_ANEMIA WHERE tipo_edad = 'A'; --41549 
--Seleccionar las personas con tipo_edad igual a M
SELECT COUNT(id_persona) FROM TB_ANEMIA WHERE tipo_edad = 'M'; --20425
--Seleccionar las personas con tipo_edad igual a D
SELECT COUNT(id_persona) FROM TB_ANEMIA WHERE tipo_edad = 'D'; --199
--Personas con un tipo_edad A cambiarlo a 0 el valor de su edad
UPDATE TB_ANEMIA SET edad = 0 WHERE tipo_edad = 'M';
UPDATE TB_ANEMIA SET edad = 0 WHERE tipo_edad = 'D';
--Personas con un tipo_edad D o M se modifica a tipo A
UPDATE TB_ANEMIA SET tipo_edad = 'A' WHERE tipo_edad = 'M';
UPDATE TB_ANEMIA SET tipo_edad = 'A' WHERE tipo_edad = 'D';
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_ANEMIA WHERE tipo_edad = 'A'; --62173
--Encontrar valores duplicados en la tabla de Anemia
WITH C AS (
	SELECT pk_anemia,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_anemia) AS DUPLICADO
      FROM TB_ANEMIA
)
SELECT * FROM C
WHERE DUPLICADO > 1
--Eliminamos valores duplicados en la tabla de Anemia
WITH C AS (
	SELECT pk_anemia,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_anemia) AS DUPLICADO
      FROM TB_ANEMIA
)
DELETE FROM C
WHERE DUPLICADO > 1
SELECT * FROM TB_ANEMIA
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--Cantidad de registros en cada tabla
SELECT COUNT(*) AS id_persona FROM TB_EII;
--Cantidad de registros no nulos de cada tabla
SELECT COUNT(id_persona) AS id_persona FROM TB_EII;
SELECT COUNT(edad) AS edad FROM TB_EII;
SELECT COUNT(tipo_edad) AS tipo_edad FROM TB_EII;
SELECT COUNT(sexo) AS sexo FROM TB_EII;
SELECT COUNT(id_ubigeo) AS id_ubigeo FROM TB_EII;
SELECT COUNT(fecha_atencion) AS fecha_atencion FROM TB_EII;
SELECT COUNT(diagnostico) AS diagnostico FROM TB_EII;
SELECT COUNT(id_eess) AS id_eess FROM TB_EII;
--Valores en la columna tipo_edad
SELECT DISTINCT tipo_edad FROM TB_EII;
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_EII WHERE tipo_edad = 'A'; --177125
--Seleccionar las personas con tipo_edad igual a M
SELECT COUNT(id_persona) FROM TB_EII WHERE tipo_edad = 'M'; --15670
--Seleccionar las personas con tipo_edad igual a D
SELECT COUNT(id_persona) FROM TB_EII WHERE tipo_edad = 'D'; --711
--Seleccionar las personas con tipo_edad igual a 1
SELECT COUNT(id_persona) FROM TB_EII WHERE tipo_edad = '1'; --1
--Describiendo de que trata el tipo de edad 1
SELECT * FROM TB_EII WHERE tipo_edad = '1';
SELECT * FROM PERSONAS WHERE id_persona = 1768316;
--Eliminando datos incogruentes debido a su fecha de fallecido 
DELETE FROM TB_EII WHERE id_persona = 1768316
--Personas con un tipo_edad A cambiarlo a 0 el valor de su edad
UPDATE TB_EII SET edad = 0 WHERE tipo_edad = 'M';
UPDATE TB_EII SET edad = 0 WHERE tipo_edad = 'D';
--Personas con un tipo_edad D o M se modifica a tipo A
UPDATE TB_EII SET tipo_edad = 'A' WHERE tipo_edad = 'M';
UPDATE TB_EII SET tipo_edad = 'A' WHERE tipo_edad = 'D';
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_EII WHERE tipo_edad = 'A'; --193505
--Encontrar valores duplicados en la tabla de Enfermedades Infecciosas Intestinales
WITH C AS (
	SELECT pk_eii,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_eii) AS DUPLICADO
      FROM TB_EII
)
SELECT * FROM C
WHERE DUPLICADO > 1
--Eliminamos valores duplicados en la tabla de Enfermedades Infecciosas Intestinales
WITH C AS (
	SELECT pk_eii,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_eii) AS DUPLICADO
      FROM TB_EII
)
DELETE FROM C
WHERE DUPLICADO > 1
SELECT * FROM TB_EII
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--Cantidad de registros en cada tabla
SELECT COUNT(*) AS id_persona FROM TB_IRA;
--Cantidad de registros no nulos de cada tabla
SELECT COUNT(id_persona) AS id_persona FROM TB_IRA;
SELECT COUNT(edad) AS edad FROM TB_IRA;
SELECT COUNT(tipo_edad) AS tipo_edad FROM TB_IRA;
SELECT COUNT(sexo) AS sexo FROM TB_IRA;
SELECT COUNT(id_ubigeo) AS id_ubigeo FROM TB_IRA;
SELECT COUNT(fecha_atencion) AS fecha_atencion FROM TB_IRA;
SELECT COUNT(diagnostico) AS diagnostico FROM TB_IRA;
SELECT COUNT(id_eess) AS id_eess FROM TB_IRA;
--Valores en la columna tipo_edad
SELECT DISTINCT tipo_edad FROM TB_IRA;
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_IRA WHERE tipo_edad = 'A'; --923394
--Seleccionar las personas con tipo_edad igual a M
SELECT COUNT(id_persona) FROM TB_IRA WHERE tipo_edad = 'M'; --77476
--Seleccionar las personas con tipo_edad igual a D
SELECT COUNT(id_persona) FROM TB_IRA WHERE tipo_edad = 'D'; --6656
--Seleccionar las personas con tipo_edad igual a 1
SELECT COUNT(id_persona) FROM TB_IRA WHERE tipo_edad = '1'; --3
--Describiendo de que trata el tipo de edad 1
SELECT * FROM TB_IRA WHERE tipo_edad = '1';
--Registros encontrados con datos incongruentes
SELECT * FROM TB_IRA WHERE id_persona = 13762989 OR id_persona = 38873477 OR id_persona = 1172887; 
--Eliminando datos incogruentes debido a su fecha de fallecido 
DELETE FROM TB_IRA WHERE  id_persona = 13762989 OR id_persona = 38873477 OR id_persona = 1172887;
--Personas con un tipo_edad A cambiarlo a 0 el valor de su edad
UPDATE TB_IRA SET edad = 0 WHERE tipo_edad = 'M';
UPDATE TB_IRA SET edad = 0 WHERE tipo_edad = 'D';
--Personas con un tipo_edad D o M se modifica a tipo A
UPDATE TB_IRA SET tipo_edad = 'A' WHERE tipo_edad = 'M';
UPDATE TB_IRA SET tipo_edad = 'A' WHERE tipo_edad = 'D';
--Seleccionar las personas con tipo_edad igual a A
SELECT COUNT(id_persona) FROM TB_IRA WHERE tipo_edad = 'A'; --1007526 
--Encontrar valores duplicados en la tabla de Infecciones Respiratorias Agudas
WITH C AS (
	SELECT pk_ira,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_ira) AS DUPLICADO
      FROM TB_IRA
)
SELECT * FROM C
WHERE DUPLICADO > 1
--Eliminamos valores duplicados en la tabla de Infecciones Respiratorias Agudas
WITH C AS (
	SELECT pk_ira,id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess,
	ROW_NUMBER() OVER (PARTITION BY
				 id_persona,edad,tipo_edad,sexo,id_ubigeo,fecha_atencion,diagnostico,tipo_dx,id_eess
				 ORDER BY pk_ira) AS DUPLICADO
      FROM TB_IRA
)
DELETE FROM C
WHERE DUPLICADO > 1

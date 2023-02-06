--CREACIÓN DE BASE DE DATOS 
CREATE DATABASE MORBILIDADES;

--USO DE LA BASE DE DATOS DE MORBILIDADES
USE MORBILIDADES;

--TABLA RELACIONADA A LAS PERSONA
CREATE TABLE PERSONAS(
	id_persona bigint PRIMARY KEY,
	anio_nac smallint,
	sexo char(1),
	id_ubigeo_domicilio smallint,
	fecha_fallecido date,
	padron_reniec tinyint
);

--TABLA RELACIONADA A LOS CÓDIGOS CIE-10
CREATE TABLE CIEX(
	id_ciex varchar(7) PRIMARY KEY,
	ciex varchar(max),
	desc_ciex varchar(max),
	categoria varchar(max),
	grupo varchar(max),
	capitulo varchar(max)
);
--TABLA RELACIONADA AL UBIGEO DE CADA REGIÓN DEL PERÚ
CREATE TABLE UBIGEO(
	id_ubigeo smallint PRIMARY KEY,
	ubigeo_reniec varchar(7),
	ubigeo_inei varchar(7),
	departamento_inei smallint,
	departamento varchar(max)
);

--TABLA RELACIONADA A LA INFECCIÓN RESPIRATORIA AGUDA
CREATE TABLE TB_IRA(
    pk_ira int IDENTITY(1,1) PRIMARY KEY,
	id_persona bigint,
	edad tinyint,
	tipo_edad char(1),
	sexo char(1),
	id_ubigeo smallint,
	fecha_atencion date,
	diagnostico varchar(7),
	tipo_dx char(1),
	id_eess smallint,
	FOREIGN KEY (id_persona) REFERENCES PERSONAS(id_persona)
);
--TABLA RELACIONADA A LA ANEMIA
CREATE TABLE TB_ANEMIA(
	pk_anemia int IDENTITY(1,1) PRIMARY KEY,
	id_persona bigint,
	edad tinyint,
	tipo_edad char(1),
	sexo char(1),
	id_ubigeo smallint,
	fecha_atencion date,
	diagnostico varchar(7),
	tipo_dx char(1),
	id_eess smallint
	FOREIGN KEY (id_persona) REFERENCES PERSONAS(id_persona)
);
--TABLA RELACIONADA A LAS ENFERMEDADES INFECCIOSAS INTESTINALES
CREATE TABLE TB_EII(
	pk_eii int IDENTITY(1,1) PRIMARY KEY,
	id_persona bigint,
	edad tinyint,
	tipo_edad char(1),
	sexo char(1),
	id_ubigeo smallint,
	fecha_atencion date,
	diagnostico varchar(7),
	tipo_dx char(1),
	id_eess smallint,
	FOREIGN KEY(id_persona) REFERENCES PERSONAS(id_persona)
);

--TABLA RELACIONADA A LOS ESTABLECIMIENTOS DE SALUD
CREATE TABLE EESS(
	id_eess smallint PRIMARY KEY,
	codigo_renaes int,
	categoria varchar(50),
	nombre varchar(MAX),
	diresa varchar(50),
	red varchar(50),
	direccion varchar(MAX),
	id_ubigeo smallint,
	FOREIGN KEY (id_ubigeo) REFERENCES UBIGEO (id_ubigeo)
);

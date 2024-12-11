CREATE DATABASE ACME_ZONE;
USE ACME_ZONE;

CREATE TABLE superUsuarios(
id_superUsuario INT PRIMARY KEY,
nombre VARCHAR(255));


CREATE TABLE estados(
id_estado INT PRIMARY KEY,
nombre VARCHAR(255));


CREATE TABLE tipos_usuarios(
id_tipo INT PRIMARY KEY,
nombre VARCHAR(100));


CREATE TABLE tipos_procesos(
id_tipo_proceso INT PRIMARY KEY,
nombre VARCHAR(255));


CREATE TABLE empresas(
id_empresa INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255));


CREATE TABLE supervisores(
id_supervisor INT PRIMARY KEY,
id_estado INT,
nombre VARCHAR(255),
Foreign Key (id_estado) REFERENCES estados(id_estado));


CREATE TABLE funcionarios(
id_funcionario INT PRIMARY KEY,
id_estado INT,
id_empresa INT,
nombre VARCHAR(255),
Foreign Key (id_estado) REFERENCES estados(id_estado),
Foreign Key (id_empresa) REFERENCES empresas(id_empresa));


CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY,
id_empresa INT,
id_estado INT,
id_tipo INT,
Foreign Key (id_empresa) REFERENCES empresas(id_empresa),
Foreign Key (id_estado) REFERENCES estados(id_estado),
Foreign Key (id_tipo) REFERENCES tipos_usuarios(id_tipo));


CREATE TABLE guardias(
id_guardia INT PRIMARY KEY,
id_estado INT,
nombre VARCHAR(255),
Foreign Key (id_estado) REFERENCES estados(id_estado));


CREATE TABLE anotaciones(
id_anotacion INT AUTO_INCREMENT PRIMARY KEY,
descripcion TEXT
);
CREATE TABLE log_anotaciones_usuarios(
id_log_agregar_anotacion INT AUTO_INCREMENT PRIMARY KEY,
id_anotacion INT,
id_usuario INT,
descripcion TEXT,
Foreign Key (id_anotacion) REFERENCES anotaciones(id_anotacion),
Foreign Key (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE log_agregar_supervisores(
id_log_agregar_supervisor INT AUTO_INCREMENT PRIMARY KEY,
id_supervisor INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_supervisor) REFERENCES supervisores(id_supervisor));


CREATE TABLE log_agregar_guardias(
id_log_agregar_guardia INT AUTO_INCREMENT PRIMARY KEY,
id_supervisor INT ,
id_guardia INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_supervisor) REFERENCES supervisores(id_supervisor),
Foreign Key (id_guardia) REFERENCES guardias(id_guardia));


CREATE TABLE log_agregar_funcionarios(
id_log_agregar_funcionario INT AUTO_INCREMENT PRIMARY KEY,
id_supervisor INT,
id_funcionario INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_supervisor) REFERENCES supervisores(id_supervisor),
Foreign Key (id_funcionario) REFERENCES funcionarios(id_funcionario));


CREATE TABLE log_agregar_usuarios(
id_log_agregar_user INT AUTO_INCREMENT PRIMARY KEY,
id_funcionario INT,
id_usuario INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_funcionario) REFERENCES funcionarios(id_funcionario),
Foreign Key (id_usuario) REFERENCES usuarios(id_usuario));


CREATE TABLE log_agregar_empresas(
id_log_agregar_empresa INT AUTO_INCREMENT PRIMARY KEY,
id_supervisor INT,
id_empresa INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_supervisor) REFERENCES supervisores(id_supervisor),
Foreign Key (id_empresa) REFERENCES empresas(id_empresa)
)


CREATE TABLE log_procesos(
id_log_proceso INT AUTO_INCREMENT PRIMARY KEY,
id_tipo_proceso INT,
id_usuario INT,
id_guardia INT,
fecha DATE,
descripcion TEXT,
Foreign Key (id_tipo_proceso) REFERENCES tipos_procesos(id_tipo_proceso),
Foreign Key (id_usuario) REFERENCES usuarios(id_usuario),
Foreign Key (id_guardia) REFERENCES guardias(id_guardia));


-- FUNCIONARIOS -> EMPRESAS
CREATE TABLE funcionarios_empresas(
id_funcionario INT,
id_empresa INT,
Foreign Key (id_funcionario) REFERENCES funcionarios(id_funcionario),
Foreign Key (id_empresa) REFERENCES empresas(id_empresa));
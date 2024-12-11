USE ACME_ZONE;

CREATE TRIGGER agg_supervisor
AFTER INSERT ON supervisores
FOR EACH ROW
BEGIN
    INSERT INTO log_agregar_supervisores(id_supervisor,fecha,descripcion)VALUES
    (NEW.id_supervisor,NOW(),CONCAT("Se agregó un nuevo supervisor con identificador: ",NEW.id_supervisor));
END;


CREATE TRIGGER agg_guardia
AFTER INSERT ON guardias
FOR EACH ROW
BEGIN
    INSERT INTO log_agregar_guardias(id_guardia,fecha,descripcion)VALUES
    (NEW.id_guardia,NOW(),CONCAT("Se agregó un nuevo guardia con identificador: ",NEW.id_guardia));
END;


CREATE TRIGGER agg_funcionario
AFTER INSERT ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO log_agregar_funcionarios(id_funcionario,fecha,descripcion)VALUES
    (NEW.id_funcionario,NOW(),CONCAT("Se agregó un nuevo funcionario con identificador: ",NEW.id_funcionario));
END;


CREATE TRIGGER agg_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO log_agregar_usuarios(id_usuario,fecha,descripcion)VALUES
    (NEW.id_usuario,NOW(),CONCAT("Se agregó un nuevo usuario con identificador: ",NEW.id_usuario));
END;


CREATE TRIGGER agg_empresa
AFTER INSERT ON empresas
FOR EACH ROW
BEGIN
    INSERT INTO log_agregar_empresas(id_supervisor,id_empresa,fecha,descripcion)VALUES
    (id_supervisor,NEW.id_empresa,NOW(),CONCAT("Se agregó una nueva empresa con identificador: ",NEW.id_empresa));
END;


USE ACME_ZONE;


INSERT INTO superUsuarios(id_superUsuario,nombre)VALUES
(140512,"Arley");


INSERT INTO estados(id_estado,nombre)VALUES
(1,"Activo"),
(2,"Inactivo"),
(3,"Restringido");


INSERT INTO tipos_usuarios(id_tipo,nombre)VALUES
(1,"Operario"),
(2,"Invitado");


INSERT INTO tipos_procesos(id_tipo_proceso,nombre)VALUES
(1,"Entrada"),
(2,"Salida");





INSERT INTO supervisores(id_supervisor,id_estado,nombre)VALUES
(1234,1,"Mario");

INSERT INTO guardias(id_guardia,id_estado,nombre)VALUES
(2456,1,"Nico");

INSERT INTO empresas(id_empresa,nombre)VALUES
(1,"Campus");

INSERT INTO funcionarios(id_funcionario,id_estado,id_empresa,nombre)VALUES
(5676,1,1,"Haider")

INSERT INTO usuarios(id_usuario,id_empresa,id_estado, id_tipo)VALUES
(1096539632,1,1,1);
-- =============================================================================
-- Diagram Name: Noname1
-- Created on: 2/06/2018 7:37:50 p. m.
-- Diagram Version: 
-- =============================================================================




CREATE TABLE "usuario" (
	"id_usuario" SERIAL NOT NULL,
	"nombre_usuario" varchar(45) NOT NULL,
	"clave" varchar(45) NOT NULL,
	"correo" varchar(255) NOT NULL,
	"celular" varchar(45) NOT NULL,
	PRIMARY KEY("id_usuario")
);

CREATE TABLE "pan" (
	"id_pan" SERIAL NOT NULL,
	"nombre_pan" varchar(45) NOT NULL,
	"precio_pan" varchar(45) NOT NULL,
	"foto_pan" varchar(255) NOT NULL,
	"des_pan" varchar(255) NOT NULL,
	"categoria_id_categoria" int4 NOT NULL,
	PRIMARY KEY("id_pan")
);

CREATE TABLE "admin" (
	"id_admin" SERIAL NOT NULL,
	"nombre_admin" varchar(45) NOT NULL,
	"correo_admin" varchar(255) NOT NULL,
	"clave_admin" varchar(45) NOT NULL,
	"cedula_admim" varchar(45) NOT NULL,
	PRIMARY KEY("id_admin")
);

CREATE TABLE "categoria" (
	"id_categoria" SERIAL NOT NULL,
	"nombre_categoria" varchar(45) NOT NULL,
	"foto_categoria" varchar(255) NOT NULL,
	"des_categoria" varchar(255) NOT NULL,
	PRIMARY KEY("id_categoria")
);

CREATE TABLE "admin_pan" (
	"id_admin_pan" SERIAL NOT NULL,
	"admin_id_admin" int4 NOT NULL,
	"pan_id_pan" int4 NOT NULL,
	PRIMARY KEY("id_admin_pan")
);

CREATE TABLE "admin_categoria" (
	"id_admin_pan" SERIAL NOT NULL,
	"admin_id_admin" int4 NOT NULL,
	"categoria_id_categoria" int4 NOT NULL
);

CREATE TABLE "domicilios" (
	"id_domicilios" varchar(45) NOT NULL,
	"dirrecion_domicilio" varchar(45) NOT NULL,
	"cantidad_producto" varchar(45) NOT NULL,
	"pan_id_pan" int4 NOT NULL,
	"usuario_id_usuario" int4 NOT NULL,
	PRIMARY KEY("id_domicilios")
);


ALTER TABLE "pan" ADD CONSTRAINT "Ref_pan_to_categoria" FOREIGN KEY ("categoria_id_categoria")
	REFERENCES "categoria"("id_categoria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "admin_pan" ADD CONSTRAINT "Ref_admin_pan_to_pan" FOREIGN KEY ("pan_id_pan")
	REFERENCES "pan"("id_pan")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "admin_pan" ADD CONSTRAINT "Ref_admin_pan_to_admin" FOREIGN KEY ("admin_id_admin")
	REFERENCES "admin"("id_admin")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "admin_categoria" ADD CONSTRAINT "Ref_admin_categoria_to_admin" FOREIGN KEY ("admin_id_admin")
	REFERENCES "admin"("id_admin")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "admin_categoria" ADD CONSTRAINT "Ref_admin_categoria_to_categoria" FOREIGN KEY ("categoria_id_categoria")
	REFERENCES "categoria"("id_categoria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "domicilios" ADD CONSTRAINT "Ref_domicilios_to_usuario" FOREIGN KEY ("usuario_id_usuario")
	REFERENCES "usuario"("id_usuario")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "domicilios" ADD CONSTRAINT "Ref_domicilios_to_pan" FOREIGN KEY ("pan_id_pan")
	REFERENCES "pan"("id_pan")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;



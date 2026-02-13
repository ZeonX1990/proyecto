create database proyecto;

\c proyecto

CREATE TABLE Alumno(
    DNI_Alumne varchar (15) CONSTRAINT Alumno_DNI_Alumne_pk PRIMARY KEY,
    Nombre text CONSTRAINT Alumno_Nombre not null,
    Apellido text (30) CONSTRAINT Alumno_Apellido not null,
    Estado_Alumne varchar (10) CONSTRAINT Alumno_Estado not null CHECK (Estado ='actiu' OR Estado ='baixa'),
    Estado_Asignado boolean (10) CONSTRAINT Alumno_Estado not null,
    NASS varchar (20),
    Ciclo varchar (30) CONSTRAINT Alumno_Ciclo not null,
    Curso varchar (30) CONSTRAINT Alumno_Curso not null,
    Telefono int CONSTRAINT Alumno_Telefono not null,
    Fecha_Inicio date,
    Fecha_Finalizacion date,
    Estado_Practica varchar (30) CONSTRAINT Alumno_Estado_Practica CHECK (Estado_Practica ='proposada' OR Estado_Practica ='confirmada' OR Estado_Practica ='finalitzada' OR Estado_Practica ='cancelada'),
    Tutor_Empresa text
);

CREATE TABLE Tecnologia(
    ID_Tecno varchar (50) CONSTRAINT Tecnologia_ID_Tecno_pk PRIMARY KEY,
    nom text CONSTRAINT Tecnologia_nom not null
);

CREATE TABLE Evaluacion_interna (
    ID_Evaluacion int CONSTRAINT Evaluacion_interna_ID_Evaluacion_pk PRIMARY KEY,
    DNI_Alumne_Evaluacion_interna varchar (15),
    Observaciones text,
    RA2_IPO varchar CONSTRAINT Evaluacion_interna_RA2_IPO not null CHECK (RA2_IPO ='aprovat' OR RA2_IPO ='suspes'),
    Modules_troncales int,
    Puntuacion int,
    Trabajo_Equipo int,
    Comunicacion int,
    Puntualidad int,
    Actitud int,
    Nivel_Tecnico int,
    Autonomia int 
    CONSTRAINT Evaluacion_interna_DNI_Alumne_pk FOREIGN KEY (DNI_Alumne_Evaluacion_interna) REFERENCES Alumno(DNI_Alumne)
);

CREATE TABLE Curriculum (
    ID_Curriculum int CONSTRAINT Curriculum_ID_Curriculum_pk PRIMARY KEY,
    DNI_Alumne_Curriculum varchar (15),
    Enlace varchar (50) CONSTRAINT Curriculum_Enlace not null,
    Resumen varchar (50),
    Estado varchar (50) CONSTRAINT Curriculum_Estado NOT NULL CHECK (Estado ='actiu' OR Estado ='obsolet'),
    Version varchar (50),
    Fecha_Creacion date,
    Fecha_Actualizacion date,
    CONSTRAINT Curriculum_DNI_Alumne_pk FOREIGN KEY (DNI_Alumne_Curriculum) REFERENCES Alumno(DNI_Alumne)
);

CREATE TABLE Empresa (
    CIF_NIF_Empresa varchar (30) CONSTRAINT Empresa_CIF_NIF_Empresa_pk PRIMARY KEY,
    DUAL varchar (10) CONSTRAINT Empresa_DUAL not null CHECK (DUAL ='intensiva' OR DUAL ='general' OR DUAL ='ambdues'),
    Ubicacion varchar (30) CONSTRAINT Empresa_Ubicacion not null,
    Telefono int CONSTRAINT Empresa_Telefono not null,
    Sector varchar (30) CONSTRAINT Empresa_Sector not null,
    Nombre text CONSTRAINT Empresa_Nombre not null
);

CREATE TABLE Recibir (
    ID_Curriculum_Recibir int,
    CIF_NIF_Empresa_Recibir varchar (30),
    Historial_Contacto varchar (999),
    Data_Entrevista date,
    Data_Respuesta date,
    Notas decimal (3,2),
    Estado_Recibir varchar (30) CONSTRAINT Recibir_Estado NOT NULL CHECK (Estado ='vist' OR Estado ='enviat' OR Estado ='entrevista' OR Estado ='rebutjat' OR Estado ='acceptat'),
    Data_Enviamiento date,
    CONSTRAINT Recibir_pk PRIMARY KEY(ID_Curriculum_Recibir,CIF_NIF_Empresa_Recibir),
    CONSTRAINT Recibir_ID_Curriculum_Recibir_fk FOREIGN KEY (ID_Curriculum_Recibir) REFERENCES Curriculum(ID_Curriculum),
    CONSTRAINT Recibir_CIF_NIF_Empresa_Recibir_fk FOREIGN KEY (CIF_NIF_Empresa_Recibir) REFERENCES Empresa(CIF_NIF_Empresa)
);

CREATE TABLE Buscar (
    ID_Tecno_Buscar varchar (50),
    CIF_NIF_Empresa_Buscar varchar (30),
    CONSTRAINT Buscar_pk PRIMARY KEY(ID_Tecno_Buscar,CIF_NIF_Empresa_Buscar),
    CONSTRAINT Buscar_ID_Tecno_Buscar_fk FOREIGN KEY (ID_Tecno_Buscar) REFERENCES Tecnologia(ID_Tecno),
    CONSTRAINT Buscar_CIF_NIF_Empresa_Buscar_fk FOREIGN KEY (CIF_NIF_Empresa_Buscar) REFERENCES Empresa(CIF_NIF_Empresa)
);

CREATE TABLE Dominar (
    ID_Tecno_Dominar varchar (50),
    DNI_Alumne_Dominar varchar (30),
    CONSTRAINT Dominar_pk PRIMARY KEY(ID_Tecno_Dominar,DNI_Alumne_Dominar),
    CONSTRAINT Dominar_ID_Tecno_Dominar_fk FOREIGN KEY (ID_Tecno_Dominar) REFERENCES Tecnologia(ID_Tecno),
    CONSTRAINT Dominar_DNI_Alumne_Dominar_fk FOREIGN KEY (DNI_Alumne_Dominar) REFERENCES Alumno(DNI_Alumne)
);
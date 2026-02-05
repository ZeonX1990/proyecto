create database proyecto;

\c proyecto

CREATE TABLE Alumno(
    DNI_Alumne varchar (15) CONSTRAINT Alumno_DNI_Alumne_pk PRIMARY KEY,
    Nombre text CONSTRAINT Alumno_Nombre not null,
    Apellido text (30) CONSTRAINT Alumno_Apellido not null,
    Estado boolean CONSTRAINT Alumno_Estado not null,
    NASS varchar (20) CONSTRAINT Alumno_NASS not null,
    Ciclo varchar (30) CONSTRAINT Alumno_Ciclo not null,
    Curso varchar (30) CONSTRAINT Alumno_Curso not null,
    Telefono int CONSTRAINT Alumno_Telefono not null,
    Fecha_Inicio date CONSTRAINT Alumno_Fecha_Inicio not null,
    Fecha_Finalizacion date CONSTRAINT Alumno_Fecha_Finalizacion not null,
    Estado_Practica varchar (30) CONSTRAINT Alumno_Estado_Practica not null,
    Tutor_Empresa text CONSTRAINT Alumno_Tutor_Empresa not null
);

CREATE TABLE Tecnologia(
    ID_Tecno varchar (50) CONSTRAINT Tecnologia_ID_Tecno_pk PRIMARY KEY,
    nom text CONSTRAINT Tecnologia_nom not null
);

CREATE TABLE Evaluacion_interna (
    ID_Evaluacion int CONSTRAINT Evaluacion_interna_ID_Evaluacion_pk PRIMARY KEY,
    Observaciones text,
    RA2_IPO boolean CONSTRAINT Evaluacion_interna_RA2_IPO not null,
    Modules_troncales int CONSTRAINT Evaluacion_interna_Modules_troncales not null,
    Puntuacion int CONSTRAINT Evaluacion_interna_Puntuacion not null,
    Trabajo_Equipo int CONSTRAINT Evaluacion_interna_Trabajo_Equipo not null,
    Comunicacion int CONSTRAINT Evaluacion_interna_Comunicacion not null,
    Puntualidad int CONSTRAINT Evaluacion_interna_Puntualidad not null,
    Actitud int CONSTRAINT Evaluacion_interna_Actitud not null,
    Nivel_Tecnico int CONSTRAINT Evaluacion_interna_Nivel_Tecnico not null,
    Autonomia int CONSTRAINT Evaluacion_interna_Autonomia not null
);

CREATE TABLE Curriculum (
    ID_Curriculum int CONSTRAINT Curriculum_ID_Curriculum_pk PRIMARY KEY,
    Enlace varchar (50) CONSTRAINT Curriculum_Enlace not null,
    Resumen varchar (50),
    Estado varchar (50) CONSTRAINT Curriculum_Estado not null,
    Version varchar (50) CONSTRAINT Curriculum_Version not null,
    Fecha_Creacion date CONSTRAINT Curriculum_Fecha_Creacion not null,
    Fecha_Actualizacion date CONSTRAINT Curriculum_Fecha_Actualizacion not null

);

CREATE TABLE Empresa (
    CIF_NIF_Empresa varchar (30) CONSTRAINT Empresa_CIF_NIF_Empresa_pk PRIMARY KEY,
    DUAL boolean CONSTRAINT Empresa_DUAL not null,
    Ubicacion varchar (30) CONSTRAINT Empresa_Ubicacion not null,
    Telefono int CONSTRAINT Empresa_Telefono not null,
    Sector varchar (30) CONSTRAINT Empresa_Sector not null,
    Nombre text CONSTRAINT Empresa_Nombre not null
);

CREATE TABLE Recibir (
    ID_Curriculum_Recibir int,
    CIF_NIF_Empresa_Recibir varchar,
    Historial_Contacto varchar (999),
    Data_Entrevista date CONSTRAINT Recibir_Data_Entrevista not null,
    Data_Respuesta date CONSTRAINT Recibir_Data_Respuesta not null,
    Notas decimal (2,2) CONSTRAINT Recibir_Notas not null,
    Estado varchar (30) CONSTRAINT Recibir_Estado not null,
    Data_Enviamiento date CONSTRAINT Recibir_Data_Enviamiento not null,
    CONSTRAINT Recibir_pk PRIMARY KEY(ID_Curriculum_Recibir,CIF_NIF_Empresa_Recibir),
    CONSTRAINT Recibir_ID_Curriculum_Recibir_fk FOREIGN KEY (ID_Curriculum_Recibir) REFERENCES Curriculum(ID_Curriculum),
    CONSTRAINT Recibir_CIF_NIF_Empresa_Recibir_fk FOREIGN KEY (CIF_NIF_Empresa_Recibir) REFERENCES Empresa(CIF_NIF_Empresa)
);

CREATE TABLE Buscar (
    ID_Tecno_Buscar int,
    CIF_NIF_Empresa_Buscar varchar (30),
    CONSTRAINT Buscar_pk PRIMARY KEY(ID_Tecno_Buscar,CIF_NIF_Empresa_Buscar),
    CONSTRAINT Buscar_ID_Tecno_Buscar_fk FOREIGN KEY (ID_Tecno_Buscar) REFERENCES Tecnologia(ID_Tecno),
    CONSTRAINT Buscar_CIF_NIF_Empresa_Buscar_fk FOREIGN KEY (CIF_NIF_Empresa_Buscar) REFERENCES Empresa(CIF_NIF_Empresa)
);

CREATE TABLE Dominar (
    ID_Tecno_Dominar int,
    CIF_NIF_Empresa_Dominar varchar (30),
    CONSTRAINT Dominar_pk PRIMARY KEY(ID_Tecno_Dominar,CIF_NIF_Empresa_Dominar),
    CONSTRAINT Dominar_ID_Tecno_Dominar_fk FOREIGN KEY (ID_Tecno_Dominar) REFERENCES Tecnologia(ID_Tecno),
    CONSTRAINT Dominar_CIF_NIF_Empresa_Dominar_fk FOREIGN KEY (CIF_NIF_Empresa_Dominar) REFERENCES Empresa(CIF_NIF_Empresa)
);
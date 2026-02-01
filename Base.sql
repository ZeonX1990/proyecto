create database proyecto;

\c proyecto

CREATE TABLE Alumno(
    DNI_Alumne varchar (15) PRIMARY KEY,
    Nombre text not null,
    Apellido text (30) not null,
    Estado boolean not null,
    NASS varchar (20) not null,
    Ciclo varchar (30) not null,
    Curso varchar (30) not null,
    Telefono int not null,
    Fecha_Inicio date not null,
    Fecha_Finalizacion date not null,
    Estado_Practica varchar (30) not null,
    Tutor_Empresa text not null
);

CREATE TABLE Tecnologia(
    ID_Tecno varchar (50) PRIMARY KEY,
    nom text not null
);

CREATE TABLE Evaluacion_interna (
    ID_Evaluacion int PRIMARY KEY,
    Observaciones text ,
    RA2_IPO boolean not null,
    Modules_troncales int not null,
    Puntuacion int not null,
    Trabajo_Equipo int not null,
    Comunicacion int not null,
    Puntualidad int not null,
    Actitud int not null,
    Nivel_Tecnico int not null,
    Autonomia int not null
);

CREATE TABLE Curriculum (
    ID_Curriculum int PRIMARY KEY,
    Enlace varchar (50) not null,
    Resumen varchar (50),
    Estado varchar (50) not null,
    Version varchar (50) not null,
    Fecha_Creacion date not null,
    Fecha_Actualizacion date not null

);

CREATE TABLE Empresa (
    CIF_NIF_Empresa varchar (30) PRIMARY KEY,
    DUAL boolean not null,
    Ubicacion varchar (30) not null,
    Telefono int not null,
    Sector varchar (30) not null,
    Nombre text not null
);

CREATE TABLE Recibir (
    ID_Curriculum int ,
    CIF_NIF_Empresa varchar ,
    Historial_Contacto varchar (999),
    Data_Entrevista date not null,
    Data_Respuesta date not null,
    Notas decimal (2,2) not null,
    Estado varchar (30) not null,
    Data_Enviamiento date not null ,
    PRIMARY KEY(ID_Curriculum,CIF_NIF_Empresa),
);

CREATE TABLE Buscar (
    ID_Tecno int ,
    CIF_NIF_Empresa varchar (30) ,
    PRIMARY KEY(ID_Tecno,CIF_NIF_Empresa),
);

CREATE TABLE Dominar (
    ID_Tecno int ,
    CIF_NIF_Empresa varchar (30),
    PRIMARY KEY(ID_Tecno,ID_ALUMNO),
);
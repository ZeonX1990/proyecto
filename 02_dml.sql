DELETE FROM Alumno;
DELETE FROM Empresa;
DELETE FROM Curriculum;
DELETE FROM Recibir;
DELETE FROM Buscar;
DELETE FROM Dominar;
DELETE FROM Evaluacion_interna;
DELETE FROM Tecnologia;


INSERT INTO Alumno VALUES (34892751C, 'Juan', 'Perez', true,         '123456789', 'Informática', '1º ASIX', 123456789);
INSERT INTO Alumno VALUES (34812322W, 'Maria', 'Gomez', true, '987654321', 'Informática', '1º DAW', 987654321, '2023-09-02', '2024-05-22', 'En proceso', 'Jose');
INSERT INTO Alumno VALUES (34295423W, 'Luis', 'Lopez', true, '456789123', 'Informática', '1º ASIX', 456789123);
INSERT INTO Alumno VALUES (34812324J, 'Ana', 'Martinez', true, '789123456', 'Informática', '1º DAW', 789123456, '2023-09-05', '2024-07-21', 'En proceso', 'Carlos');
INSERT INTO Alumno VALUES (34870225M, 'Carlos', 'Garcia', true  , '321654987', 'Informática', '1º ASIX', 321654987, '2023-09-01', '2024-06-30', 'En proceso', 'Lucia');
INSERT INTO Alumno VALUES (34812326W, 'Lucia', 'Sanchez', true, '654987321', 'Informática', '1º DAW', 654987321, '2023-12-07', '2024-09-27', 'Finalizado', 'Miguel');
INSERT INTO Alumno VALUES (34812327S, 'Miguel', 'Diaz', true, '789456123', 'Informática', '1º DAM', 789456123);
INSERT INTO Alumno VALUES (34738328W, 'Sofia', 'Fernandez', true, '321789654', 'Informática', '1º DAW', 321789654, '2023-07-14', '2024-11-22', 'En proceso', 'David');
INSERT INTO Alumno VALUES (34812329W, 'David', 'Gonzalez', true, '654321789', 'Informática', '1º DAW', 654321789, '2023-09-10', '2024-07-26', 'En proceso', 'Laura');
INSERT INTO Alumno VALUES (34812330W, 'Laura', 'Rodriguez', true, '987321654', 'Informática', '1º DAM', 987321654, '2023-06-07', '2024-06-30', 'En proceso', 'Javier');
INSERT INTO Alumno VALUES (34812331W, 'Javier', 'Sanchez', true, '123789456', 'Informática', '1º DAW', 123789456);
INSERT INTO Alumno VALUES (34812332W, 'Sara', 'Lopez', true, '789321654', 'Informática', '1º DAW', 789321654, '2023-11-11', '2024-09-25', 'En proceso', 'Alberto');
INSERT INTO Alumno VALUES (34812333W, 'Alberto', 'Martinez', true, '321456789', 'Informática', '1º ASIX', 321456789, '2023-09-01', '2024-01-12', 'En proceso', 'Marta');
INSERT INTO Alumno VALUES (34812334E, 'Marta', 'Garcia', true, '654123789', 'Informática', '1º ASIX', 654123789, '2023-09-10', '2024-02-28', 'En proceso', 'Pablo');
INSERT INTO Alumno VALUES (34812335W, 'Pablo', 'Sanchez', true, '987654321', 'Informática', '1º DAW', 987654321);
INSERT INTO Alumno VALUES (34813212Z, 'Sofia', 'Diaz', true, '123456789', 'Informática', '1º DAM', 123456789, '2023-10-23', '2024-10-24', 'En proceso', 'Miguel');
INSERT INTO Alumno VALUES (34812337W, 'Miguel', 'Fernandez', true, '456789123', 'Informática', '1º DAW', 456789123, '2023-09-02', '2024-03-23', 'En proceso', 'Carlos');
INSERT INTO Alumno VALUES (34812338W, 'Carlos', 'Gonzalez', true, '789123456', 'Informática', '1º DAW', 789123456, '2023-09-07', '2024-05-14', 'En proceso', 'Ana');
INSERT INTO Alumno VALUES (34802859H, 'Ana', 'Rodriguez', true, '321654987', 'Informática', '1º DAM', 321654987);
INSERT INTO Alumno VALUES (34817840T, 'Lucia', 'Sanchez', true, '654987321', 'Informática', '1º DAW', 654987321);

INSERT INTO Empresa VALUES ('A12345678', false, 'Barcelona', 123456789, 'Tecnología', 'TechCorp');
INSERT INTO Empresa VALUES ('B98765432', true, 'Barcelona', 987654321, 'Finanzas', 'FinanCorp');
INSERT INTO Empresa VALUES ('C45678912', false, 'Barcelona', 456789123, 'Salud', 'HealthCorp');
INSERT INTO Empresa VALUES ('D78912345', false, 'Barcelona', 789123456, 'Educación', 'EduCorp');
INSERT INTO Empresa VALUES ('E32165498', true, 'Barcelona', 321654987, 'Turismo', 'TourCorp');
INSERT INTO Empresa VALUES ('F65498732', false, 'Barcelona', 654987321, 'Construcción', 'BuildCorp');
INSERT INTO Empresa VALUES ('G78945612', false, 'Barcelona', 789456123, 'Transporte', 'TransCorp');
INSERT INTO Empresa VALUES ('H32178965', true, 'Barcelona', 321789654, 'Energía', 'EnergyCorp');
INSERT INTO Empresa VALUES ('I65432178', false, 'Barcelona', 654321789, 'Alimentación', 'FoodCorp');
INSERT INTO Empresa VALUES ('J98732165', false, 'Barcelona', 987321654, 'Moda', 'FashionCorp');

INSERT INTO Curriculum VALUES (1, 'https://example.com/curriculum1', 'Resumen del curriculum 1', 'Activo', '1.0', '2023-09-01', '2023-09-15');
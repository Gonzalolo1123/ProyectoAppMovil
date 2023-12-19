CREATE TABLE Campeonato (
    ID_Campeonato SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Fecha DATE NOT NULL,
    Lugar VARCHAR(255) NOT NULL
);

CREATE TABLE Categorias (
    ID_Categoria SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Rango_inicio INT NOT NULL,
    Rango_fin INT NOT NULL
);

CREATE TABLE Jurado (
    ID_Jurado SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Prueba (
    ID_Prueba SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    ID_Jurado INT REFERENCES Jurado(ID_Jurado) ON DELETE CASCADE
);

CREATE TABLE Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Valor DECIMAL NOT NULL,
    NumIntento INT NOT NULL
);

CREATE TABLE Participante (
    ID_Participante SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    "Colegio/Institucion" VARCHAR(255) NOT NULL,
    FechaNac DATE NOT NULL,
    ID_Marca INT REFERENCES Marca(ID_Marca) ON DELETE CASCADE
);

CREATE TABLE ParticipaPrueba (
    ID_Prueba INT REFERENCES Prueba(ID_Prueba) ON DELETE CASCADE,
    ID_Participante INT REFERENCES Participante(ID_Participante) ON DELETE CASCADE,
    PRIMARY KEY (ID_Prueba, ID_Participante)
);

CREATE TABLE Horario (
    ID_Horario SERIAL PRIMARY KEY,
    ID_Prueba INT REFERENCES Prueba(ID_Prueba) ON DELETE CASCADE,
    ID_Campeonato INT REFERENCES Campeonato(ID_Campeonato) ON DELETE CASCADE
);

CREATE TABLE CategoriasCampeonato (
    ID_Campeonato INT REFERENCES Campeonato(ID_Campeonato) ON DELETE CASCADE,
    ID_Categoria INT REFERENCES Categorias(ID_Categoria) ON DELETE CASCADE,
    PRIMARY KEY (ID_Campeonato, ID_Categoria)
);

CREATE TABLE CategoriaPrueba (
    ID_Prueba INT REFERENCES Prueba(ID_Prueba) ON DELETE CASCADE,
    ID_Categoria INT REFERENCES Categorias(ID_Categoria) ON DELETE CASCADE,
    PRIMARY KEY (ID_Prueba, ID_Categoria)
);

CREATE TABLE PruebaCampeonato (
    ID_Prueba INT REFERENCES Prueba(ID_Prueba) ON DELETE CASCADE,
    ID_Campeonato INT REFERENCES Campeonato(ID_Campeonato) ON DELETE CASCADE,
    PRIMARY KEY (ID_Prueba, ID_Campeonato)
);

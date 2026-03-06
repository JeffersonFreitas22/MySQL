CREATE DATABASE Universidade;
GO

USE Universidade;
GO

CREATE TABLE tbCampus (
    idCampus INT PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50)
);

CREATE TABLE tbCurso (
    idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    idCampus INT FOREIGN KEY (idCampus) REFERENCES tbCampus(idCampus)
);

CREATE TABLE tbTurma (
    idTurma INT PRIMARY KEY,
    anoFormacao INT,
    numeroSala INT,
    idCurso INT FOREIGN KEY (idCurso) REFERENCES tbCurso(idCurso)
);

CREATE TABLE tbAluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(14),
    dataNasc DATE,
    idCurso INT FOREIGN KEY (idCurso) REFERENCES tbCurso(idCurso),
    idTurma INT FOREIGN KEY (idTurma) REFERENCES tbTurma(idTurma)
);

CREATE TABLE tbDisciplina (
    idDisciplina INT PRIMARY KEY,
    nome VARCHAR(50),
    cargaHoraria INT
);

CREATE TABLE tbCursoDisciplina (
    idCursoDisciplina INT PRIMARY KEY,
    idCurso INT FOREIGN KEY (idCurso) REFERENCES tbCurso(idCurso),
    idDisciplina INT FOREIGN KEY (idDisciplina) REFERENCES tbDisciplina(idDisciplina),
    semestre INT
);

CREATE TABLE tbProfessor (
    idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(14),
    email VARCHAR(30),
    titulacao VARCHAR(100)
);

CREATE TABLE tbProfessorDisciplina (
    idProfessorDisciplina INT PRIMARY KEY,
    idDisciplina INT,
    idProfessor INT,
    FOREIGN KEY (idDisciplina) REFERENCES tbDisciplina(idDisciplina),
    FOREIGN KEY (idProfessor) REFERENCES tbProfessor(idProfessor)
);

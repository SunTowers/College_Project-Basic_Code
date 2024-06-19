-- Tabela Usuário
CREATE TABLE Usuario (
    Matricula INT PRIMARY KEY,
    Nome CHAR(50),
    Endereco CHAR(50),
    Email CHAR(50)
);

-- Tabela Autor
CREATE TABLE Autor (
    Codigo INT PRIMARY KEY,
    Nome CHAR(50),
    Nacionalidade CHAR(50)
);

-- Tabela Assunto
CREATE TABLE Assunto (
    Codigo INT PRIMARY KEY,
    Nome CHAR(50)
);

-- Tabela Livros
CREATE TABLE Livros (
    Codigo INT PRIMARY KEY,
    Titulo CHAR(50),
    Edicao CHAR(50)
);

-- Relacionamento Reservou
CREATE TABLE Reservou (
    Usuario_Matricula INT,
    Livros_Codigo INT,
    Data_reserva DATE,
    FOREIGN KEY (Usuario_Matricula) REFERENCES Usuario(Matricula),
    FOREIGN KEY (Livros_Codigo) REFERENCES Livros(Codigo)
);

-- Relacionamento Pegou
CREATE TABLE Pegou (
    Usuario_Matricula INT,
    Livros_Codigo INT,
    Data_emprestimo DATE,
    Data_devolucao DATE,
    FOREIGN KEY (Usuario_Matricula) REFERENCES Usuario(Matricula),
    FOREIGN KEY (Livros_Codigo) REFERENCES Livros(Codigo)
);

-- Relacionamento Escreveu
CREATE TABLE Escreveu (
    Autor_Codigo INT,
    Livros_Codigo INT,
    FOREIGN KEY (Autor_Codigo) REFERENCES Autor(Codigo),
    FOREIGN KEY (Livros_Codigo) REFERENCES Livros(Codigo)
);

-- Relacionamento Classificado
CREATE TABLE Classificado (
    Assunto_Codigo INT,
    Livros_Codigo INT,
    FOREIGN KEY (Assunto_Codigo) REFERENCES Assunto(Codigo),
    FOREIGN KEY (Livros_Codigo) REFERENCES Livros(Codigo)
);

-- insert
INSERT INTO Usuario (Matricula, Nome, Endereco, Email)
VALUES
    (1, 'João Fictício', 'Rua das Ilusões, 123', 'joao@example.com'),
    (2, 'Maria Imaginária', 'Avenida dos Sonhos, 456', 'maria@example.com'),
    (3, 'Pedro Irreal', 'Praça da Fantasia, 789', 'pedro@example.com'),
    (4, 'Ana Ilusória', 'Alameda dos Devaneios, 101', 'ana@example.com'),
    (5, 'Lucas Imagético', 'Travessa dos Sonhos, 222', 'lucas@example.com');

INSERT INTO Autor (Codigo, Nome, Nacionalidade)
VALUES
    (101, 'Carlos Inventado', 'Ficçãolandia'),
    (102, 'Laura Fantástica', 'Imaginária'),
    (103, 'Rafael Imaginador', 'Sonholândia'),
    (104, 'Sofia Irreal', 'Ilusiolândia'),
    (105, 'Diego Sonhador', 'Mundodasnuvens');

INSERT INTO Livros (Codigo, Titulo, Edicao)
VALUES
    (301, 'O Segredo do Mapa Perdido', '1ª edição'),
    (302, 'Enigma nas Estrelas', '2ª edição'),
    (303, 'Amor Além do Tempo', '3ª edição'),
    (304, 'Cidade dos Sonhos', '1ª edição'),
    (305, 'Viagem Interdimensional', '4ª edição');

INSERT INTO Assunto (Codigo, Nome)
VALUES
    (201, 'Aventura'),
    (202, 'Mistério'),
    (203, 'Romance'),
    (204, 'Fantasia'),
    (205, 'Ficção Científica');

INSERT INTO Reservou (Usuario_Matricula, Livros_Codigo, Data_reserva)
VALUES
    (1, 301, '2024-06-19'),
    (2, 302, '2024-06-20'),
    (3, 303, '2024-06-21');

INSERT INTO Pegou (Usuario_Matricula, Livros_Codigo, Data_emprestimo, Data_devolucao)
VALUES
    (1, 304, '2024-06-22', '2024-07-05'),
    (2, 305, '2024-06-23', '2024-07-07'),
    (3, 301, '2024-06-24', '2024-07-10');

INSERT INTO Escreveu (Autor_Codigo, Livros_Codigo)
VALUES
    (101, 301),
    (102, 302),
    (103, 303);

INSERT INTO Classificado (Assunto_Codigo, Livros_Codigo)
VALUES
    (201, 301),
    (202, 302),
    (203, 303);

-- fetch 
SELECT * FROM Usuario;
SELECT * FROM Autor;
SELECT * FROM Assunto;
SELECT * FROM Livros;

SELECT R.*, L.Titulo, U.Nome AS NomeUsuario
FROM Reservou R
JOIN Livros L ON R.Livros_Codigo = L.Codigo
JOIN Usuario U ON R.Usuario_Matricula = U.Matricula;

SELECT P.*, L.Titulo, U.Nome AS NomeUsuario
FROM Pegou P
JOIN Livros L ON P.Livros_Codigo = L.Codigo
JOIN Usuario U ON P.Usuario_Matricula = U.Matricula;

SELECT E.*, A.Nome AS NomeAutor, L.Titulo
FROM Escreveu E
JOIN Autor A ON E.Autor_Codigo = A.Codigo
JOIN Livros L ON E.Livros_Codigo = L.Codigo;

SELECT C.*, A.Nome AS NomeAssunto, L.Titulo
FROM Classificado C
JOIN Assunto A ON C.Assunto_Codigo = A.Codigo
JOIN Livros L ON C.Livros_Codigo = L.Codigo;
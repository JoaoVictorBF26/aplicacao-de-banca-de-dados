CREATE DATABASE NOVELAS_DB;

USE NOVELAS_DB;

CREATE TABLE AUTORES (
    ID INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(100),
    DATA_NASCIMENTO DATE,
    NACIONALIDADE VARCHAR(50)
);

CREATE TABLE NOVELAS (
    ID INT IDENTITY PRIMARY KEY,
    TITULO VARCHAR(150),
    ANO_ESTREIA INT,
    HORARIO_EXIBICAO VARCHAR(20),
    AUTOR_ID INT,
    FOREIGN KEY (AUTOR_ID) REFERENCES AUTORES(ID)
);

CREATE TABLE ATORES (
    ID INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(100),
    DATA_NASCIMENTO DATE,
    GENERO VARCHAR(20)
);

CREATE TABLE PERSONAGENS (
    ID INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(100),
    TIPO VARCHAR(20),
    ATOR_ID INT,
    NOVELA_ID INT,
    FOREIGN KEY (ATOR_ID) REFERENCES ATORES(ID),
    FOREIGN KEY (NOVELA_ID) REFERENCES NOVELAS(ID)
);

CREATE TABLE CAPITULOS (
    ID INT IDENTITY PRIMARY KEY,
    NUMERO_CAPITULO INT,
    DATA_EXIBICAO DATE,
    NOVELA_ID INT,
    FOREIGN KEY (NOVELA_ID) REFERENCES NOVELAS(ID)
);

CREATE TABLE AUDIENCIAS (
    ID INT IDENTITY PRIMARY KEY,
    CAPITULO_ID INT,
    DATA_MEDICAO DATE,
    PONTUACAO DECIMAL(5,2),
    FOREIGN KEY (CAPITULO_ID) REFERENCES CAPITULOS(ID)
);

INSERT INTO AUTORES (NOME, DATA_NASCIMENTO, NACIONALIDADE) VALUES
('Gloria Perez','1948-09-25','Brasileira'),
('Manoel Carlos','1933-03-14','Brasileiro'),
('Aguinaldo Silva','1943-06-07','Brasileiro'),
('Silvio de Abreu','1942-06-01','Brasileiro'),
('Walther Negrão','1941-04-17','Brasileiro'),
('Ivani Ribeiro','1922-07-16','Brasileira'),
('Cassiano Gabus Mendes','1927-07-29','Brasileiro'),
('Janete Clair','1925-04-25','Brasileira'),
('Benedito Ruy Barbosa','1931-04-17','Brasileiro'),
('João Emanuel Carneiro','1970-01-07','Brasileiro'),
('Maria Adelaide Amaral','1942-04-21','Brasileira'),
('Gilberto Braga','1945-01-01','Brasileiro'),
('Lauro César Muniz','1938-06-16','Brasileiro'),
('Carlos Lombardi','1954-03-11','Brasileiro'),
('Thelma Guedes','1971-10-15','Brasileira'),
('Duca Rachid','1974-01-01','Brasileira'),
('Ricardo Linhares','1962-06-08','Brasileiro'),
('Claudia Souto','1969-10-09','Brasileira'),
('Elizabeth Jhin','1969-01-01','Brasileira'),
('Daniel Ortiz','1977-11-12','Brasileiro'),
('Rosane Svartman','1968-01-01','Brasileira'),
('Ângela Chaves','1974-01-01','Brasileira'),
('Thereza Falcão','1984-01-01','Brasileira'),
('Leonardo Nogueira','1978-01-01','Brasileiro'),
('George Moura','1975-01-01','Brasileiro');

INSERT INTO NOVELAS (TITULO, ANO_ESTREIA, HORARIO_EXIBICAO, AUTOR_ID) VALUES
('O Clone',2001,'21h',1),
('Laços de Família',2000,'21h',2),
('Senhora do Destino',2004,'21h',3),
('Rainha da Sucata',1990,'19h',4),
('Tieta',1989,'20h',5),
('A Viagem',1994,'19h',6),
('Ti Ti Ti',1985,'19h',7),
('Roque Santeiro',1985,'20h',8),
('Pantanal',1990,'21h',9),
('Avenida Brasil',2012,'21h',10),
('Celebridade',2003,'21h',12),
('Vale Tudo',1988,'20h',12),
('Renascer',1993,'21h',9),
('O Rei do Gado',1996,'21h',9),
('Belíssima',2005,'21h',12),
('Império',2014,'21h',3),
('Fina Estampa',2011,'21h',3),
('Amor à Vida',2013,'21h',10),
('Travessia',2022,'21h',1),
('Terra e Paixão',2023,'21h',10),
('Mulheres de Areia',1993,'18h',6),
('Por Amor',1997,'21h',2),
('Esperança',2002,'18h',9),
('Chocolate com Pimenta',2003,'18h',5),
('Alma Gêmea',2005,'18h',5);

INSERT INTO ATORES (NOME, DATA_NASCIMENTO, GENERO) VALUES
('Tony Ramos','1948-08-15','Masculino'),
('Gloria Pires','1963-08-23','Feminino'),
('Susana Vieira','1942-08-23','Feminino'),
('José Mayer','1949-02-03','Masculino'),
('Juliana Paes','1979-03-26','Feminino'),
('Murilo Benício','1971-07-13','Masculino'),
('Adriana Esteves','1969-12-15','Feminino'),
('Cauã Reymond','1980-05-20','Masculino'),
('Fernanda Montenegro','1929-10-16','Feminino'),
('Antonio Fagundes','1949-04-18','Masculino'),
('Marcos Palmeira','1963-08-19','Masculino'),
('Regina Duarte','1947-02-05','Feminino'),
('Paolla Oliveira','1982-04-14','Feminino'),
('Lázaro Ramos','1978-11-01','Masculino'),
('Camila Pitanga','1977-06-14','Feminino'),
('Humberto Martins','1961-07-14','Masculino'),
('Débora Falabella','1979-02-22','Feminino'),
('Rodrigo Lombardi','1976-10-15','Masculino'),
('Letícia Spiller','1973-06-19','Feminino'),
('Mateus Solano','1981-03-20','Masculino'),
('Mariana Ximenes','1981-04-26','Feminino'),
('Alexandre Nero','1970-02-13','Masculino'),
('Bruna Marquezine','1995-08-04','Feminino'),
('Emílio Dantas','1982-11-29','Masculino'),
('Isis Valverde','1987-02-17','Feminino');


SELECT TOP 3 *
FROM AUTORES
ORDER BY DATA_NASCIMENTO ASC;

SELECT *
FROM NOVELAS
WHERE TITULO LIKE '%Amor%';

SELECT *
FROM NOVELAS
WHERE HORARIO_EXIBICAO IN ('18h','21h');

SELECT *
FROM CAPITULOS
WHERE DATA_EXIBICAO BETWEEN '2023-01-01' AND '2023-12-31';

SELECT 
    MIN(PONTUACAO) AS MENOR,
    MAX(PONTUACAO) AS MAIOR
FROM AUDIENCIAS;

SELECT N.TITULO, AVG(AU.PONTUACAO) AS MEDIA
FROM NOVELAS N
JOIN CAPITULOS C ON N.ID = C.NOVELA_ID
JOIN AUDIENCIAS AU ON C.ID = AU.CAPITULO_ID
GROUP BY N.TITULO;

SELECT N.TITULO, AVG(AU.PONTUACAO) AS MEDIA
FROM NOVELAS N
JOIN CAPITULOS C ON N.ID = C.NOVELA_ID
JOIN AUDIENCIAS AU ON C.ID = AU.CAPITULO_ID
GROUP BY N.TITULO
HAVING AVG(AU.PONTUACAO) > 30;

SELECT N.TITULO, COUNT(P.ID) AS TOTAL_PERSONAGENS
FROM NOVELAS N
JOIN PERSONAGENS P ON N.ID = P.NOVELA_ID
GROUP BY N.TITULO;

SELECT A.NOME, COUNT(DISTINCT P.NOVELA_ID) AS TOTAL
FROM ATORES A
JOIN PERSONAGENS P ON A.ID = P.ATOR_ID
GROUP BY A.NOME
HAVING COUNT(DISTINCT P.NOVELA_ID) > 1;

SELECT N.TITULO
FROM NOVELAS N
JOIN PERSONAGENS P ON N.ID = P.NOVELA_ID
GROUP BY N.TITULO
HAVING COUNT(P.ID) >
(
    SELECT AVG(QTD)
    FROM (
        SELECT COUNT(ID) AS QTD
        FROM PERSONAGENS
        GROUP BY NOVELA_ID
    ) X
);

SELECT *
FROM AUDIENCIAS
WHERE PONTUACAO >
(
    SELECT AVG(PONTUACAO)
    FROM AUDIENCIAS
);

SELECT TOP 3 *
FROM AUDIENCIAS
ORDER BY PONTUACAO DESC;

SELECT 
    AU.NOME AS AUTOR,
    N.TITULO,
    COUNT(C.ID) AS TOTAL_CAPITULOS,
    MAX(AU2.PONTUACAO) AS MAIOR_AUDIENCIA
FROM AUTORES AU
JOIN NOVELAS N ON AU.ID = N.AUTOR_ID
JOIN CAPITULOS C ON N.ID = C.NOVELA_ID
JOIN AUDIENCIAS AU2 ON C.ID = AU2.CAPITULO_ID
GROUP BY AU.NOME, N.TITULO;
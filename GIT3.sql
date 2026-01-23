USE DB_JOAO_VICTOR;

create table COUNTRIES (
ID INT auto_increment primary key,
Nome varchar(100),
Continent varchar(100),
Population float(100), 
Area_KM2 float(100) 
);

INSERT INTO COUNTRIES (NOME, CONTINENT, POPULATION, AREA_KM2)
values ('ARGENTINA', 'AMERICA DO SUL', '46000000', '2780400'),
('Brazil', 'América do Sul', '203000000', '8515767'),
('Canada', 'América do Norte', '39000000', '9984670'),
('Denmark', 'Europa', '5900000', '43094'),
('Egypt', 'África', '112000000', '1002450'),
('France', 'Europa', '68000000', '643801'),
('Germany', 'Europa', '84000000', '357592'),
('Hungary', 'Europa', '9600000', '93028'),
('India', 'Ásia', '1420000000', '3287263'),
('Japan', 'Ásia', '125000000', '377975'),
('Kenya', 'África', '55000000', '580367'),
('Luxembourg', 'Europa', '670000', '2586');

SELECT * FROM COUNTRIES;

SELECT Nome, Continent
FROM COUNTRIES;

SELECT *
FROM COUNTRIES
WHERE Continent = 'Europa';

SELECT *
FROM COUNTRIES
ORDER BY CAST(Population AS UNSIGNED) DESC;

CREATE USER 'LEITOR_PAISES'@'%' IDENTIFIED BY 'MINHA*SENHAa468_3';

GRANT SELECT ON DB_JOAO_VICTOR.* TO 'LEITOR_PAISES'@'%';
FLUSH PRIVILEGES;

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'LEITOR_PAISES'@'%';

SELECT *
FROM COUNTRIES
WHERE Nome LIKE '%NI%';










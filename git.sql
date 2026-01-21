create table esportes (
ID INT auto_increment primary key,
nome varchar(100),
detalhes varchar(100),
dif varchar(100) 
);

INSERT INTO esportes (NOME, DETALHES, DIF)
values ('VOLEI', 
' ESPORTE TOP PARA ASSISTIR', 
'DIF MEDIA');

INSERT INTO esportes (NOME, DETALHES, DIF)
values ('FUTEBOL', 
' O MELHOR ESPORTE DO MUNDO', 
'DIF DIFICIL');

INSERT INTO esportes (NOME, DETALHES, DIF)
values ('BASQUETE', 
' O ESPORTE MAIS TENSO DE TODOS', 
'DIF DIFICIL');
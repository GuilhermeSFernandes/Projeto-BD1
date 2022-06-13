DROP TABLE IF EXISTS CLIENTE , VEICULO , CLIENTE_TEM_VEICULO, REPARO, PECA , REPARO_USA_PECA, MECANICO, ESPECIALIDADE, MECANICO_TEM_ESPECIALIDADE, ESTOQUE , FORNECEDOR, ESTOQUE_TEM_FORNECEDOR;

CREATE TABLE CLIENTE(
id_cliente INTEGER PRIMARY KEY,
telefone_cliente INTEGER,
end_cliente VARCHAR (100)

);
CREATE TABLE VEICULO(
placa VARCHAR (30) PRIMARY KEY,
marca_carro VARCHAR (50),
modelo_carro VARCHAR(50)

);
CREATE TABLE CLIENTE_TEM_VEICULO(
id_cliente INTEGER,
placa_carro VARCHAR(30),
FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente),
FOREIGN KEY (placa_carro) REFERENCES VEICULO (placa)
);
CREATE TABLE REPARO(
id_reparo INTEGER PRIMARY KEY,
data_reparo INTEGER,
custo_reparo INTEGER
);

CREATE TABLE PECA(
id_peca INTEGER PRIMARY KEY,
designacao VARCHAR (200),
custo_peca INTEGER
);

CREATE TABLE REPARO_USA_PECA(
id_reparo INTEGER,
id_peca INTEGER,
FOREIGN KEY (id_reparo) REFERENCES REPARO (id_reparo),
FOREIGN KEY (id_peca) REFERENCES PECA (id_peca)
);
CREATE TABLE MECANICO (
horas_trabalhadas INTEGER ,
id_mec INTEGER PRIMARY KEY,
salario_mec INTEGER

);
CREATE TABLE ESPECIALIDADE(
area_atuacao VARCHAR (200),
nome_esp VARCHAR (100) PRIMARY KEY,
custo_esp INTEGER
);
CREATE TABLE MECANICO_TEM_ESPECIALIDADE(
id_mec INTEGER,
nome_esp VARCHAR (100),
FOREIGN KEY (id_mec) REFERENCES MECANICO (id_mec),
FOREIGN KEY (nome_esp) REFERENCES ESPECIALIDADE(nome_esp)
);
CREATE TABLE ESTOQUE (
id_peca INTEGER PRIMARY KEY,
nome_peca VARCHAR (200),
quantidade_peca INTEGER UNIQUE,
FOREIGN KEY (id_peca) REFERENCES PECA(id_peca)
);
CREATE TABLE FORNECEDOR(
CNPJ INTEGER PRIMARY KEY,
logradouro VARCHAR(300),
telefone_fornecedor INTEGER
);
CREATE TABLE ESTOQUE_TEM_FORNECEDOR(
CNPJ INTEGER,
quantidade_peca INTEGER,
FOREIGN KEY (quantidade_peca) REFERENCES ESTOQUE (quantidade_peca),
FOREIGN KEY (CNPJ) REFERENCES FORNECEDOR (CNPJ)

);
insert into CLIENTE (id_cliente, telefone_cliente, end_cliente) values ('1' , '(44)99579-9299', 'Rua araruna'),('2' , '(44)99879-9498', 'Rua rodrigues'),('3' , '(14)99899-9498', 'Avenida manoel'),('4' , '(43)99775-9498', 'Rua brasil'),('5' , '(44)99629-9498', 'Rua brasil'),('6' , '(44)99000-9498', 'Rua rodrigues'),('7' , '(44)99879-9000', 'Avenida indio'),('8' , '(44)99879-9363', 'Rua Sao Paulo'),('9' , '(14)99856-7551', 'Mato grosso'),('10' , '(44)99856-8621', 'Rua rodrigues');
insert into VEICULO (placa, marca_carro, modelo_carro) values ('MPP-4357', 'Honda', 'Fit'),('NAG-2555', 'Honda', 'City'),('MNG-2487', 'Honda', 'Accord'),('MPP-4127', 'Honda', 'WR-V'),('NAC-2251', 'Honda', 'Civic'),('NAC-4357', 'Toyota', 'Hilux'),('KGJ-4754', 'Toyota', 'SW4'),('KGJ-4774', 'Toyota', 'Yaris'),('KGJ-4485', 'Ford', 'Ranger'),('DBN-4582', 'Ford', 'Ka');
insert into CLIENTE_TEM_VEICULO (id_cliente , placa_carro) values ('1','MPP-4357'),('2', 'NAG-2555'),('3', 'MNG-2487'), ('4', 'MPP-4127'), ('5', 'NAC-2251'),('6', 'NAC-4357'),('7', 'KGJ-4754'), ('8', 'KGJ-4774'), ('9', 'KGJ-4485'), ('10', 'DBN-4582');
insert into REPARO (id_reparo, data_reparo, custo_reparo) values ('10', '30/05/2022', '800'), ('20', '31/04/2022', '1000'),('30', '20/05/2022', '400'),('40', '06/05/2022', '800'),('50', '14/05/2022', '1000'),('60', '30/07/2022', '8000'),('70', '02/02/2022', '10800'),('80', '02/08/2022', '700'),('90', '08/04/2022', '3000'),('100', '30/10/2022', '20000');
insert into PECA (id_peca , designacao, custo_peca) values ('11', 'Motor', '1000'),('12', 'Motor', '1000'), ('13', 'Roda', '500'),('14', 'Roda', '300'),('15', 'Cambio', '5000'),('16', 'Freio', '1000'),('17', 'Cambio', '100'),('18', 'Suspensao', '1000'),('19', 'Bomba de Oleo', '2000'),('21', 'Ar condicionado', '4000');
insert into REPARO_USA_PECA(id_reparo, id_peca) values ('10', '11'), ('20', '12'),('30', '13'),('40', '14'),('50', '15'),('60', '16'),('70', '17'),('80', '18'),('90', '19'),('100', '21');
insert into MECANICO ( horas_trabahadas, id_mec, salario_mec) values ('100', '21', '1200'),('200', '22', '1800'),('120', '23', '1300'),('90', '24', '1050'),('100', '25', '1200'),('220', '26', '2000'),('80', '27', '850'),('100', '28', '1200'),('60', '29', '500'),('40', '30', '300');   
insert into ESPECIALIDADE (area_atuacao, nome_esp, custo_esp) values ('Funelaria', 'Funelaria e Pintura', '500'),('Mecanica', 'Motores', '400'),('Mecanica', 'Cambio', '300'),('Mecanica', 'Cambio Automatico', '500'),('Tunning', 'ECU', '1000'),('Tunning', 'Turbo', '500'),('Retifica', 'Retifica em Motor', '2000'),('Detalhamento', 'Detalhamento Automotivo', '900'),('Ar Condionado', 'Reparo Ar Condicionado', '700'),('Eletrica', 'Eletrica Automotiva', '500')('Tração', 'Tração Automotiva','3000') ;
insert into MECANICO_TEM_ESPECIALIDADE (id_mec, nome_esp) values ('21', 'Funelaria e Pintura'),('22', 'Motores'),('23', 'Cambio'),('24', 'Cambio Automatico'),('25', 'ECU'),('26', 'Turbo'),('26', 'Retifica em Motor'),('27', 'Detalhamento Automotivo'),('28', 'Reparo Ar Condicionado'),('29', 'Eletrica Automotiva'),('30', 'Tração Automotiva');
insert into ESTOQUE (id_peca, nome_peca, quantidade_peca) values ('11', 'Correia Motor', '10'),('12', 'Pistao Motor', '100'), ('13', 'Disco Roda', '50'),('14', 'Prisioneiro Roda', '300'),('15', 'Rolamento Cambio', '40'),('16', 'Pastilha Freio', '100'),('17', 'Cambio', '2'),('18', 'Suspensao', '10'),('19', 'Bomba de Oleo', '0'),('21', 'Ar condicionado', '0');
insert into FONECEDOR (CNPJ, logradouro, telefone_fornecedor) values ('01.647.593/0001-45', 'Avenida manoel','(44)99572-9498'),('01.647.555/0001-45', 'Avenida manoel','(44)99444-9488'),('01.666.993/0001-65', 'Avenida indio','(44)99572-9962'),('01.627.555/0001-24', 'Avenida santana','(44)99442-9998'),('08.647.663/0001-88', 'rua Sao Paulo','(14)99572-9498'),('09.647.852/0001-45', 'Rua araruna','(14)99856-9498'),('04.622.556/0001-45', 'Rua Brasil','(44)99666-9598'),('01.985.593/0001-45', 'Rua Delmanto','(43)99325-9498'),('01.444.222/0001-45', 'Rua araruna','(11)99666-9552'),('01.999.666/0001-45', 'Rua Edmundo','(44)99888-9222');
insert into ESTOQUE_TEM_FORNECEDOR (CNPJ, quantidade_peca) values ('01.647.593/0001-45', '10'),('01.647.555/0001-45', '100'),('01.666.993/0001-65', '50'),('01.627.555/0001-24', '300'),('08.647.663/0001-88', '40'),('09.647.852/0001-45', '100'),('04.622.556/0001-45', '2'),('01.985.593/0001-45', '10'),('01.444.222/0001-45', '0'),('01.999.666/0001-45', '0');

#Guilherme dos Santos Fernandes 2304325
#https://github.com/GuilhermeSFernandes/Projeto-BD1



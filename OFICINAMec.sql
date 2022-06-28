DROP TABLE IF EXISTS CLIENTE , VEICULO , CLIENTE_TEM_VEICULO, REPARO, PECA , REPARO_USA_PECA, MECANICO, ESPECIALIDADE, MECANICO_TEM_ESPECIALIDADE, ESTOQUE , FORNECEDOR, ESTOQUE_TEM_FORNECEDOR;

CREATE TABLE CLIENTE(
id_cliente INTEGER PRIMARY KEY,
telefone_cliente varchar(30),
end_cliente VARCHAR (100)

);
CREATE TABLE VEICULO(
placa VARCHAR (30) PRIMARY KEY,
marca_carro VARCHAR (50),
modelo_carro VARCHAR(50)

);
CREATE TABLE CLIENTE_TEM_VEICULO(
idcliente INTEGER,
placa_carro VARCHAR(30),
FOREIGN KEY (idcliente) REFERENCES CLIENTE (id_cliente),
FOREIGN KEY (placa_carro) REFERENCES VEICULO (placa)
);
CREATE TABLE REPARO(
id_reparo INTEGER PRIMARY KEY,
data_reparo varchar(30),
custo_reparo INTEGER
);

CREATE TABLE PECA(
id_peca INTEGER PRIMARY KEY,
designacao VARCHAR (200),
custo_peca INTEGER
);

CREATE TABLE REPARO_USA_PECA(
idreparo INTEGER,
idpeca INTEGER,
FOREIGN KEY (idreparo) REFERENCES REPARO (id_reparo),
FOREIGN KEY (idpeca) REFERENCES PECA (id_peca)
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
idmec INTEGER,
nomeesp VARCHAR (100),
FOREIGN KEY (idmec) REFERENCES MECANICO (id_mec),
FOREIGN KEY (nomeesp) REFERENCES ESPECIALIDADE(nome_esp)
);
CREATE TABLE ESTOQUE (
idpeca INTEGER,
nome_peca VARCHAR (200),
quantidade_peca INTEGER PRIMARY KEY,
FOREIGN KEY (idpeca) REFERENCES PECA(id_peca)
);
CREATE TABLE FORNECEDOR(
CNPJ VARCHAR(50) PRIMARY KEY,
logradouro VARCHAR(300),
telefone_fornecedor VARCHAR(40)
);
CREATE TABLE ESTOQUE_TEM_FORNECEDOR(
CNPJ_FORNECEDOR VARCHAR(50),
quantidadepeca INTEGER,
FOREIGN KEY (quantidadepeca) REFERENCES ESTOQUE (quantidade_peca),
FOREIGN KEY (CNPJ_FORNECEDOR) REFERENCES FORNECEDOR (CNPJ)

);
insert into CLIENTE (id_cliente, telefone_cliente, end_cliente) values ('1' , '(44)99579-9299', 'Rua araruna'),('2' , '(44)99879-9498', 'Rua rodrigues'),('3' , '(14)99899-9498', 'Avenida manoel'),('4' , '(43)99775-9498', 'Rua brasil'),('5' , '(44)99629-9498', 'Rua brasil'),('6' , '(44)99000-9498', 'Rua rodrigues'),('7' , '(44)99879-9000', 'Avenida indio'),('8' , '(44)99879-9363', 'Rua Sao Paulo'),('9' , '(44)99856-8621', 'Mato grosso'),('10' , '(14)99856-7551', 'Rua rodrigues');
insert into VEICULO (placa, marca_carro, modelo_carro) values ('MPP-4357', 'Honda', 'Fit'),('NAG-2555', 'Honda', 'City'),('MNG-2487', 'Honda', 'Accord'),('MPP-4127', 'Honda', 'WR-V'),('NAC-2251', 'Honda', 'Civic'),('NAC-4357', 'Toyota', 'Hilux'),('KGJ-4754', 'Toyota', 'SW4'),('KGJ-4774', 'Toyota', 'Yaris'),('KGJ-4485', 'Ford', 'Ranger'),('DBN-4582', 'Ford', 'Ka');
insert into CLIENTE_TEM_VEICULO (idcliente , placa_carro) values ('1','MPP-4357'),('2', 'NAG-2555'),('3', 'MNG-2487'), ('4', 'MPP-4127'), ('5', 'NAC-2251'),('6', 'NAC-4357'),('7', 'KGJ-4754'), ('8', 'KGJ-4774'), ('9', 'KGJ-4485'), ('10', 'DBN-4582');
insert into REPARO (id_reparo, data_reparo, custo_reparo) values ('10', '30/05/2022', '800'), ('20', '31/04/2022', '1000'),('30', '20/05/2022', '400'),('40', '06/05/2022', '800'),('50', '14/05/2022', '1000'),('60', '30/07/2022', '8000'),('70', '02/02/2022', '10800'),('80', '02/08/2022', '700'),('90', '08/04/2022', '3000'),('100', '30/10/2022', '20000');
insert into PECA (id_peca , designacao, custo_peca) values ('11', 'Motor', '1000'),('12', 'Motor', '1000'), ('13', 'Roda', '500'),('14', 'Roda', '300'),('15', 'Cambio', '5000'),('16', 'Freio', '1000'),('17', 'Cambio', '100'),('18', 'Suspensao', '1000'),('19', 'Bomba de Oleo', '2000'),('21', 'Ar condicionado', '4000');
insert into REPARO_USA_PECA(idreparo, idpeca) values ('10', '11'), ('20', '12'),('30', '13'),('40', '14'),('50', '15'),('60', '16'),('70', '17'),('80', '18'),('90', '19'),('100', '21');
insert into MECANICO ( horas_trabalhadas, id_mec, salario_mec) values ('100', '21', '1200'),('200', '22', '1800'),('120', '23', '1300'),('90', '24', '1050'),('100', '25', '1200'),('220', '26', '2000'),('80', '27', '850'),('100', '28', '1200'),('60', '29', '500'),('40', '30', '300');   
insert into ESPECIALIDADE (area_atuacao, nome_esp, custo_esp) values ('Funelaria', 'Funelaria e Pintura', '500'),('Mecanica', 'Motores', '400'),('Mecanica', 'Cambio', '300'),('Mecanica', 'Cambio Automatico', '500'),('Tunning', 'ECU', '1000'),('Tunning', 'Turbo', '500'),('Retifica', 'Retifica em Motor', '2000'),('Detalhamento', 'Detalhamento Automotivo', '900'),('Ar Condionado', 'Reparo Ar Condicionado', '700'),('Eletrica', 'Eletrica Automotiva', '500'),('Tração', 'Tração Automotiva','3000') ;
insert into MECANICO_TEM_ESPECIALIDADE (idmec, nomeesp) values ('21', 'Funelaria e Pintura'),('22', 'Motores'),('23', 'Cambio'),('24', 'Cambio Automatico'),('25', 'ECU'),('26', 'Turbo'),('26', 'Retifica em Motor'),('27', 'Detalhamento Automotivo'),('28', 'Reparo Ar Condicionado'),('29', 'Eletrica Automotiva'),('30', 'Tração Automotiva');
insert into ESTOQUE (idpeca, nome_peca, quantidade_peca) values ('14', 'Prisioneiro Roda', '300'),('12', 'Pistao Motor', '110'),('16', 'Pastilha Freio', '100'),('13', 'Disco Roda', '50'),('15', 'Rolamento Cambio', '40'),('11', 'Correia Motor', '15'),('18', 'Suspensao', '10'),('17', 'Cambio', '2'),('19', 'Bomba de Oleo', '1'),('21', 'Ar condicionado', '0');
insert into FORNECEDOR (CNPJ, logradouro, telefone_fornecedor) values ('01.647.593/0001-45', 'Avenida manoel','(44)99572-9498'),('01.647.555/0001-45', 'Avenida manoel','(44)99444-9488'),('01.666.993/0001-65', 'Avenida indio','(44)99572-9962'),('01.627.555/0001-24', 'Avenida santana','(44)99442-9998'),('08.647.663/0001-88', 'rua Sao Paulo','(14)99572-9498'),('09.647.852/0001-45', 'Rua araruna','(14)99856-9498'),('04.622.556/0001-45', 'Rua Brasil','(44)99666-9598'),('01.985.593/0001-45', 'Rua Delmanto','(43)99325-9498'),('01.444.222/0001-45', 'Rua araruna','(11)99666-9552'),('01.999.666/0001-45', 'Rua Edmundo','(44)99888-9222');
insert into ESTOQUE_TEM_FORNECEDOR (CNPJ_FORNECEDOR, quantidadepeca) values ('01.647.593/0001-45', '10'),('01.647.555/0001-45', '100'),('01.666.993/0001-65', '50'),('01.627.555/0001-24', '300'),('08.647.663/0001-88', '40'),('09.647.852/0001-45', '100'),('04.622.556/0001-45', '2'),('01.985.593/0001-45', '10'),('01.444.222/0001-45', '0'),('01.999.666/0001-45', '0');

#========================= Selecionar os id dos donos dos veiculos Toyota que moram na Rua Brasil =================================================================#
	#select id_cliente 
    #from CLIENTE_TEM_VEICULO CV, VEICULO V , CLIENTE C 
	#where C.id_cliente = CV.idcliente 
    #and V.placa = CV.placa_carro
	#and marca_carro = 'Toyota'
    #union
    #select id_cliente 
    #from CLIENTE C 
    #where end_cliente = 'Rua Brasil';
#============================================================================================================================================================#

#========================= Selecionar mecanico com a especialidade de funelaria e pintura que trabalha 100 horas  ===============================#
	#select distinct id_mec 
    #from MECANICO M 
	#where M.id_mec in ( select id_mec 
						#from MECANICO_TEM_ESPECIALIDADE ME 
                        #where nomeesp = 'Funelaria e Pintura'
                        #and id_mec not in (select id_mec 
											#from MECANICO
                                            #where horas_trabalhadas > 100))
#============================================================================================================================================================#

#========================= Selecionar o nome da especialidade do mecanico que ganha 1200 ou mais ou trabalha mais de 100 horas ===============================#
	#select distinct nomeesp, idmec 
    #from MECANICO_TEM_ESPECIALIDADE ME 
	#where idmec in ( select id_mec 
	#					from MECANICO
     #                   where salario_mec >= 1200 or horas_trabalhadas 
	#										in (select id_mec 
	#										from MECANICO
   #                                         where horas_trabalhadas > 100))
#============================================================================================================================================================#

#========================= Selecionar CNPJ dos fornecedores que nao fornecem peça para ar condionado ============================================================#
	#select distinct CNPJ
   # from FORNECEDOR F
    #where F.CNPJ not in ( select CNPJ
	#					  from FORNECEDOR F, ESTOQUE_TEM_FORNECEDOR EF, ESTOQUE E
    #                      where F.CNPJ = EF.CNPJ_FORNECEDOR
    #                      and E.quantidade_peca = EF.quantidadepeca
    #                      and nome_peca = 'Ar condicionado')
    
#=================================================================================================================================================================#

#========================= Selecionar Logradouro dos fornecedores que nao fornece peça para suspensao ===============================================================#
	#select distinct Logradouro
    #from FORNECEDOR F
    #where F.CNPJ not in ( select CNPJ
	#					  from FORNECEDOR F, ESTOQUE_TEM_FORNECEDOR EF, ESTOQUE E
    #                     where F.CNPJ = EF.CNPJ_FORNECEDOR
    #                     and E.quantidade_peca = EF.quantidadepeca
    #                    and nome_peca = 'Suspensao')
#===============================================================================================================================================================#

#=========================== Selecionar designação peca dos serviços acima de 3000 ==================================================================================#

#	select distinct designacao
 #   from PECA
#	where id_peca in ( select idpeca
#						from REPARO_USA_PECA
#                        where idreparo     not in (select id_reparo
#											from REPARO
 #                                           where custo_reparo <= 3000))
#===============================================================================================================================================================#

#========================= Selecionar  cliente que tem um honda que nao tenha a placa MPP-4357 ==================================================================================#
	#select  *
    #from CLIENTE
	#where id_cliente in ( select idcliente
	#					  from CLIENTE_TEM_VEICULO CV, VEICULO V 
	#					  where V.placa = CV.placa_carro
    #                      and marca_carro = 'Honda'
    #                      and placa not in (select placa
	#										from VEICULO
	#										where placa = 'MPP-4357'))
#===============================================================================================================================================================#

#========================= Selecionar endereço dos cliente que tem um veiculo toyota mas nao um yaris ==================================================================================#
	#select  *
   # from CLIENTE
#	where id_cliente in ( select idcliente
	#					  from CLIENTE_TEM_VEICULO CV, VEICULO V 
	#					  where V.placa = CV.placa_carro
    #                      and marca_carro = 'Toyota'
    #                      and modelo_carro not in (select modelo_carro
	#										from VEICULO
	#										where modelo_carro = 'Yaris'))
#===============================================================================================================================================================#

#========================= Selecionar telefone, endereco e id do cliente que tem um FORD que nao tenha a placa KGJ-4485 e não é uma RANGER ==================================================================================#
#	select  *
#   from CLIENTE
#	where id_cliente in ( select idcliente
#						  from CLIENTE_TEM_VEICULO CV, VEICULO V 
#						  where V.placa = CV.placa_carro
#                          and marca_carro = 'Ford'
#                         and modelo_carro not in (select modelo_carro
#										           from VEICULO
#												   where modelo_carro = 'Ranger'
#												   and placa = 'KGJ-4485'))
#===============================================================================================================================================================#

#========================= Selecionar telefone, endereco e id do mecanico 26 que trabalha mais de 100 horas ==================================================================================#
#select distinct *
#from MECANICO M 
#where M.id_mec in ( select idmec 
#						from MECANICO_TEM_ESPECIALIDADE ME 
#                        where idmec = 26
#                        and id_mec not in (select id_mec 
#											from MECANICO
#                                            where horas_trabalhadas < 100))
#===============================================================================================================================================================#

#Guilherme dos Santos Fernandes 2304325
#https://github.com/GuilhermeSFernandes/Projeto-BD1

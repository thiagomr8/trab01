/* Create */

CREATE TABLE CIDADAO (
    cod_cidadao INTEGER,
    nome VARCHAR(64),
    senha VARCHAR(16),
    email VARCHAR(64) UNIQUE,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_cidadao PRIMARY KEY(cod_cidadao)
);

CREATE TABLE COLETOR (
    cod_coletor INTEGER,
    placa VARCHAR(8),
    modelo VARCHAR(16),
    marca VARCHAR(16),
    ano INTEGER,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_coletor PRIMARY KEY(cod_coletor)
);

CREATE TABLE BAIRRO (
    cod_bairro INTEGER,
    nome VARCHAR(32) UNIQUE,
    CONSTRAINT pk_bairro PRIMARY KEY(cod_bairro)
);

CREATE TABLE LIXEIRA (
    cod_lixeira INTEGER ,
    cod_bairro INTEGER,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_lixeira PRIMARY KEY(cod_lixeira),
    CONSTRAINT fk_bairro_lixeira FOREIGN KEY (cod_bairro) REFERENCES BAIRRO (cod_bairro)
);

CREATE TABLE STATUS (
    cod_status INTEGER,
    descricao VARCHAR(256) UNIQUE,
    CONSTRAINT pk_status PRIMARY KEY(cod_status)
);

CREATE TABLE SITUACAO_OPERACIONAL (
    cod_lixeira INTEGER,
    cod_coletor INTEGER,
    cod_status INTEGER,
    hora_status TIME,
    data_status DATE,
    CONSTRAINT fk_lixeira_situacao_operacioanal FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira),
    CONSTRAINT fk_coletor_situacao_operacioanal FOREIGN KEY (cod_coletor) REFERENCES COLETOR (cod_coletor),
    CONSTRAINT fk_status_situacao_operacioanal FOREIGN KEY (cod_status) REFERENCES STATUS (cod_status)
);

CREATE TABLE COLETA (
    cod_coletor INTEGER,
    cod_lixeira INTEGER,
    nivel FLOAT,
    hora_coleta TIME,
    data_coleta DATE,
    CONSTRAINT fk_coletor_coleta FOREIGN KEY (cod_coletor) REFERENCES COLETOR (cod_coletor),
    CONSTRAINT fk_lixeira_coleta FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);

CREATE TABLE DESCARTE (
    cod_cidadao INTEGER,
    cod_lixeira INTEGER,
    nivel FLOAT,
    data_descarte DATE,
    hora_descarte TIME,
    CONSTRAINT fk_cidadao_descarte FOREIGN KEY (cod_cidadao) REFERENCES CIDADAO (cod_cidadao),
    CONSTRAINT fk_lixeira_descarte FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);




/* Insert */

INSERT INTO BAIRRO (cod_bairro, nome) VALUES 
	(1,'Grande Goiabeiras'),
	(2,'Centro de Vitória'),
	(3,'Colina de Laranjeiras'),
	(4,'Porto de Santana'),
	(5,'Carapina'),
	(6,'Jardim da Penha'),
	(7,'Jardim Camburi'),
	(8,'Manguinhos'),
	(9,'Mata da Praia'),
	(10,'Bento Ferreira');
	
	
INSERT INTO LIXEIRA (cod_lixeira, cod_bairro, latitude, longitude, capacidade, nivel_atual) VALUES 
    (0,1,-20.196136,-40.255506,160,90), 
    (1,2,-20.198243,-40.253086,200,97), 
    (2,3,-20.198688,-40.258084,235,87), 
    (3,4,-20.195919,-40.258796,241,77), 
    (4,5,-20.192521,-40.256842,100,70), 
    (5,6,-20.193271,-40.252901,50,80), 
    (6,7,-20.195081,-40.251535,35,86), 
    (7,8,-20.196941,-40.251623,60,99), 
    (8,9,-20.196955,-40.251233,120,10), 
    (9,10,-20.196958,-40.252933,200,50), 
    (10,10,-20.196928,-40.196928,100,90), 
    (11,10,-20.196918,-40.196918,120,80), 
    (12,10,-20.193958,-40.193958,110,50), 
    (13,10,-20.196958,-40.196958,100,40), 
    (14,10,-20.196758,-40.196758,160,80), 
    (15,10,-20.196858,-40.196858,200,90), 
    (16,10,-20.196998,-40.196998,300,99), 
    (17,10,-20.192998,-40.192398,200,0), 
    (18,10,-20.192398,-40.192698,400,0);


INSERT INTO COLETOR (cod_coletor, placa, modelo, marca, ano, capacidade, longitude, latitude) VALUES
	(0,'MTR-3338','VEGALIX','Mercedes Benz',2016,10000,-40.2555063,-20.1961361),
	(1,'MTV-4311','SITA 6000','Volkswagen',2015,10000,-40.2530861,-20.1982403),
	(2,'MQZ-8687','VEGALIX','Mercedes Benz',2013,12000,-40.2580835,-20.1986875),
	(3,'MTB-1361','EZ PACK','Volvo',2015,15000,-40.2587904,-20.1959193),
	(4,'MSG-4883','EZ PACK','Volvo',2013,10000,-40.2568421,-20.1925205),
	(5,'MSZ-7251','COLECOM','Scania',2016,12000,-40.2529013,-20.1932706),
	(6,'MRB-6206','COLECOM','Scania',2019,10000,-40.2515352,-20.1950812),
	(7,'MRY-5351','EZ PACK','Volvo',2019,12000,-40.2516228,-20.1969409),
	(8,'MRF-7474','SITA 6000','Volkswagen',2016,12000,-40.2512928,-20.1349409),
	(9,'MSI-6750','EZ PACK','Volvo',2018,15000,-40.2006228,-20.1962209);
	
INSERT INTO CIDADAO (cod_cidadao, nome, email, senha, latitude, longitude) VALUES
	(1,'Livinho Silve','livinho@gmail.com','12312',-20.0507711,-40.2209473),
	(2,'Maria Joaquina','maria@hotmail.com','12342',-20.0868885,-40.2703857),
	(3,'Marcelo Paiva','marcelo@hotmail.com','12345',-20.2003469,-40.2484131),
	(4,'Livia Estrela','livia@hotmail.com','12344',-20.2621971,-40.3417969),
	(5,'Kellen Andrade','kellen@gmail.com','12312',-20.3909744,-40.2978516),
	(6,'Maria Luisa','maria123@gmail.com','12341',-20.2055012,-40.2044678),
	(7,'Lais Laticinio','lala888@hotmail.com','32134',-20.1745675,-40.3363037),
	(8,'Orides Identico','oi123@gmail.com','43242',-20.2950455,-40.3054047),
	(9,'Otavio Freitas','oooo111@gmail.com','11128',-19.2950455,-39.3054029),
	(10,'Daniel Miranda','miranda_d@gmail.com','22345',-18.2930455,-38.3052043);


INSERT INTO STATUS (cod_status, descricao) VALUES
	(1,'Quebrada'),
	(2,'Não atende a demanda'),
	(3,'OK');


INSERT INTO SITUACAO_OPERACIONAL (cod_lixeira, cod_status, data_status, hora_status, cod_coletor) VALUES
	(0,3,'2019-03-19','09:30:00',0),
	(1,3,'2019-03-20','09:35:00',1),
	(2,3,'2019-03-21','09:42:00',2),
	(3,3,'2019-03-22','10:24:00',9),
	(4,3,'2019-03-23','10:30:00',4),
	(5,3,'2019-03-24','12:10:00',5),
	(6,3,'2019-03-25','12:20:00',6),
	(7,3,'2019-03-26','12:30:00',7),
	(8,3,'2019-03-20','13:00:00',8),
	(9,3,'2019-03-21','14:00:00',3),
	(10,3,'2019-03-21','15:00:00',3),
	(11,3,'2019-03-21','16:00:00',3),
	(12,3,'2019-03-21','17:00:00',3),
	(13,2,'2019-03-21','18:00:00',3),
	(14,2,'2019-03-21','19:00:00',3),
	(15,3,'2019-03-21','20:00:00',3),
	(16,3,'2019-03-21','21:00:00',3),
	(17,1,'2019-03-22','22:00:00',4),
	(18,1,'2019-03-23','23:00:00',4);


INSERT INTO DESCARTE (cod_lixeira, cod_cidadao, volume, data_descarte, hora_descarte) VALUES
	(0,1,144,'2019-03-19','10:10:00'),
	(1,2,194,'2019-03-20','11:22:00'),
	(2,3,204,'2019-03-21','10:00:00'),
	(3,4,185,'2019-03-22','13:01:00'),
	(4,5,70,'2019-03-23','15:21:00'),
	(5,6,40,'2019-03-24','16:11:00'),
	(6,7,30,'2019-03-25','17:11:00'),
	(7,8,59,'2019-03-26','04:11:00'),
	(8,9,12,'2019-03-27','18:38:00'),
	(9,10,50,'2019-03-27','19:00:00'),
	(9,9,50,'2019-03-27','20:00:00'),
	(10,2,90,'2019-03-27','21:00:00'),
	(11,7,96,'2019-03-27','21:30:00'),
	(12,6,55,'2019-03-27','21:32:00'),
	(13,2,40,'2019-03-27','22:32:00'),
	(14,3,128,'2019-03-27','23:32:00'),
	(15,4,180,'2019-03-27','23:36:00'),
	(16,5,297,'2019-03-27','23:39:00');


INSERT INTO COLETA (cod_lixeira, cod_coletor, volume, data_coleta, hora_coleta) VALUES
	(0,0,144,'2019-03-26','10:10:00'),
	(1,0,194,'2019-03-26','10:12:00'),
	(2,1,204,'2019-03-27','10:14:00'),
	(3,1,185,'2019-03-27','10:16:00'),
	(4,1,70,'2019-03-27','10:18:00'),
	(5,1,40,'2019-03-27','10:20:00'),
	(6,1,30,'2019-03-27','10:23:00'),
	(7,1,59,'2019-03-27','10:25:00'),
	(10,2,90,'2019-03-29','13:13:00'),
	(11,2,96,'2019-03-29','13:14:00'),
	(14,2,128,'2019-03-29','13:20:00'),
	(15,2,180,'2019-03-29','13:22:00'),
	(16,2,297,'2019-03-29','13:25:00');



CREATE TABLE CLIENTE (
    CPF VARCHAR(255),
    ID_CLIENTE INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    SOBRENOME VARCHAR(255),
    DT_NASCIMENTO DATE,
    SEXO CHAR(1),
    TELEFONE VARCHAR(255),
    EMAIL VARCHAR(255),
    RUA VARCHAR(255),
    NUM VARCHAR(255),
    BAIRRO VARCHAR(255),
    CIDADE VARCHAR(255),
    ESTADO CHAR(2),
    PAIS CHAR(2),
    CEP CHAR(9)
);

CREATE TABLE DEPENDENTE (
    ID_DEP INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    SEXO CHAR(1),
    DT_NASC DATE,
    FK_CLIENTE_ID_CLIENTE INTEGER
);

CREATE TABLE TRANSPORTADORA (
    ID_TRANSP INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    TELEFONES VARCHAR(255),
    EMAIL VARCHAR(255)
);

CREATE TABLE VENDA (
    ID_VENDA INTEGER PRIMARY KEY,
    FRETE NUMBER(*,2),
    ENDERECO VARCHAR(255),
    FK_TRANSPORTADORA_ID_TRANSP INTEGER,
    DT_ENTREGA DATE,
    FK_EMPREGADO_MATRICULA INTEGER,
    FK_CLIENTE_ID_CLIENTE INTEGER
);

CREATE TABLE EMPREGADO (
    MATRICULA INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    FUNCAO VARCHAR(255),
    DT_NASCIMENTO DATE,
    DT_CONTRATO DATE,
    ENDERECO VARCHAR(255),
    TELEFONES VARCHAR(255),
    SALARIO NUMBER(*,2),
    FK_REGIAO_ID_REGIAO INTEGER
);

CREATE TABLE REGIAO (
    ID_REGIAO INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    FK_EMPREGADO_MATRICULA INTEGER
);

CREATE TABLE PRODUTO (
    ID_PROD INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    PRECO_COMPRA NUMBER(*,2),
    MARGEM_LUCRO INTEGER,
    DESCONTINUADO CHAR(1),
    DT_FABRIC DATE,
    DT_VALIDADE DATE,
    FK_FORNECEDOR_ID_FORN INTEGER,
    FK_CATEGORIA_ID_CATEGORIA INTEGER
);

CREATE TABLE FORNECEDOR (
    ID_FORN INTEGER PRIMARY KEY,
    NOME VARCHAR(255),
    EMAIL VARCHAR(255),
    ENDERECO VARCHAR(255),
    TELEFONE VARCHAR(255),
    HOMEPAGE VARCHAR(255)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INTEGER PRIMARY KEY,
    NOME VARCHAR(255)
);

ALTER TABLE DEPENDENTE ADD CONSTRAINT FK_DEPENDENTE_1
    FOREIGN KEY (FK_CLIENTE_ID_CLIENTE)
    REFERENCES CLIENTE (ID_CLIENTE);
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_1
    FOREIGN KEY (FK_TRANSPORTADORA_ID_TRANSP)
    REFERENCES TRANSPORTADORA (ID_TRANSP);
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (FK_EMPREGADO_MATRICULA)
    REFERENCES EMPREGADO (MATRICULA);
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_3
    FOREIGN KEY (FK_CLIENTE_ID_CLIENTE)
    REFERENCES CLIENTE (ID_CLIENTE);
 
ALTER TABLE EMPREGADO ADD CONSTRAINT FK_EMPREGADO_1
    FOREIGN KEY (FK_REGIAO_ID_REGIAO)
    REFERENCES REGIAO (ID_REGIAO);

ALTER TABLE REGIAO ADD CONSTRAINT FK_REGIAO_1
    FOREIGN KEY (FK_EMPREGADO_MATRICULA)
    REFERENCES EMPREGADO (MATRICULA);

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_1
    FOREIGN KEY (FK_FORNECEDOR_ID_FORN)
    REFERENCES FORNECEDOR (ID_FORN);
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2
    FOREIGN KEY (FK_CATEGORIA_ID_CATEGORIA)
    REFERENCES CATEGORIA (ID_CATEGORIA);
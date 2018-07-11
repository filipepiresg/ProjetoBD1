CREATE TABLE Cliente (
    rua varchar,
    numero varchar,
    bairro varchar,
    cidade varchar,
    estado varchar,
    cep varchar,
    sexo char ('M','F'),
    email varchar,
    telefone varchar,
    titulo varchar,
    nome varchar,
    sobrenome varchar,
    matricula varchar PRIMARY KEY,
    data_nasc date
);

CREATE TABLE Venda (
    cod INTEGER PRIMARY KEY,
    data_venda date,
    FK_Transportadora_cod INTEGER,
    data_entrega date,
    frete float,
    FK_Cliente_matricula varchar,
    FK_Empregado_matricula varchar
);

CREATE TABLE Empregado (
    matricula varchar PRIMARY KEY,
    nome varchar,
    salario float,
    profissao varchar,
    contratacao date,
    data_nasc date
);

CREATE TABLE Regiao (
    cod INTEGER PRIMARY KEY,
    nome varchar
);

CREATE TABLE Transportadora (
    cod INTEGER PRIMARY KEY,
    nome varchar,
    telefone varchar,
    email varchar
);

CREATE TABLE Fornecedor (
    cod INTEGER PRIMARY KEY,
    end varchar,
    telefone varchar,
    nome varchar,
    contato_nome varchar,
    contato_email VARCHAR
);

CREATE TABLE Produto (
    id INTEGER PRIMARY KEY,
    preco FLOAT,
    custo FLOAT,
    validade date,
    quant_min INTEGER,
    lucro FLOAT,
    quant FLOAT,
    FK_Fornecedor_cod INTEGER,
    FK_Categoria_id inteiro
);

CREATE TABLE Categoria (
    id inteiro PRIMARY KEY,
    nome varchar
);

CREATE TABLE Dependente (
    data_nasc date,
    sexo char('M','F'),
    FK_Cliente_matricula varchar
);

CREATE TABLE supervisiona (
    FK_Empregado_matricula varchar,
    FK_Empregado_matricula_ varchar
);

CREATE TABLE atua (
    FK_Regiao_cod INTEGER,
    FK_Empregado_matricula varchar
);

CREATE TABLE inclui (
    FK_Produto_id INTEGER,
    FK_Venda_cod INTEGER,
    desconto float
);
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_1
    FOREIGN KEY (FK_Transportadora_cod)
    REFERENCES Transportadora (cod)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_2
    FOREIGN KEY (FK_Cliente_matricula)
    REFERENCES Cliente (matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_3
    FOREIGN KEY (FK_Empregado_matricula)
    REFERENCES Empregado (matricula)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_1
    FOREIGN KEY (FK_Fornecedor_cod)
    REFERENCES Fornecedor (cod)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (FK_Categoria_id)
    REFERENCES Categoria (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Dependente ADD CONSTRAINT FK_Dependente_0
    FOREIGN KEY (FK_Cliente_matricula)
    REFERENCES Cliente (matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_0
    FOREIGN KEY (FK_Empregado_matricula)
    REFERENCES Empregado (matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (FK_Empregado_matricula_)
    REFERENCES Empregado (matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE atua ADD CONSTRAINT FK_atua_0
    FOREIGN KEY (FK_Regiao_cod)
    REFERENCES Regiao (cod)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE atua ADD CONSTRAINT FK_atua_1
    FOREIGN KEY (FK_Empregado_matricula)
    REFERENCES Empregado (matricula)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE inclui ADD CONSTRAINT FK_inclui_0
    FOREIGN KEY (FK_Produto_id)
    REFERENCES Produto (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE inclui ADD CONSTRAINT FK_inclui_1
    FOREIGN KEY (FK_Venda_cod)
    REFERENCES Venda (cod)
    ON DELETE SET NULL ON UPDATE CASCADE;
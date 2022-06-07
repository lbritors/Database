CREATE TABLE CLIENTE (
ID_Cliente INTEGER,
nome VARCHAR(80),
endereco VARCHAR (80),
CPF CHAR(11)

);

CREATE TABLE PEDIDO (
ID_Pedido INTEGER AUTO_INCREMENT,
data_pedido date,
descricao VARCHAR(100),
ID_Funcionario INTEGER,
ID_Cliente INTEGER,
PRIMARY KEY (ID_Pedido),
FOREIGN KEY (ID_Funcionario) REFERENCES ATENDENTE(ID_Funcionario),
FOREIGN KEY (ID_Funcionario) REFERENCES ENTREGADOR(ID_Funcionario),
FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

CREATE TABLE FUNCIONARIO (
ID_Funcionario INTEGER,
CPF VARCHAR (80),
nome VARCHAR (100),
PRIMARY KEY (ID_Funcionario)
);

CREATE TABLE ATENDENTE (
ID_Funcionario INTEGER,
salario_hora INTEGER,
turno VARCHAR (15),
telefone VARCHAR(10),
FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO (ID_Funcionario) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (ID_Funcionario)
);

CREATE TABLE ENTREGADOR (
ID_Funcionario INTEGER,
FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO (ID_Funcionario) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (ID_Funcionario),
salario_entrega INTEGER,
turno VARCHAR (15),
telefone VARCHAR (10)
);

CREATE TABLE COZINHEIRO (
ID_Funcionario INTEGER,
FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO (ID_Funcionario) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (ID_Funcionario),
salario INTEGER,
nivel VARCHAR (15),
bonificacao INTEGER
);

CREATE TABLE TORTA (
ID_Torta INTEGER,
sabor VARCHAR (30),
peso INTEGER,
preco INTEGER,
ID_Pedido INTEGER,
PRIMARY KEY (ID_Torta),
FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido)
);

CREATE TABLE ITEM_DECORATIVO (
ID_ItemDecor INTEGER AUTO_INCREMENT,
preco INTEGER,
nome VARCHAR (80),
tipo VARCHAR (50),
ID_Estoque INTEGER,
ID_Torta INTEGER,
PRIMARY KEY (ID_ItemDecor),
FOREIGN KEY (ID_Estoque) REFERENCES ESTOQUE (ID_Estoque),
FOREIGN KEY (ID_Torta) REFERENCES TORTA (ID_Torta)
);

CREATE TABLE INGREDIENTE (
ID_Ingrediente INTEGER AUTO_INCREMENT,
nome VARCHAR (80),
preco INTEGER,
PRIMARY KEY (ID_Ingrediente),
ID_Estoque INTEGER,
ID_Torta INTEGER,
FOREIGN KEY (ID_Estoque) REFERENCES ESTOQUE (ID_Estoque),
FOREIGN KEY (ID_Torta) REFERENCES TORTA (ID_Torta)
);

CREATE TABLE ESTOQUE (
ID_Estoque INTEGER,
kg_ingr INTEGER,
qnt_pacoteDecor INTEGER,
PRIMARY KEY (ID_Estoque)
);

CREATE TABLE FUNCIONARIO_ORGANIZA_ESTOQUE(
ID_Estoque INTEGER,
ID_Funcionario INTEGER,
PRIMARY KEY (ID_Estoque, ID_Funcionario),
FOREIGN KEY (ID_Estoque) REFERENCES ESTOQUE (ID_Estoque),
FOREIGN KEY (ID_Funcionario) REFERENCES FUNCIONARIO (ID_Funcinario)
);
 
CREATE TABLE COZINHEIRO_FAZ_TORTA(
ID_Funcionario INTEGER,
ID_Torta INTEGER,
data_finalização DATE,
PRIMARY KEY (ID_Funcionario, ID_Torta),
FOREIGN KEY (ID_Funcionario) REFERENCES COZINHEIRO (ID_Funcionario),
FOREIGN KEY (ID_Torta) REFERENCES TORTA (ID_Torta)
);

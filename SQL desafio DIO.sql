  
Projeto 3 - Projeto Lógico de Banco de Dados 

CREATE DATABASE Ecommerce;
USE Ecommerce;

-- CLIENTE
CREATE TABLE Cliente(
	idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45),
    Endereço VARCHAR(45),
	CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
    );

DESC Cliente;

-- PRODUTO
CREATE TABLE Produto(
	idProduto INT auto_increment PRIMARY KEY,
    Categoria VARCHAR(45),
    Descrição VARCHAR(45),
	Valor FLOAT
);

DESC Produto;

-- PAGAMENTO
CREATE TABLE Pagamento(
	idPagamento INT auto_increment PRIMARY KEY,
    PagamentoCliente INT,
    Cartão VARCHAR(45),
    Bandeira VARCHAR(45),
    Número VARCHAR(45),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (PagamentoCliente) REFERENCES Cliente(idCliente)
);

DESC Pagamento;

-- ENTREGA
CREATE TABLE Entrega(
	idEntrega INT auto_increment PRIMARY KEY,
    StatusEntrega BOOL,
    CodigoRastreio VARCHAR(45),
    DataEntrega DATE
);

DESC Entrega;

-- PEDIDO
CREATE TABLE Pedido(
	idPedido INT auto_increment PRIMARY KEY,
    StatusPedido BOOL DEFAULT FALSE,
    Frete FLOAT,
    Descrição VARCHAR(45),
    CONSTRAINT fk_entrega FOREIGN KEY (idPedido) REFERENCES Entrega(idEntrega)
);

DESC Pedido;

-- ESTOQUE
CREATE TABLE Estoque(
	idEstoque INT auto_increment PRIMARY KEY,
    Local VARCHAR(45)
);

DESC Estoque;

-- PRODUTOS EM ETOQUE
CREATE TABLE EstoqueProduto(
	idProduto INT PRIMARY KEY,
    idEstoqueProduto INT,
    Quantidade FLOAT,
    CONSTRAINT fk_estoque FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_produto_estoque FOREIGN KEY (idEstoqueProduto) REFERENCES Estoque(idEstoque)
);

DESC EstoqueProduto;

-- FORNECEDOR PRINCIPAL
CREATE TABLE Fornecedor(
	idFornecedor INT auto_increment PRIMARY KEY,
    RazãoSocial VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

DESC Fornecedor;

-- FORNECEDOR TERCEIRO
CREATE TABLE Terceiro(
	idTerceiro INT auto_increment PRIMARY KEY,
	RazãoSocial VARCHAR(45),
    Localização VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

DESC Terceiro;

-- PEDIDO DE PRODUTO
CREATE TABLE PedidoProduto(
	idPedido INT,
    idProduto INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido FOREIGN KEY (idPedido) REFERENCES Terceiro(idTerceiro),
    CONSTRAINT fk_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

DESC PedidoProduto;

-- PEDIDO DE PRODUTO PARA FORNECEDOR PRINCIPAL
CREATE TABLE PedidoFornecedor(
	idCompraFornecedor INT,
    idFornecedorPedido INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido_forncedor FOREIGN KEY (idCompraFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_fornecedor_pedido FOREIGN KEY (idFornecedorPedido) REFERENCES Pedido(idPedido)
);
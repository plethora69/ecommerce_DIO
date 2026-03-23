DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- =========================
-- TABELA CLIENTE
-- =========================
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(90) NOT NULL,
    email VARCHAR(90) NOT NULL UNIQUE,
    telefone VARCHAR(30),
    tipo_cliente ENUM('PF','PJ') NOT NULL,
    data_cadastro DATE NOT NULL
);

-- =========================
-- TABELA CLIENTE_PF
-- =========================
CREATE TABLE cliente_pf (
    id_cliente INT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    CONSTRAINT fk_cliente_pf_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA CLIENTE_PJ
-- =========================
CREATE TABLE cliente_pj (
    id_cliente INT PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(120) NOT NULL,
    nome_fantasia VARCHAR(120),
    CONSTRAINT fk_cliente_pj_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA PRODUTO
-- =========================
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    categoria VARCHAR(45)
);

-- =========================
-- TABELA FORNECEDOR
-- =========================
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(120) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    contato VARCHAR(100),
    telefone VARCHAR(20)
);

-- =========================
-- TABELA VENDEDOR_TERCEIRO
-- =========================
CREATE TABLE vendedor_terceiro (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(120) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    contato VARCHAR(100),
    telefone VARCHAR(20),
    localizacao VARCHAR(45)
);

-- =========================
-- TABELA PEDIDO
-- =========================
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    descricao VARCHAR(255),
    frete DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =========================
-- TABELA ENTREGA
-- =========================
CREATE TABLE entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    transportadora VARCHAR(70),
    data_envio DATE,
    data_entrega DATE,
    status VARCHAR(45) NOT NULL,
    codigo_rastreio VARCHAR(50) UNIQUE,
    CONSTRAINT uq_entrega_id_pedido UNIQUE (id_pedido),
    CONSTRAINT fk_entrega_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA PAGAMENTO
-- =========================
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento VARCHAR(45) NOT NULL,
    valor DECIMAL(9,2) NOT NULL,
    id_pedido INT NOT NULL,
    status VARCHAR(45) NOT NULL,
    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA ITEM_PEDIDO
-- =========================
CREATE TABLE item_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    id_produto INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT uq_item_pedido UNIQUE (id_pedido, id_produto),
    CONSTRAINT fk_item_pedido_produto
        FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA PRODUTO_FORNECEDOR
-- =========================
CREATE TABLE produto_fornecedor (
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor),
    CONSTRAINT fk_produto_fornecedor_produto
        FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_produto_fornecedor_fornecedor
        FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- TABELA PRODUTO_VENDEDOR
-- =========================
CREATE TABLE produto_vendedor (
    id_produto INT NOT NULL,
    id_vendedor INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_vendedor),
    CONSTRAINT fk_produto_vendedor_produto
        FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_produto_vendedor_vendedor
        FOREIGN KEY (id_vendedor) REFERENCES vendedor_terceiro(id_vendedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
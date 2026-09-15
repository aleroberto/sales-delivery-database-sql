-- Sales and delivery database schema
-- SQL Server / T-SQL

CREATE TABLE Cliente (
    codigo INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nomeCompleto VARCHAR(255),
    endereco VARCHAR(255)
);

CREATE TABLE Pagamento (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE Entrega (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(255),
    preco DECIMAL(10,2)
);

CREATE TABLE Fornecedor (
    codFornecedor INTEGER NOT NULL PRIMARY KEY,
    nomeFornecedor VARCHAR(255)
);

CREATE TABLE Produto (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(255),
    quantidade INTEGER,
    preco DECIMAL(10,2),
    CODFORNECEDOR INTEGER NOT NULL,
    CONSTRAINT FK_Produto_Fornecedor
        FOREIGN KEY (CODFORNECEDOR)
        REFERENCES Fornecedor (codFornecedor)
);

CREATE TABLE Atendente (
    matricula INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    salario DECIMAL(10,2),
    nomeCompleto VARCHAR(255)
);

CREATE TABLE Pedido (
    codigo INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    fk_Cliente_codigo INTEGER,
    data DATE,
    fk_Pagamento_codigo INTEGER,
    fk_Entrega_codigo INTEGER,
    CONSTRAINT FK_Pedido_Cliente
        FOREIGN KEY (fk_Cliente_codigo)
        REFERENCES Cliente (codigo)
        ON DELETE CASCADE,
    CONSTRAINT FK_Pedido_Pagamento
        FOREIGN KEY (fk_Pagamento_codigo)
        REFERENCES Pagamento (codigo)
        ON DELETE CASCADE,
    CONSTRAINT FK_Pedido_Entrega
        FOREIGN KEY (fk_Entrega_codigo)
        REFERENCES Entrega (codigo)
        ON DELETE CASCADE
);

CREATE TABLE Pedido_Produto (
    fk_Produto_codigo INTEGER NOT NULL,
    fk_Pedido_codigo INTEGER NOT NULL,
    CONSTRAINT FK_PedidoProduto_Produto
        FOREIGN KEY (fk_Produto_codigo)
        REFERENCES Produto (codigo),
    CONSTRAINT FK_PedidoProduto_Pedido
        FOREIGN KEY (fk_Pedido_codigo)
        REFERENCES Pedido (codigo)
);

CREATE TABLE Atendente_Comissao (
    fk_Atendente_matricula INTEGER,
    fk_Pedido_codigo INTEGER UNIQUE,
    comissao DECIMAL(10,2),
    CONSTRAINT FK_AtendenteComissao_Atendente
        FOREIGN KEY (fk_Atendente_matricula)
        REFERENCES Atendente (matricula)
        ON DELETE CASCADE,
    CONSTRAINT FK_AtendenteComissao_Pedido
        FOREIGN KEY (fk_Pedido_codigo)
        REFERENCES Pedido (codigo)
        ON DELETE SET NULL
);

CREATE TABLE Encomenda_Fornecedor (
    fk_Atendente_matricula INTEGER,
    fk_Produto_codigo INTEGER,
    quantidade INTEGER,
    CONSTRAINT FK_EncomendaFornecedor_Atendente
        FOREIGN KEY (fk_Atendente_matricula)
        REFERENCES Atendente (matricula)
        ON DELETE SET NULL,
    CONSTRAINT FK_EncomendaFornecedor_Produto
        FOREIGN KEY (fk_Produto_codigo)
        REFERENCES Produto (codigo)
        ON DELETE SET NULL
);


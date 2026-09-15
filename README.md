# Sales & Delivery Database

Projeto de banco de dados relacional desenvolvido em **SQL Server / T-SQL**, representando uma operação de vendas e entrega.

O projeto contempla a modelagem das principais entidades do processo, criação do schema, carga de dados de exemplo e consultas para geração de relatórios operacionais.

## Objetivo

O objetivo é representar, em um banco relacional, o ciclo básico de uma operação de vendas:

**cliente → pedido → produtos → pagamento → entrega**

Além do processo de venda, o modelo contempla fornecedores, atendentes, comissões e encomendas de produtos.

O projeto demonstra conceitos fundamentais de **modelagem de dados, relacionamentos, chaves, integridade referencial, carga de dados e consultas SQL**.

## Modelo de dados

O banco possui as seguintes entidades principais:

* **Cliente** — informações dos clientes.
* **Pedido** — registro das vendas realizadas.
* **Produto** — produtos disponíveis para venda.
* **Fornecedor** — fornecedores dos produtos.
* **Atendente** — funcionários responsáveis pelo atendimento.
* **Pagamento** — formas de pagamento utilizadas nos pedidos.
* **Entrega** — modalidades e custos de entrega.
* **Pedido_Produto** — relacionamento entre pedidos e produtos.
* **Atendente_Comissao** — registro das comissões associadas aos pedidos.
* **Encomenda_Fornecedor** — registro de encomendas de produtos aos fornecedores.

### Relacionamentos principais

```text
Cliente
   │
   └──< Pedido
           │
           ├──< Pedido_Produto >── Produto >── Fornecedor
           │
           ├── Pagamento
           │
           └── Entrega

Atendente
   │
   ├──< Atendente_Comissao >── Pedido
   │
   └──< Encomenda_Fornecedor >── Produto
```

Os modelos conceitual e lógico utilizados no desenvolvimento estão disponíveis no diretório [`docs/`](docs/).

## Estrutura do projeto

```text
sales-delivery-database-sql/
│
├── README.md
│
├── docs/
│   ├── conceptual-model.brM3
│   ├── logical-model.brM3
│   └── logical-model-with-types.brM3
│
└── sql/
    ├── 01_create_schema.sql
    ├── 02_insert_data.sql
    └── 03_reports.sql
```

## Scripts SQL

### `01_create_schema.sql`

Cria a estrutura do banco de dados, incluindo:

* tabelas;
* chaves primárias;
* chaves estrangeiras;
* relacionamentos;
* restrições de integridade;
* tipos de dados.

Os campos monetários utilizam `DECIMAL(10,2)` para representar valores financeiros.

### `02_insert_data.sql`

Insere dados de exemplo nas tabelas do banco.

Os comandos utilizam listas explícitas de colunas para tornar as cargas mais claras e reduzir a dependência da ordem física das colunas.

### `03_reports.sql`

Contém consultas para diferentes visões operacionais:

* vendas por semana;
* vendas por quinzena;
* vendas mensais;
* vendas por atendente;
* pedidos por tipo de entrega;
* pedidos por forma de pagamento.

As consultas utilizam `JOIN`, `GROUP BY`, `COUNT`, filtros por período e ordenação dos resultados.

## Tecnologias

* SQL Server
* T-SQL
* Modelagem de dados relacional
* SQL
* Integridade referencial

## Como executar

O projeto pode ser executado em um ambiente compatível com **SQL Server**.

### 1. Criar o schema

Execute:

```sql
sql/01_create_schema.sql
```

### 2. Inserir os dados

Depois da criação das tabelas, execute:

```sql
sql/02_insert_data.sql
```

### 3. Executar os relatórios

Com os dados carregados, execute:

```sql
sql/03_reports.sql
```

A ordem dos scripts deve ser mantida para que as tabelas e seus relacionamentos estejam disponíveis antes da carga dos dados.

## Conceitos demonstrados

Este projeto reúne exemplos práticos de:

* modelagem relacional;
* definição de entidades e relacionamentos;
* chaves primárias e estrangeiras;
* integridade referencial;
* `CREATE TABLE`;
* `INSERT`;
* `SELECT`;
* `JOIN`;
* `GROUP BY`;
* `COUNT`;
* filtros por período;
* ordenação de resultados;
* organização de scripts SQL;
* separação entre definição do schema, carga de dados e consultas.

## Observações

Este é um projeto de estudo e portfólio voltado à prática de **SQL e modelagem de dados relacionais**.

Os dados utilizados são fictícios e não representam informações de clientes, empresas ou operações reais.

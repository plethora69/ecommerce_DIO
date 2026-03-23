# 🛒 E-commerce Database Project (SQL)

Projeto de modelagem e implementação de banco de dados relacional para um cenário de e-commerce, desenvolvido como parte de desafio prático.

---

## 📌 Objetivo

Construir um esquema lógico completo para um sistema de e-commerce, contemplando:

- Modelagem EER
- Criação do banco de dados (DDL)
- Inserção de dados (DML)
- Consultas SQL avançadas
- Aplicação de regras de negócio reais

---

## 🧠 Regras de Negócio

- Um cliente pode ser:
  - Pessoa Física (PF)
  - Pessoa Jurídica (PJ)
  - ❌ Nunca ambos

- Um pedido:
  - Pertence a um único cliente
  - Pode conter vários produtos

- Um produto:
  - Pode ser fornecido por múltiplos fornecedores
  - Pode ser vendido por múltiplos vendedores

- Um pedido pode ter:
  - Múltiplos pagamentos
  - Uma entrega associada

- Entrega contém:
  - Status
  - Código de rastreio

---

## 🧩 Modelo de Dados

O modelo foi desenvolvido utilizando MySQL Workbench (EER Diagram).

### Entidades principais:

- Cliente
- Cliente PF / PJ
- Pedido
- Produto
- ItemPedido
- Pagamento
- Entrega
- Fornecedor
- Vendedor Terceiro

### Relacionamentos importantes:

- Cliente → Pedido (1:N)
- Pedido → ItemPedido (1:N)
- Produto ↔ Fornecedor (N:N)
- Produto ↔ Vendedor (N:N)

---

## 🗂️ Estrutura do Projeto


ecommerce-DIO/
├── README.md
├── schema_ecommerce.sql
├── inserts_ecommerce.sql
├── inserts_extra_natal.sql
├── queries_ecommerce.sql
├── modelo/
│ └── ecommerce_model.mwb
└── imagens/
└── diagrama-eer.png


---

## ⚙️ Tecnologias Utilizadas

- MySQL
- MySQL Workbench
- SQL (DDL, DML, DQL)
- Git / GitHub

---

## 🛠️ Como Executar o Projeto

1. Execute o script de criação do banco:

```sql
schema_ecommerce.sql
Insira os dados iniciais:
inserts_ecommerce.sql
Insira dados adicionais (simulação de vendas sazonais):
inserts_extra_natal.sql
Execute as consultas:
queries_ecommerce.sql
📊 Exemplos de Consultas
🔹 Pedidos por cliente
SELECT 
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;
🔹 Faturamento por pedido
SELECT 
    p.id_pedido,
    SUM(ip.quantidade * ip.preco_unitario) AS total
FROM pedido p
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido;
🔹 Vendas por período (Natal)
SELECT *
FROM pedido
WHERE data_pedido BETWEEN '2024-11-30' AND '2024-12-24';
🔹 Produtos e seus fornecedores
SELECT 
    pr.nome AS produto,
    f.razao_social AS fornecedor
FROM produto pr
JOIN produto_fornecedor pf ON pr.id_produto = pf.id_produto
JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor;
📈 Cenários Simulados
Vendas de fim de ano (Black Friday / Natal)
Comparação de desempenho entre anos
Múltiplos métodos de pagamento
Relação entre fornecedores e vendedores
🎯 Aprendizados
Modelagem relacional (EER → SQL)
Normalização de dados
Implementação de relacionamentos N:N
Uso de chaves compostas
Escrita de queries complexas com JOIN, GROUP BY, HAVING
🚀 Autor

Projeto desenvolvido por Elias Bastos (plethora69) como parte de estudos em SQL e modelagem de dados.
USE ecommerce;

-- =========================
-- CLIENTE
-- =========================
INSERT INTO cliente VALUES
(1,'João Silva','joao@email.com','31999990001','PF','2024-01-10'),
(2,'Maria Souza','maria@email.com','31999990002','PF','2024-02-15'),
(3,'Tech Business Ltda','contato@techbusiness.com','3133334444','PJ','2024-03-20'),
(4,'Alpha Comercio Ltda','financeiro@alpha.com','3130304040','PJ','2024-04-05'),
(5,'Carlos Pereira','carlos@email.com','31999990005','PF','2024-05-01'),
(6,'Ana Lima','ana@email.com','31999990006','PF','2024-05-15'),
(7,'Bruno Rocha','bruno@email.com','31999990007','PF','2024-05-16'),
(8,'Delta Corp Ltda','contato@delta.com','3131313131','PJ','2024-05-17'),
(9,'Omega Solutions','financeiro@omega.com','3132323232','PJ','2024-05-18'),
(10,'Fernanda Alves','fernanda@email.com','31999990008','PF','2024-05-19');

-- =========================
-- CLIENTE PF
-- =========================
INSERT INTO cliente_pf VALUES
(1,'12345678901','1990-05-10'),
(2,'98765432100','1988-09-22'),
(5,'55544433322','1995-11-02'),
(6,'11122233344','1992-02-10'),
(7,'22233344455','1985-07-21'),
(10,'33344455566','1998-03-30');

-- =========================
-- CLIENTE PJ
-- =========================
INSERT INTO cliente_pj VALUES
(3,'11222333000144','Tech Business Ltda','Tech Business'),
(4,'99888777000155','Alpha Comercio Ltda','Alpha'),
(8,'55667788000199','Delta Corp Ltda','Delta'),
(9,'66778899000100','Omega Solutions','Omega');

-- =========================
-- FORNECEDOR
-- =========================
INSERT INTO fornecedor VALUES
(1,'Fornecedor Tech Brasil','11111111000111','tech@fornecedor.com','1130301111'),
(2,'Importadora Digital SA','22222222000122','vendas@importadora.com','1130302222'),
(3,'Alpha Comercio Ltda','99888777000155','alpha@fornecedor.com','3130304040'),
(4,'Global Tech Supply','77777777000111','global@tech.com','1130307777'),
(5,'Mega Distribuidora','88888888000122','vendas@mega.com','1130308888');

-- =========================
-- PRODUTO
-- =========================
INSERT INTO produto VALUES
(1,'Mouse Gamer','Mouse com RGB e 7 botões',120.00,50,'Periféricos'),
(2,'Teclado Mecânico','Teclado switch blue',250.00,30,'Periféricos'),
(3,'Monitor 24','Monitor Full HD 24 polegadas',899.90,20,'Monitores'),
(4,'Headset Pro','Headset com microfone',199.90,40,'Áudio'),
(5,'Notebook i5','Notebook i5 16GB RAM SSD 512GB',3500.00,10,'Informática'),
(6,'Webcam HD','Webcam Full HD USB',180.00,25,'Acessórios'),
(7,'SSD 1TB','SSD NVMe 1TB',600.00,15,'Armazenamento'),
(8,'Mouse Sem Fio','Mouse wireless',80.00,60,'Periféricos'),
(9,'Teclado Slim','Teclado fino USB',120.00,45,'Periféricos'),
(10,'Monitor 27','Monitor 27 polegadas 2K',1500.00,12,'Monitores'),
(11,'Cadeira Gamer','Cadeira ergonômica',950.00,18,'Móveis');

-- =========================
-- VENDEDOR
-- =========================
INSERT INTO vendedor_terceiro VALUES
(1,'Marketplace Eletro','33333333000133','contato@marketplace.com','1130303333','São Paulo'),
(2,'Alpha Comercio Ltda','99888777000155','vendas@alpha.com','3130304040','Campinas'),
(3,'Tech Outlet','44444444000144','suporte@techoutlet.com','3130305050','Belo Horizonte'),
(4,'Shop Online BR','99999999000133','shop@online.com','1130309999','Rio de Janeiro'),
(5,'Tech Partners','12121212000144','partners@tech.com','3130306060','Curitiba');

-- =========================
-- RELAÇÕES N:N
-- =========================
INSERT INTO produto_fornecedor VALUES
(1,1),(2,1),(6,1),(3,2),(4,2),(5,2),(1,3),
(7,4),(8,4),(11,4),(9,5),(10,5);

INSERT INTO produto_vendedor VALUES
(1,1,15),(2,1,10),(3,2,5),(4,3,8),(5,3,3),(6,1,12),
(7,4,10),(8,4,20),(9,5,15),(10,5,8),(11,4,5);

-- =========================
-- PEDIDOS
-- =========================
INSERT INTO pedido VALUES
(1,'2024-05-01','Em processamento',1,'Compra pelo site',20.00),
(2,'2024-05-03','Enviado',2,'Compra pelo app',15.00),
(3,'2024-05-05','Entregue',3,'Compra corporativa',0.00),
(4,'2024-05-10','Entregue',1,'Nova compra',25.00),
(5,'2024-05-12','Em processamento',4,'Compra empresarial',30.00),
(6,'2024-05-15','Em processamento',6,'Compra site',18.00),
(7,'2024-05-16','Enviado',7,'Compra app',22.00),
(8,'2024-05-17','Entregue',8,'Compra empresa',0.00),
(9,'2024-05-18','Em processamento',9,'Compra recorrente',35.00),
(10,'2024-05-19','Enviado',10,'Compra rápida',12.00),
(11,'2022-11-30','Entregue',1,'Black Friday',15.00),
(12,'2022-12-05','Entregue',2,'Natal',20.00),
(13,'2022-12-18','Entregue',3,'Natal',0.00),
(14,'2023-11-30','Entregue',4,'Black Friday',25.00),
(15,'2023-12-10','Entregue',5,'Natal',18.00),
(16,'2023-12-22','Entregue',1,'Natal',12.00),
(17,'2024-11-30','Enviado',2,'Black Friday',15.00),
(18,'2024-12-08','Enviado',3,'Natal',20.00),
(19,'2024-12-20','Em transporte',4,'Natal',30.00),
(20,'2025-11-30','Processando',5,'Black Friday',22.00),
(21,'2025-12-12','Processando',1,'Natal',18.00),
(22,'2025-12-23','Processando',2,'Natal',15.00);

-- =========================
-- ITEM PEDIDO
-- =========================
INSERT INTO item_pedido VALUES
(1,2,120.00,1,1),(2,1,199.90,4,1),(3,1,250.00,2,2),(4,1,899.90,3,2),
(5,2,3500.00,5,3),(6,1,120.00,1,4),(7,1,250.00,2,4),(8,3,180.00,6,5),
(9,1,600.00,7,6),(10,2,80.00,8,6),(11,1,120.00,9,7),(12,1,1500.00,10,7),
(13,1,950.00,11,8),(14,2,600.00,7,8),(15,1,80.00,8,9),(16,3,120.00,9,10),
(17,1,120.00,1,11),(18,2,250.00,2,12),(19,1,3500.00,5,13),(20,1,899.90,3,14),
(21,2,199.90,4,15),(22,1,120.00,1,16),(23,1,600.00,7,17),(24,2,80.00,8,18),
(25,1,1500.00,10,19),(26,1,950.00,11,20),(27,1,180.00,6,21),(28,3,120.00,9,22);

-- =========================
-- PAGAMENTO
-- =========================
INSERT INTO pagamento VALUES
(1,'Cartão de Crédito',200.00,1,'Aprovado'),
(2,'Voucher',239.90,1,'Aprovado'),
(3,'PIX',1164.90,2,'Aprovado'),
(4,'Boleto',7000.00,3,'Aprovado'),
(5,'Cartão de Crédito',395.00,4,'Aprovado'),
(6,'Transferência',570.00,5,'Pendente'),
(7,'Cartão',760.00,6,'Aprovado'),
(8,'PIX',1620.00,7,'Aprovado'),
(9,'Boleto',2150.00,8,'Aprovado'),
(10,'Cartão',240.00,9,'Pendente'),
(11,'PIX',360.00,10,'Aprovado'),
(12,'Voucher',100.00,6,'Aprovado'),
(13,'Cartão',120.00,11,'Aprovado'),
(14,'PIX',500.00,12,'Aprovado'),
(15,'Boleto',3500.00,13,'Aprovado'),
(16,'Cartão',899.90,14,'Aprovado'),
(17,'PIX',400.00,15,'Aprovado'),
(18,'Cartão',120.00,16,'Aprovado'),
(19,'Cartão',600.00,17,'Aprovado'),
(20,'PIX',160.00,18,'Aprovado'),
(21,'Cartão',1500.00,19,'Aprovado'),
(22,'PIX',950.00,20,'Aprovado'),
(23,'Cartão',180.00,21,'Aprovado'),
(24,'PIX',360.00,22,'Aprovado');

-- =========================
-- ENTREGA
-- =========================
INSERT INTO entrega VALUES
(1,1,'Correios','2024-05-02',NULL,'Separando pedido','BR123456789'),
(2,2,'Jadlog','2024-05-04',NULL,'Em transporte','BR987654321'),
(3,3,'Transportadora XP','2024-05-06','2024-05-08','Entregue','BR555666777'),
(4,4,'Correios','2024-05-11','2024-05-13','Entregue','BR111222333'),
(5,5,'Azul Cargo','2024-05-13',NULL,'Postado','BR444555666'),
(6,6,'Correios','2024-05-16',NULL,'Em transporte','BR777888999'),
(7,7,'Jadlog','2024-05-17',NULL,'Postado','BR111999888'),
(8,8,'Transportadora XP','2024-05-18','2024-05-20','Entregue','BR222333444'),
(9,9,'Correios','2024-05-19',NULL,'Separando pedido','BR555666111'),
(10,10,'Azul Cargo','2024-05-20',NULL,'Postado','BR999888777'),
(11,11,'Correios','2022-12-01','2022-12-05','Entregue','NATAL202211'),
(12,12,'Jadlog','2022-12-06','2022-12-10','Entregue','NATAL202212'),
(13,13,'XP','2022-12-19','2022-12-22','Entregue','NATAL202213'),
(14,14,'Correios','2023-12-01','2023-12-04','Entregue','NATAL202314'),
(15,15,'Jadlog','2023-12-11','2023-12-15','Entregue','NATAL202315'),
(16,16,'Correios','2023-12-23','2023-12-26','Entregue','NATAL202316'),
(17,17,'XP','2024-12-01',NULL,'Enviado','NATAL202417'),
(18,18,'Correios','2024-12-09',NULL,'Em transporte','NATAL202418'),
(19,19,'Azul','2024-12-21',NULL,'Em transporte','NATAL202419'),
(20,20,'Correios',NULL,NULL,'Processando','NATAL202520'),
(21,21,'XP',NULL,NULL,'Processando','NATAL202521'),
(22,22,'Jadlog',NULL,NULL,'Processando','NATAL202522');
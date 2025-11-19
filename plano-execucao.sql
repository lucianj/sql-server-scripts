SELECT * INTO NumsLinha FROM Nums; --Transporta de uma tabela a outra.

SELECT * FROM NumsLinha WHERE N = '10001';

SELECT * FROM tb_cliente WHERE cidade = 'Salvador';


drop table T_heap;
CREATE TABLE T_heap (a int NOT NULL, b int NOT NULL, c int NOT NULL, d int NOT NULL, e int NOT NULL, f int NOT NULL);

declare @contador int
declare @max int
SET @contador = 1
SET @max = 50
WHILE @contador <= @max
BEGIN
   insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),@contador)
   set @contador = @contador + 1
END

SELECT * FROM T_heap;

SELECT b, c FROM t_heap where b = 68 and c= 55;

CREATE NONCLUSTERED INDEX T_heap_a ON T_heap (a);

SELECT b FROM t_heap WHERE b = 1

SELECT a FROM t_heap WHERE a = 1

CREATE INDEX T_heap_bc ON T_heap (b, c);

SELECT b, c FROM t_heap WHERE b = 1 and c = 1;

SELECT b FROM t_heap WHERE b = 1 and c = 1;

SELECT a FROM t_heap WHERE b = 1 and c = 1;

CREATE INDEX T_heap_d ON T_heap (d) INCLUDE (e);

SELECT d, e FROM t_heap WHERE d = 1 and e = 1;

SELECT e, d FROM t_heap WHERE d = 1 and e = 1;
SELECT e FROM t_heap WHERE d = 1 and e = 1;

SELECT a FROM t_heap WHERE d = 1 and e = 1;

drop INDEX T_heap_d ON T_heap;

SELECT a FROM t_heap WHERE d = 1 and e = 1;

CREATE UNIQUE INDEX T_heap_f ON T_heap (f); 

SELECT f FROM t_heap WHERE f = 1;

SELECT a FROM t_heap WHERE f = 1;

CREATE TABLE T_clu (a int NOT NULL, b int NOT NULL, c int NOT NULL, d int NOT NULL, e int NOT NULL, f int NOT NULL); 

declare @contador int
declare @max int
SET @contador = 1
SET @max = 50
WHILE @contador <= @max
BEGIN
   insert into T_clu (a,b,c,d,e,f) values (@contador, [dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100), @contador)
   set @contador = @contador + 1
END;

CREATE UNIQUE CLUSTERED INDEX T_clu_a ON T_clu (a);

SELECT * FROM T_clu where b = 68 and c= 55;

SELECT * FROM T_clu where a = 50;

CREATE INDEX T_clu_b ON T_clu (b, c); 

SELECT e FROM T_clu where b = 50 and c = 50;

CREATE INDEX T_clu_d ON T_clu (d) INCLUDE (e);

SELECT d, e FROM T_clu where d = 2 and e = 2;

CREATE UNIQUE INDEX T_clu_f ON T_clu (f);

SELECT * FROM T_clu where f = 1;

CREATE INDEX idx_fornecedores_cidade 
ON tb_fornecedores (CIDADE) INCLUDE (NOME, CREDITO, DATA_CADASTRO);

CREATE NONCLUSTERED INDEX idx_tb_item_codigo_produto ON tb_item (codigo_produto)
INCLUDE (numero, quantidade, preco);

ALTER TABLE tb_cidade ADD CONSTRAINT pk_tb_cidade PRIMARY KEY (cidade);
ALTER TABLE tb_classificacao ADD CONSTRAINT pk_tb_classificacao PRIMARY KEY (codigo_classificacao);
ALTER TABLE tb_cliente ADD CONSTRAINT pk_tb_cliente PRIMARY KEY (cpf);
ALTER TABLE tb_estado ADD CONSTRAINT pk_tb_estado PRIMARY KEY (sigla_estado);
ALTER TABLE tb_loja ADD CONSTRAINT pk_tb_loja PRIMARY KEY (codigo_loja);
ALTER TABLE tb_produto ADD CONSTRAINT pk_tb_produto PRIMARY KEY (codigo_produto);

ALTER TABLE tb_nota ADD CONSTRAINT pk_tb_nota PRIMARY KEY (numero);
ALTER TABLE tb_item ADD CONSTRAINT pk_tb_item PRIMARY KEY (numero, codigo_produto);

ALTER TABLE [dbo].[tb_cidade] ADD CONSTRAINT [fk_tb_cidade_sigla_estado] FOREIGN KEY([sigla_estado])
REFERENCES [dbo].[tb_estado] ([sigla_estado])

ALTER TABLE [dbo].[tb_cliente] ADD CONSTRAINT [fk_tb_cliente_cidade] FOREIGN KEY([cidade])
REFERENCES [dbo].[tb_cidade] ([cidade])

ALTER TABLE [dbo].[tb_item] ADD CONSTRAINT [fk_tb_item_codigo_produto] FOREIGN KEY([codigo_produto])
REFERENCES [dbo].[tb_produto] ([codigo_produto])

ALTER TABLE [dbo].[tb_item] ADD CONSTRAINT [fk_tb_item_numero] FOREIGN KEY([numero])
REFERENCES [dbo].[tb_nota] ([numero])

ALTER TABLE [dbo].[tb_loja] ADD CONSTRAINT [fk_tb_loja_cidade] FOREIGN KEY([cidade])
REFERENCES [dbo].[tb_cidade] ([cidade])

ALTER TABLE [dbo].[tb_nota] ADD CONSTRAINT [fk_tb_nota_cliente] FOREIGN KEY([cpf])
REFERENCES [dbo].[tb_cliente] ([cpf])

ALTER TABLE [dbo].[tb_nota] ADD CONSTRAINT [fk_tb_nota_loja] FOREIGN KEY([codigo_loja])
REFERENCES [dbo].[tb_loja] ([codigo_loja])

ALTER TABLE [dbo].[tb_produto] ADD CONSTRAINT [fk_tb_produto_codigo_classificacao] FOREIGN KEY([codigo_classificacao])
REFERENCES [dbo].[tb_classificacao] ([codigo_classificacao])
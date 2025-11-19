USE [DB_VENDAS];

-- IF OBJECT_ID(' dbo.Nums2', 'U') IS NOT NULL DROP TABLE dbo.Nums2; 
CREATE TABLE dbo.Nums2( n float );

DECLARE @max AS INT, @rc AS INT; 
 SET @max = 3600; 
 SET @rc = 1; 
 WHILE @rc < = @max 
 BEGIN 
 DECLARE @X AS FLOAt
 SELECT @X = SUM(QUANTIDADE) FROM [dbo].[tb_item]
 INSERT INTO dbo.Nums2 (n) values (@X);
 SET @rc = @rc + 1;
 WAITFOR DELAY '00:00:01';  
 END

USE DB_VENDAS
ALTER DATABASE DB_VENDAS SET RECOVERY SIMPLE
DBCC SHRINKDATABASE ('DB_VENDAS', NOTRUNCATE)
DBCC SHRINKDATABASE ('DB_VENDAS', TRUNCATEONLY)
ALTER DATABASE DB_VENDAS SET RECOVERY FULL


SELECT dbo.tb_estado.nome_estado AS ESTADO, dbo.tb_produto.produto AS PRODUTO, YEAR([data]) AS ANO, 
         SUM(CONVERT(FLOAT, (dbo.tb_item.quantidade))) as QUANTIDADE
FROM dbo.tb_item INNER JOIN
         dbo.tb_produto ON dbo.tb_item.codigo_produto = dbo.tb_produto.codigo_produto INNER JOIN 
         dbo.tb_nota ON dbo.tb_item numero = dbo.tb_nota.numero CROSS JOIN 
         dbo.tb_cliente INNER JOIN
         dbo.tb_cidade ON dbo.tb_cliente.cidade = dbo.tb_cidade.cidade INNER JOIN 
         dbo.tb_estado ON dbo.tb_cidade.sigla_estado = dbo.tb_estado.sigla_estado 
         WHERE dbo.tb_produto.codigo_produto = 2 AND dbo.tb_estado.sigla estado = 'RJ'
         AND YEAR([data]) = 2020
         GROUP BY
         dbo.tb_estado.nome_estado, dbo.tb_produto.produto, YEAR ([data])
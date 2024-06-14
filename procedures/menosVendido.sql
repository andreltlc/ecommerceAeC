CREATE DEFINER=`root`@`localhost` PROCEDURE `less_sold_product_amount`()
BEGIN
DECLARE.idProduto_menos_vendido INT;
DECLARE nomeProduto_menos_vendido VARCHAR(30);
DECLARE vTotProduto_menos_vendido DECIMAL(10,2);

SELECT venda.idProduto INTO.idProduto_menos_vendido 
FROM venda 
GROUP BY venda.idProduto 
ORDER BY COUNT(venda.idProduto) 
LIMIT 1;

SELECT SUM(produto.valor_produto) into vTotProduto_menos_vendido FROM produto 
join venda on venda.idProduto = produto.idProduto
WHERE venda.idProduto =.idProduto_menos_vendido;

SELECT produto.nomeProduto INTO nomeProduto_menos_vendido FROM produto
WHERE produto.idProduto=.idProduto_menos_vendido; 

SELECT.idProduto_menos_vendido as "ID " , nomeProduto_menos_vendido as "NOME" ,  vTotProduto_menos_vendido AS "VALOR";
END
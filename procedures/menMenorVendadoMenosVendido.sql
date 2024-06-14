CREATE DEFINER=`root`@`localhost` PROCEDURE `month_min_sales_less_sold_product`()
BEGIN
DECLARE idProduto_menos_vendido INT;
DECLARE qntProduto_menos_vendido INT;
DECLARE mesMenor_venda int;
DECLARE nomeProduto_menos_vendido VARCHAR(30);

SELECT venda.idProduto INTO idProduto_menos_vendido 
FROM venda 
GROUP BY venda.idProduto 
ORDER BY COUNT(venda.idProduto) 
LIMIT 1;

SELECT month(venda.data_venda) into mesMenor_venda FROM venda
WHERE venda.idProduto = idProduto_menos_vendido
GROUP BY MONTH(VENDA.DATA_VENDA)
ORDER BY COUNT(*) ASC
LIMIT 1;

SELECT produto.nomeProduto into nomeProduto_menos_vendido FROM produto
WHERE produto.idProduto = idProduto_menos_vendido;

SELECT COUNT(idProduto) into qntProduto_menos_vendido FROM venda
WHERE venda.idProduto = idProduto_menos_vendido
AND month(venda.data_venda) = mesMenor_venda;

SELECT idProduto_menos_vendido, qntProduto_menos_vendido, mesMenor_venda, nomeProduto_menos_vendido;
END
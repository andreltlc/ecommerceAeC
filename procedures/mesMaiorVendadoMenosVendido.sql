CREATE DEFINER=`root`@`localhost` PROCEDURE `month_max_sales_less_sold_product`()
BEGIN

DECLARE idProduto_menos_vendido INT;
DECLARE quantidade_produto_menos_vendido INT;
DECLARE mes_maior_venda int;
DECLARE nome_produto_menos_vendido VARCHAR(30);

SELECT venda.idProduto INTO idProduto_menos_vendido 
FROM venda 
GROUP BY venda.idProduto 
ORDER BY COUNT(venda.idProduto) 
LIMIT 1;

SELECT month(venda.dataVenda) into mes_maior_venda FROM venda
WHERE venda.idProduto = idProduto_menos_vendido
GROUP BY MONTH(VENDA.DATAVenda)
ORDER BY COUNT(*) DESC 
LIMIT 1;

SELECT produto.nome_produto into nome_produto_menos_vendido FROM produto
WHERE produto.idProduto = idProduto_menos_vendido;

SELECT COUNT(idProduto) into quantidade_produto_menos_vendido FROM venda
WHERE venda.idProduto = idProduto_menos_vendido
AND month(venda.dataVenda) = mes_maior_venda;

SELECT idProduto_menos_vendido, quantidade_produto_menos_vendido, mes_maior_venda, nome_produto_menos_vendido;

END
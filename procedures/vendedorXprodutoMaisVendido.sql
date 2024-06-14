CREATE DEFINER=`root`@`localhost` PROCEDURE `vendedorXprodutoMaisVendido`()
BEGIN
SELECT 
    funcionario.id,
    funcionario.nome,
    produto.nome,
    COUNT(*) AS qnt_vendida
FROM venda 
JOIN funcionario  ON venda.idVendor = funcionario.idFuncionario
JOIN produto  ON venda.idProduto = produto.idProduto
WHERE venda.idProduto = (
SELECT idProduto
FROM (SELECT idProduto, COUNT(*) AS qnt_vendas
FROM venda GROUP BY idProduto
ORDER BY qnt_vendas DESC
LIMIT 1
) AS sub_q
)
GROUP BY funcionario.idFuncionario,
funcionario.nomeFuncionario,
produto.nomeProduto;
END
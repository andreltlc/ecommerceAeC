CREATE DEFINER=`root`@`localhost` PROCEDURE `Vender`(
    IN idVendedor INT,
    IN idCliente INT,
    IN idProduto INT
)
BEGIN
    DECLARE idVenda INT;
    
    -- Decrementar a quantidade do produto em 1
    UPDATE produto
    SET qntProduto = qntProduto - 1
    WHERE idProduto = idProduto;

    -- Inserir os detalhes da venda na tabela de vendas
    INSERT INTO venda (dataVenda, idVendedor, idCliente, idProduto)
    VALUES (NOW(), idVendedor, idCliente, idProduto);

    -- Obter o ID da venda inserida
    SET idVenda = LAST_INSERT_ID();

    -- Retornar o ID da venda
    SELECT idVenda AS idVenda;
END
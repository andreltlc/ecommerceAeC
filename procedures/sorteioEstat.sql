DELIMITER //

CREATE PROCEDURE SorteioCliente()
BEGIN
    DECLARE idCliente INT;
    DECLARE Voucher DECIMAL(10,2);
    DECLARE clienteEspecialCount INT;
    DECLARE clienteNome VARCHAR(100); -- Variável para armazenar o nome do cliente
    
    -- Seleciona aleatoriamente um id de cliente
    SET idCliente = (SELECT idCliente FROM cliente ORDER BY RAND() LIMIT 1);
    
    -- Verifica se o cliente selecionado é um cliente especial
    SET clienteEspecialCount = (SELECT COUNT(*) FROM clienteEspecial WHERE idCliente = idCliente);
    
    IF clienteEspecialCount > 0 THEN
        -- Cliente especial
        SET Voucher = 200.00;
        SELECT nomeClienteEspecial INTO clienteNome FROM clienteEspecial WHERE idCliente = idCliente;
    ELSE
        -- Cliente normal
        SET Voucher = 100.00;
        SELECT nomeCliente INTO clienteNome FROM cliente WHERE idCliente = idCliente;
    END IF;
    
    -- Retorna o nome do cliente sorteado e o valor do voucher
    SELECT clienteNome AS NomeCliente, Voucher AS ValorVoucher;
    
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EstatisticasVendas()
BEGIN
    DECLARE ProdutoMaisVendido INT;
    DECLARE ProdutoMenosVendido INT;

    -- Produto mais vendido
    SELECT idProduto, SUM(Qnt) AS TotVendido
    INTO ProdutoMaisVendido
    FROM Venda
    GROUP BY idProduto
    ORDER BY TotVendido DESC
    LIMIT 1;

    -- Produto menos vendido
    SELECT idProduto, SUM(Qnt) AS TotVendido
    INTO ProdutoMenosVendido
    FROM Venda
    GROUP BY idProduto
    ORDER BY TotVendido ASC
    LIMIT 1;

    -- Produto mais vendido
    SELECT p.nomeProduto, SUM(v.Qnt) AS TotVendido, f.nomeFuncionario AS Vendedor
    FROM Venda v
    JOIN Produto p ON v.idProduto = p.idProduto
    JOIN Funcionario f ON v.idVendedor = f.idFuncionario
    WHERE v.idProduto = ProdutoMaisVendido
    GROUP BY p.nomeProduto, f.nomeFuncionario;

    -- Produto menos vendido
    SELECT p.nomeProduto, SUM(v.Qnt) AS TotVendido, f.nomeFuncionario AS Vendedor
    FROM Venda v
    JOIN Produto p ON v.idProduto = p.idProduto
    JOIN Funcionario f ON v.idVendedor = f.id_funcionario
    WHERE v.idProduto = ProdutoMenosVendido
    GROUP BY p.nomeProduto, f.nomeFuncionario;

    -- Valor ganho com o produto mais vendido
    SELECT p.nomeProduto, SUM(v.ValorTot) AS ValorGanho
    FROM Venda v
    JOIN Produto p ON v.idProduto = p.idProduto
    WHERE v.idProduto = ProdutoMaisVendido
    GROUP BY p.nomeProduto;

    -- Valor ganho com o produto menos vendido
    SELECT p.nomeProduto, SUM(v.ValorTotal) AS ValorGanho
    FROM Venda v
    JOIN Produto p ON v.idProduto = p.idProduto
    WHERE v.idProduto = ProdutoMenosVendido
    GROUP BY p.nomeProduto;

    -- Mês de maior venda do produto mais vendido
    SELECT MONTH(v.dataVenda) AS Mes, SUM(v.Qnt) AS TotVendido
    FROM Venda v
    WHERE v.idProduto = ProdutoMaisVendido
    GROUP BY MONTH(v.dataVenda)
    ORDER BY TotVendido DESC
    LIMIT 1;

    -- Mês de menor venda do produto mais vendido
    SELECT MONTH(v.dataVenda) AS Mes, SUM(v.Qnt) AS TotVendido
    FROM Venda v
    WHERE v.idProduto = ProdutoMaisVendido
    GROUP BY MONTH(v.dataVenda)
    ORDER BY TotVendido ASC
    LIMIT 1;

    -- Mês de maior venda do produto menos vendido
    SELECT MONTH(v.dataVenda) AS Mes, SUM(v.Qnt) AS TotVendido
    FROM Venda v
    WHERE v.idProduto = ProdutoMenosVendido
    GROUP BY MONTH(v.dataVenda)
    ORDER BY TotVendido DESC
    LIMIT 1;

    -- Mês de menor venda do produto menos vendido
    SELECT MONTH(v.dataVenda) AS Mes, SUM(v.Qnt) AS TotVendido
    FROM Venda v
    WHERE v.idProduto = ProdutoMenosVendido
    GROUP BY MONTH(v.dataVenda)
    ORDER BY TotVendido ASC
    LIMIT 1;
END;

//

DELIMITER ;



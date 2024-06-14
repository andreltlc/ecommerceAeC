CREATE DEFINER=`root`@`localhost` TRIGGER `venda_AFTER_INSERT` AFTER INSERT ON `venda` FOR EACH ROW BEGIN

    DECLARE TotVenda DECIMAL(10,2);
    DECLARE Bonus DECIMAL(10,2);
	DECLARE Msg VARCHAR(50);
    
    SELECT SUM(ValorTot)
    INTO TotVenda
    FROM Venda
    WHERE idVendor = NEW.idVendor;
        IF TotVenda > 1000.00 THEN
        SET Bonus = TotVenda * 0.05;
        INSERT INTO FuncionarioEspecial (idFuncESP, aumento)
        VALUES (NEW.idVendor, Bonus)
        ON DUPLICATE KEY UPDATE aumento = aumento + Bonus;
        SET Mensagem = CONCAT('Total de bônus: ', Bonus);
        INSERT INTO LogMensagens (mensagem) VALUES (Mensagem);
	
    END IF;

END
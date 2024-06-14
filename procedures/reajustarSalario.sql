CREATE DEFINER=`root`@`localhost` PROCEDURE `reajustarSalario`(porcentagem DECIMAL(5,2), categoria VARCHAR(20))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE id INT;
DECLARE c_funcionario CURSOR FOR SELECT idFuncionario FROM funcionario WHERE cargoFuncionario = categoria;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN c_funcionario;

ciclo_funcionario: LOOP
	FETCH c_funcionario INTO id;
	
	IF done THEN
		LEAVE ciclo_funcionario;
	END IF;
    
    UPDATE funcionario 
    SET salario_funcionario = salario_funcionario + (salario_funcionario * porcentagem / 100) 
    WHERE idFuncionario= id;
END LOOP;
CLOSE c_funcionario;
END
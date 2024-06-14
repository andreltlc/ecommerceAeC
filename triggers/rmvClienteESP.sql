CREATE DEFINER=`root`@`localhost` TRIGGER `cashbackBE4_UP` BEFORE UPDATE ON `clienteEspecial` FOR EACH ROW BEGIN
IF NEW.cashback = 0 THEN
	DELETE FROM clienteEspecial WHERE idClienteEspecial = NEW.idClienteEspecial;
	END IF; 
END
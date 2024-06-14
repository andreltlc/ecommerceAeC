-- Users
CREATE USER 'ceo'@'localhost' IDENTIFIED BY '@ceo1234';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY '@gerente1234';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '@func1234';

-- Permissions
GRANT ALL PRIVILEGES ON *.* TO 'ceo'@'localhost' WITH GRANT OPTION;
GRANT SELECT, DELETE, UPDATE ON ecommerceaec.* TO 'gerente'@'localhost';
GRANT INSERT, SELECT ON ecommerceaec.* TO 'funcionario'@'localhost';
FLUSH PRIVILEGES;

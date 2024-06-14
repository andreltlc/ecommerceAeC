CREATE DATABASE ecommerceAeC;

USE ecommerceAeC;

-- Users
CREATE USER 'ceo'@'localhost' IDENTIFIED BY '@ceo1234';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY '@gerente1234';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '@func1234';

-- Permissions
GRANT ALL PRIVILEGES ON *.* TO 'ceo'@'localhost' WITH GRANT OPTION;
GRANT SELECT, DELETE, UPDATE ON ecommerceAeC.* TO 'gerente'@'localhost';
GRANT INSERT, SELECT ON ecommerceAeC.* TO 'funcionario'@'localhost';
FLUSH PRIVILEGES;



-- tabelas
CREATE TABLE IF NOT EXISTS cliente(
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nomeCliente VARCHAR(50) NOT NULL,
sexoCliente CHAR(1) NOT NULL check(sexo='m' OR sexo'f' OR sexo='o') ,
idadeCliente tinyint NOT NULL,
dataNCliente DATE NOT NULL);

CREATE TABLE IF NOT EXISTS clienteEspecial(
idClienteEspecial INT AUTO_INCREMENT PRIMARY KEY,
nomeClienteEspecial VARCHAR(50) NOT NULL,
sexoClienteEspecial CHAR(1) NOT NULL check(sexo='m' OR sexo='f' OR sexo='o') ,
idadeClienteEspecial tinyint NOT NULL,
idCliente INT,
FOREIGN KEY (id) REFERENCES cliente(id),
cashback DECIMAL(10,2));

CREATE TABLE IF NOT EXISTS funcionario(
idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
nomeFuncionario VARCHAR(50) NOT NULL,
idadeFuncionario TINYINT NOT NULL,
sexoFuncionario CHAR(1) NOT NULL check(sexo ='m' OR sexo ='f' OR sexo ='o') ,
cargoFuncionario VARCHAR(15) CHECK(cargo='gerente' OR cargo ='vendedor' OR cargo = 'ceo'),
salarioFuncionario DECIMAL(10,2),
dataNFuncionario DATE NOT NULL);

CREATE TABLE IF NOT EXISTS produto(
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto VARCHAR(25) NOT NULL,
quantidadeProduto INT,
descricaoProduto VARCHAR(100),
valorProduto DECIMAL(10,2));

CREATE TABLE IF NOT EXISTS venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    dataVenda DATE NOT NULL,
    idVendor INT,
    idCliente INT,
    idProduto INT NOT NULL,
    FOREIGN KEY (idVendor) REFERENCES funcionario(idFuncionario),
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

INSERT INTO funcionario (nomeFuncionario, idadeFuncionario, sexoFuncionario, cargoFuncionario, salarioFuncionario, dataNFuncionario) VALUES 
('João', 30, 'm', 'vendedor', 3000.00, '1990-08-13'),
('José', 40, 'o', 'gerente', 5000.00, '1980-06-30'),
('Maria', 50, 'f', 'ceo', 10000.00, '1970-02-28');


INSERT INTO produto (nomeProduto, quantidadeProduto, descricaoProduto, valorProduto) VALUES
('Produto A', 100, 'Descrição A', 10.00),
('Produto B', 10, 'Descrição B', 10.00),
('Produto C', 10, 'Descrição C', 50.00),
('Produto D', 30, 'Descrição D', 1000.00),
('Produto E', 100, 'Descrição E', 1050.00),
('Produto F', 10, 'Descrição F', 100.00),
('Produto G', 100, 'Descrição G', 120.00),
('Produto H', 30, 'Descrição H', 190.00),
('Produto I', 20, 'Descrição I', 180.00),
('Produto J', 100, 'Descrição J', 20.00),
('Produto K', 50, 'Descrição K', 90.00),
('Produto L', 10, 'Descrição L', 30.00),
('Produto M', 70, 'Descrição M', 40.00),
('Produto N ', 100, 'Descrição N', 90.00),
('Produto O', 80, 'Descrição O', 250.00),
('Produto P', 60, 'Descrição P', 550.00),
('Produto Q', 10, 'Descrição Q', 1015.00),
('Produto R', 30, 'Descrição R', 1051.00),
('Produto S', 100, 'Descrição S', 1497.00),
('Produto T', 10, 'Descrição T', 3000.00);

INSERT INTO cliente (nomeCliente, sexoCliente, idadeCliente, dataNCliente) VALUES
('Ana', 'f', 20, '2000-01-01'),
('Carlos', 'm', 25, '1995-01-01'),
('Mariana', 'f', 30, '1990-01-01'),
('Pedro', 'm', 35, '1985-01-01'),
('Isabela', 'f', 40, '1980-01-01'),
('Ricardo', 'm', 45, '1975-01-01'),
('Juliana', 'f', 50, '1970-01-01'),
('Fernando', 'm', 55, '1965-01-01'),
('Gabriela', 'f', 60, '1960-01-01'),
('Antonio', 'm', 65, '1955-01-01'),
('Cristina', 'f', 70, '1950-01-01'),
('Paulo', 'm', 75, '1945-01-01'),
('Sofia', 'f', 80, '1940-01-01'),
('Eduardo', 'm', 85, '1935-01-01'),
('Camila', 'f', 90, '1930-01-01'),
('Lucas', 'm', 95, '1925-01-01'),
('Vitória', 'f', 18, '2006-01-01'),
('Rafael', 'm', 22, '2002-01-01'),
('Larissa', 'f', 28, '1996-01-01'),
('Guilherme', 'm', 32, '1992-01-01'),
('Amanda', 'f', 38, '1986-01-01'),
('Rodrigo', 'm', 42, '1982-01-01'),
('Patrícia', 'f', 48, '1976-01-01'),
('Fábio', 'm', 52, '1972-01-01'),
('Tatiana', 'f', 58, '1966-01-01'),
('Marcelo', 'm', 62, '1962-01-01'),
('Vanessa', 'f', 68, '1956-01-01'),
('Leonardo', 'm', 72, '1952-01-01'),
('Carla', 'f', 78, '1946-01-01'),
('Roberto', 'm', 82, '1942-01-01'),
('Mariana', 'f', 88, '1936-01-01'),
('Ricardo', 'm', 92, '1932-01-01'),
('Juliana', 'f', 98, '1926-01-01'),
('Fernando', 'm', 18, '2002-01-01'),
('Gabriela', 'f', 22, '1998-01-01'),
('Antonio', 'm', 28, '1992-01-01'),
('Cristina', 'f', 32, '1988-01-01'),
('Paulo', 'm', 38, '1982-01-01'),
('Sofia', 'f', 42, '1978-01-01'),
('Eduardo', 'm', 48, '1972-01-01'),
('Camila', 'f', 52, '1968-01-01'),
('Lucas', 'm', 58, '1962-01-01'),
('Vitória', 'f', 62, '1958-01-01'),
('Rafael', 'm', 68, '1952-01-01'),
('Larissa', 'f', 72, '1948-01-01'),
('Guilherme', 'm', 78, '1942-01-01'),
('Amanda', 'f', 82, '1938-01-01'),
('Rodrigo', 'm', 88, '1932-01-01'),
('Patrícia', 'f', 92, '1928-01-01'),
('Fábio', 'm', 98, '1922-01-01'),
('Tatiana', 'f', 18, '2002-01-01'),
('Marcelo', 'm', 22, '1998-01-01'),
('Vanessa', 'f', 28, '1992-01-01'),
('Leonardo', 'm', 32, '1988-01-01'),
('Carla', 'f', 38, '1982-01-01'),
('Roberto', 'm', 42, '1978-01-01'),
('Mariana', 'f', 48, '1972-01-01'),
('Ricardo', 'm', 52, '1968-01-01'),
('Juliana', 'f', 58, '1962-01-01'),
('Fernando', 'm', 62, '1958-01-01'),
('Gabriela', 'f', 68, '1952-01-01'),
('Antonio', 'm', 72, '1948-01-01'),
('Cristina', 'f', 78, '1942-01-01'),
('Paulo', 'm', 82, '1938-01-01'),
('Sofia', 'f', 88, '1932-01-01'),
('Eduardo', 'm', 92, '1928-01-01'),
('Camila', 'f', 98, '1922-01-01'),
('Lucas', 'm', 18, '2002-01-01'),
('Vitória', 'f', 22, '1998-01-01'),
('Rafael', 'm', 28, '1992-01-01'),
('Larissa', 'f', 32, '1988-01-01'),
('Guilherme', 'm', 38, '1982-01-01'),
('Amanda', 'f', 42, '1978-01-01'),
('Rodrigo', 'm', 48, '1972-01-01'),
('Patrícia', 'f', 52, '1968-01-01'),
('Fábio', 'm', 58, '1962-01-01'),
('Tatiana', 'f', 62, '1958-01-01'),
('Marcelo', 'm', 68, '1952-01-01'),
('Vanessa', 'f', 72, '1948-01-01'),
('Leonardo', 'm', 78, '1942-01-01'),
('Carla', 'f', 82, '1938-01-01'),
('Roberto', 'm', 88, '1932-01-01'),
('Mariana', 'f', 92, '1928-01-01'),
('Ricardo', 'm', 98, '1922-01-01'),
('Juliana', 'f', 18, '2002-01-01'),
('Fernando', 'm', 22, '1998-01-01'),
('Gabriela', 'f', 28, '1992-01-01'),
('Antonio', 'm', 32, '1988-01-01'),
('Cristina', 'f', 38, '1982-01-01'),
('Paulo', 'm', 42, '1978-01-01'),
('Sofia', 'f', 48, '1972-01-01'),
('Eduardo', 'm', 52, '1968-01-01'),
('Camila', 'f', 58, '1962-01-01'),
('Lucas', 'm', 62, '1958-01-01'),
('Vitória', 'f', 68, '1952-01-01'),
('Rafael', 'm', 72, '1948-01-01'),
('Larissa', 'f', 78, '1942-01-01'),
('Guilherme', 'm', 82, '1938-01-01'),
('Amanda', 'f', 88, '1932-01-01'),
('Rodrigo', 'm', 92, '1928-01-01'),

INSERT INTO clienteEspecial (nomeClienteEspecial, sexoClienteEspecial, idadeClienteEspecial,cashback)
VALUES
('Larissa', 'f', 78, '1942-01-01',58),
('Guilherme', 'm', 82, '1938-01-01',159),
('Amanda', 'f', 88, '1932-01-01',556),
('Rodrigo', 'm', 92, '1928-01-01',258);



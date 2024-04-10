CREATE DATABASE empresax

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    cpf VARCHAR(11) NOT NULL
);

CREATE TABLE Certidao (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	data_emissao DATE,
	validade DATE,
	codigo_validacao INT
)

CREATE TABLE Imovel (
id SERIAL PRIMARY KEY,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
endereco VARCHAR(50) NOT NULL,
contrato_ativo BOOL
)

CREATE TABLE Debito (
id SERIAL PRIMARY KEY,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
valor INT,
data_vencimento DATE
)

INSERT INTO cliente (nome, cpf) VALUES ('Pedro', '12345678')

-- Selecionando todos os clientes:
select * from cliente;
-- Selecionando todas as certidões emitidas:
select * from Certidao;
-- Obtendo os débitos pendentes de um cliente específico:
select * from Debito WHERE cliente_id = 1;
-- Obtendo os imóveis de um cliente com contrato ativo:
select * from Imovel wHERE cliente_id = 1 AND contrato_ativo = TRUE;
-- Obtendo certidões emitidas por um cliente em um intervalo de datas:
select * from Certidao WHERE cliente_id = 1 AND data_emissao BETWEEN 'data_inicial' AND 'data_final';
-- Obtendo o valor total dos débitos de um cliente:
select SUM(valor) AS total_debitos FROM Debito WHERE cliente_id = 1;
-- Obtendo as certidões emitidas com código de validação e data de validade:
SELECT id, codigo_validacao, validade FROM Certidao;
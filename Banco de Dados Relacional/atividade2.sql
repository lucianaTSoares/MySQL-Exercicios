-- CRIAÇÃO DO DB
CREATE DATABASE db_ecommerce;


-- CRIAÇÃO DA TABELA PRODUTOS
USE db_ecommerce;
CREATE TABLE tb_produtos(
	id INT(4) AUTO_INCREMENT,
    	produto VARCHAR(30) NOT NULL,
    	preco DECIMAL (7,2) NOT NULL,
	descricao VARCHAR(400),
    	marca VARCHAR(30) NOT NULL,
    	em_estoque BOOLEAN NOT NULL,
    
	PRIMARY KEY(id));


-- POPULAÇÃO DA TABELA COM DADOS
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("Teclado mecânico", 499.99, "Redragon", "descicao1", true);
    
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("Headset", 899.99, "Logitech", "descicao2", true);
    
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("Monitor", 1900.99, "Samsung", "descicao3", true);
    
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("SSD", 299.99, "Kingston", "descicao4", true);
    
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("TV", 4299.99, "LG", "descicao5", true);
    
INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("Sony PlayStation 5", 6299.99, "Sony", "descicao6", true);

INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("Smartphone", 1169.99, "Xiaomi", "descicao7", true);

INSERT INTO tb_produtos(produto, preco, marca, descricao, em_estoque)
	VALUE ("iPad", 2700.99, "Apple", "descicao8", true);


-- BUSCA OS PRODUTOS QUE TEM PRECO MAIOR QUE 500
SELECT * FROM tb_produtos WHERE preco > 500;


-- BUSCA OS PRODUTOS QUE TEM PRECO MENOR QUE 500
SELECT * FROM tb_produtos WHERE preco < 500;


-- ATUALIZAÇÃO DE UM DADO DE UM PRODUTO
UPDATE tb_produtos SET descricao = "Tablet de cor Azul de 64gb" WHERE id = 8;


-- OUTROS COMANDOS UTILIZADOS DURANTE O EXERCÍCIO
SELECT * FROM tb_produtos;
ALTER TABLE tb_produtos DROP descricao; -- PERMITE ALTERAÇÃO DA TABELA, NO CASO EXCLUI A COLUNA "DESCRICAO"
ALTER TABLE tb_produtos ADD descricao VARCHAR(255) NOT NULL; -- ADICIONA A COLUNA "DESCRICAO" 
DELETE FROM tb_produtos;
DROP TABLE tb_produtos;
DROP DATABASE db_ecommerce;

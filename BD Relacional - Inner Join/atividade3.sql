-- CRIAÇÃO DATABASE
CREATE DATABASE db_farmacia_do_bem;


-- CRIAÇÃO TABELA CATEGORIA
USE db_farmacia_do_bem;
CREATE TABLE tb_categoria(
	id_categ INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo_produto VARCHAR(50) NOT NULL,
    setor VARCHAR(35) NOT NULL);

-- POPULAÇÃO TABELA CATEGORIA
INSERT INTO tb_categoria(tipo_produto, setor)
	VALUE ("Vitaminas", "Saúde"),
            ("Esmaltes", "Cosméticos"),
            ("Cereais", "Alimentos"),
            ("Antigrpais", "Medicamentos"),
            ("Antinflamatórios", "Medicamentos");
    
    
-- CRIAÇÃO TABELA PRODUTO
CREATE TABLE tb_produto(
	id_produto INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_categ INT(4) NOT NULL,
    produto VARCHAR(50) NOT NULL,
    quantidade INT(4) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    
    FOREIGN KEY(fk_categ) REFERENCES tb_categoria(id_categ));

-- POPULAÇÃO TABELA PRODUTO 
INSERT INTO tb_produto(fk_categ, produto, quantidade, preco)
	VALUE (1, "Vitamina B12", 40, 51.90),
			(4, "Cimegripe", 100, 8.90),
            (5, "Buscofem", 83, 20.00),
            (3, "Nutry Chocolate", 60, 10.90),
            (2, "Risqué", 110, 1.90),
            (3, "Granola Integral", 30, 9.90),
            (4, "Resfrenol", 100, 16.99);


-- SELECT QUE RETORNA PRODUTOS COM VALOR ACIMA DE 50 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco > 50;


-- SELECT QUE RETORNA PRODUTOS COM VALOR ENTRE 3 E 60 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco BETWEEN 3 AND 60;


-- SELECT QUE RETORNA PRODUTOS QUE POSSUEM A LETRA "B" NO NOME 
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE produto LIKE "%B%";
    
    
-- SELECT COM INNER JOIN ENTRE AS TABELAS   
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ;


-- SELECT COM RETORNO DE PRODUTOS DO SETOR "MEDICAMENTOS"
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE setor IN ("Medicamentos");


-- SOMA DA QUANTIDADE DOS PRODUTOS EM CADA SETOR
SELECT setor, SUM(tb_produto.quantidade) AS soma_produtos 
	FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ 
    GROUP BY setor;


-- OUTROS COMANDOS UTILIZADOS DURANTE A ATIVIDADE
SELECT * FROM tb_categoria;
SELECT * FROM tb_produto;
UPDATE tb_categoria SET tipo_produto = "Anti-Inflamatórios" WHERE id_categ = 5;
ALTER TABLE tb_produto MODIFY COLUMN preco DECIMAL(5,2) NOT NULL;
UPDATE tb_produto SET preco = 1.90 WHERE id_produto = 5;
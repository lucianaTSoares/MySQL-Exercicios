-- CRIAÇÃO DATABASE
CREATE DATABASE db_cidade_das_frutas;


-- CRIAÇÃO TABELA CATEGORIA
USE db_cidade_das_frutas;
CREATE TABLE tb_categoria(
	id_categ INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	classificacao VARCHAR(50) NOT NULL,
    tipo_fruta VARCHAR(50) NOT NULL);

-- POPULAÇÃO TABELA CATEGORIA
INSERT INTO tb_categoria(tipo_fruta, classificacao)
	VALUE ("Legumes", "Frutos"),
            ("Verduras", "Herbáceas"),
            ("Frutas", "Ácidas"),
            ("Frutas", "Doces"),
            ("Verduras", "Tuberosas");
    
    
-- CRIAÇÃO TABELA PRODUTO
CREATE TABLE tb_produto(
	id_produto INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_categ INT(4) NOT NULL,
    fruta VARCHAR(50) NOT NULL,
    gramas INT(4) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    
    FOREIGN KEY(fk_categ) REFERENCES tb_categoria(id_categ));

-- POPULAÇÃO TABELA PRODUTO 
INSERT INTO tb_produto(fk_categ, fruta, gramas, preco)
	VALUE (2, "Repolho", 900, 6.30),
			(1, "Tomate", 20, 65.00),
            (5, "Cebola", 140, 2.99),
            (2, "Couve-flor", 1000, 5.70),
            (3, "Morango", 1000, 11.90),
            (4, "Caqui", 1000, 5.00),
            (4, "Mamão", 1000, 2.79);


-- SELECT QUE RETORNA FRUTAS COM VALOR ACIMA DE 50 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco > 50;


-- SELECT QUE RETORNA FRUTAS COM VALOR ENTRE 3 E 60 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco BETWEEN 3 AND 60;


-- SELECT QUE RETORNA FRUTAS QUE POSSUEM A LETRA "C" NO NOME 
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE fruta LIKE "%C%";
    
    
-- SELECT COM INNER JOIN ENTRE AS TABELAS   
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ;


-- SELECT COM RETORNO DE PRODUTOS DE TIPO FRUTA E VERDURAS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE tipo_fruta IN ("Frutas", "Verduras");
    
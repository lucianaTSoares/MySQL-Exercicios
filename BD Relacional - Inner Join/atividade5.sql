-- CRIAÇÃO DATABASE
CREATE DATABASE db_construindo_a_nossa_vida;


-- CRIAÇÃO TABELA CATEGORIA
USE db_construindo_a_nossa_vida;
CREATE TABLE tb_categoria(
	id_categ INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantidade INT(4) NOT NULL,
    tipo_material VARCHAR(50) NOT NULL);

-- POPULAÇÃO TABELA CATEGORIA
INSERT INTO tb_categoria(quantidade, tipo_material)
	VALUE (3000, "Hidráulica"),
            (6700, "Tintas"),
            (3000, "Pisos"),
            ("8890", "Elétricos"),
            ("9990", "Fixadores");
    
    
-- CRIAÇÃO TABELA PRODUTO
CREATE TABLE tb_produto(
	id_produto INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_categ INT(4) NOT NULL,
    material VARCHAR(50) NOT NULL,
    cor VARCHAR(35) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    
    FOREIGN KEY(fk_categ) REFERENCES tb_categoria(id_categ));

-- POPULAÇÃO TABELA PRODUTO 
INSERT INTO tb_produto(fk_categ, material, cor, preco)
	VALUE (1, "Tubo", "Branco", 16.30),
			(1, "Registro", "Prata", 61.00),
            (2, "Tinta acrílica Suvinil", "Gelo", 200.99),
            (3, "Piso Vinílico", "Marrom claro", 5.70),
            (4, "Extensão", "Preto", 59.99),
            (5, "Fixador para fios", "Branco", 2.00),
            (5, "Interruptor - 2 Tomadas", "Prata", 17.79);


-- SELECT QUE RETORNA PRODUTOS COM VALOR ACIMA DE 50 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco > 50;


-- SELECT QUE RETORNA PRODUTOS COM VALOR ENTRE 3 E 60 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE preco BETWEEN 3 AND 60;


-- SELECT QUE RETORNA PRODUTOS QUE POSSUEM A LETRA "C" NO NOME 
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE material LIKE "%C%";
    
    
-- SELECT COM INNER JOIN ENTRE AS TABELAS   
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ;


-- SELECT COM RETORNO DE PRODUTOS DE TIPO 
SELECT * FROM tb_categoria INNER JOIN tb_produto ON tb_categoria.id_categ = tb_produto.fk_categ
	WHERE tipo_material IN ("Hidráulica");
    
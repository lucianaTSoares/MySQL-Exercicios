-- CRIAÇÃO DATABASE
CREATE DATABASE db_pizzaria_legal;


-- CRIAÇÃO TABELA CATEGORIA
USE db_pizzaria_legal;
CREATE TABLE tb_categoria(
	id_categ INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza VARCHAR(35) NOT NULL,
    tipo_massa VARCHAR(35) NOT NULL);
    
-- POPULAÇÃO TABELA CATEGORIA
INSERT INTO tb_categoria(tipo_pizza, tipo_massa)
	VALUE ("Salgada", "Tradicional"),
			("Salgada", "Italiana"),
            ("Doce", "Tradicional"),
            ("Doce", "Italiana"),
            ("Leve (Light)", "Integral");
			

-- CRIAÇÃO TABELA PIZZA
CREATE TABLE tb_pizza(
	id_pizza INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_categ INT(3) NOT NULL,
    nome VARCHAR(35) NOT NULL,
    ingredientes VARCHAR(200) NOT NULL,
    valor DECIMAL(3,2) NOT NULL,
    
    FOREIGN KEY(fk_categ) REFERENCES tb_categoria(id_categ));
    
-- POPULAÇÃO TABELA PIZZA
INSERT INTO tb_pizza(fk_categ, nome, ingredientes, valor)
	VALUE (1, "Calabresa", "Linguiça calabresa, Cebola, Orégano", 51.90),
			(1, "Portuguesa", "Queijo, Presunto, Ovo cozido, Tomate", 57.90),
            (2, "Frango com catupiry", "Frango, Salsa, Queijo catupiry, Molho de tomate", 48.00),
            (3, "Brigadeiro", "Chocolate, Granulado", 30.90),
            (4, "Chocolate com Morango", "Chocolate, Morango", 17.90),
            (5, "Mini pizza", "Queijo tipo minas, Tomate, Manjericão", 29.90);


-- SELECT QUE RETORNA PRODUTOS COM VALOR ACIMA DE 45 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ
	WHERE valor > 45;


-- SELECT QUE RETORNA PRODUTOS COM VALOR ENTRE 29 E 60 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ
	WHERE valor BETWEEN 29 AND 60;


-- SELECT QUE RETORNA PIZZAS QUE POSSUEM A LETRA "C" NO NOME 
SELECT * FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ
	WHERE nome LIKE("%C%");
    

-- SELECT COM INNER JOIN ENTRE AS TABELAS
SELECT * FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ;


-- SELECT COM RETORNO DE PIZZAS SALGADAS E LIGHTS
SELECT * FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ
	WHERE tipo_pizza IN ("Salgada", "Leve (Light)");
    
    
-- MÉDIA DO VALOR DAS PIZZAS
SELECT tipo_pizza, AVG(tb_pizza.valor) AS media
	FROM tb_categoria INNER JOIN tb_pizza ON tb_categoria.id_categ = tb_pizza.fk_categ
    GROUP BY tipo_pizza;
   
    
-- OUTROS COMANDOS UTILIZADOS DURANTE A ATIVIDADE
ALTER TABLE tb_pizza MODIFY COLUMN valor DECIMAL(5,2) NOT NULL; 
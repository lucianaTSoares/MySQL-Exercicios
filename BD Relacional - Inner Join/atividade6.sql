-- CRIAÇÃO DATABASE
CREATE DATABASE db_curso_da_minha_vida;


-- CRIAÇÃO TABELA CATEGORIA
USE db_curso_da_minha_vida;
CREATE TABLE tb_categoria(
	id_categ INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_categoria VARCHAR(100) NOT NULL,
    nome_subcategoria VARCHAR(100) NOT NULL);

-- POPULAÇÃO TABELA CATEGORIA
INSERT INTO tb_categoria(nome_categoria, nome_subcategoria)
	VALUE ("Saúde", "Enfermagem"),
            ("Arte", "Desenho"),
            ("Tecnologia", "Banco de Dados"),
            ("Gastronomia", "Doces"),
            ("Idiomas", "Inglês");
    
    
-- CRIAÇÃO TABELA CURSOS
CREATE TABLE tb_curso(
	id_curso INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_categ INT(4) NOT NULL,
    curso VARCHAR(100) NOT NULL,
    duracao_horas INT(4) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    
    FOREIGN KEY(fk_categ) REFERENCES tb_categoria(id_categ));

-- POPULAÇÃO TABELA CURSOS
INSERT INTO tb_curso(fk_categ, curso, duracao_horas, preco)
	VALUE (1, "Teoria da enfermagem", 2, 25.30),
			(3, "Oracle", 100, 70.00),
            (3, "Introdução ao MySQL", 11, 0.0),
            (2, "Artes visuais", 15, 2.40),
            (4, "Confeitaria", 7, 10.90),
            (5, "Tempos verbais no inglês", 30, 51.00),
            (5, "Ingês técnico", 20, 0.0);


-- SELECT QUE RETORNA CURSOS COM VALOR ACIMA DE 50 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_curso ON tb_categoria.id_categ = tb_curso.fk_categ
	WHERE preco > 50;


-- SELECT QUE RETORNA CURSOS COM VALOR ENTRE 3 E 60 REAIS
SELECT * FROM tb_categoria INNER JOIN tb_curso ON tb_categoria.id_categ = tb_curso.fk_categ
	WHERE preco BETWEEN 3 AND 60;


-- SELECT QUE RETORNA CURSOS QUE POSSUEM A LETRA "J" NO NOME 
SELECT * FROM tb_categoria INNER JOIN tb_curso ON tb_categoria.id_categ = tb_curso.fk_categ
	WHERE curso LIKE "%J%";
    
    
-- SELECT COM INNER JOIN ENTRE AS TABELAS   
SELECT * FROM tb_categoria INNER JOIN tb_curso ON tb_categoria.id_categ = tb_curso.fk_categ;


-- SELECT COM RETORNO DE CATEGORIA E SUBCATEGORIA DE CURSOS
SELECT * FROM tb_categoria INNER JOIN tb_curso ON tb_categoria.id_categ = tb_curso.fk_categ
	WHERE nome_categoria IN ("Tecnologia", "Arte");
    
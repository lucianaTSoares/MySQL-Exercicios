-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE db_escola;


-- CRIAÇÃO DAS TABELAS ESTUDANTES E NOTA ALUNO
USE db_escola;
CREATE TABLE tb_estudantes(
	id_aluno INT(7) NOT NULL AUTO_INCREMENT, 
	nome VARCHAR(35) NOT NULL,
    serie VARCHAR(35) NOT NULL,
    data_nascimento VARCHAR(11) NOT NULL,
    -- cpf VARCHAR(14), --> EXCLUIDO DA TABELA COM ALTER TABLE
    -- notas DECIMAL(1,1) --> EXCLUIDO DA TABELA COM ALTER TABLE

	PRIMARY KEY(id_aluno));

CREATE TABLE tb_nota_aluno(
	cod_materia INT(6) NOT NULL AUTO_INCREMENT,
    fk_aluno INT(7) NOT NULL,
    nota DECIMAL(3,1) NOT NULL,
    
    PRIMARY KEY(cod_materia),
    FOREIGN KEY(fk_aluno) REFERENCES tb_estudantes (id_aluno));


-- POPULAÇÃO DAS TABELAS
INSERT INTO tb_estudantes(nome, serie, data_nascimento) 
	VALUE ("Letícia", "3 - Ensino Médio", "09/12/2002");
    
INSERT INTO tb_estudantes(nome, serie, data_nascimento) 
	VALUE ("Rodrigo", "1 - Ensino Médio", "11/05/2004");
    
INSERT INTO tb_estudantes(nome, serie, data_nascimento) 
	VALUE ("Claudia", "8 - Ensino Fundamental", "11/05/2006");

INSERT INTO tb_nota_aluno(nota, fk_aluno)
	VALUE (8.5, 2);

INSERT INTO tb_nota_aluno(nota, fk_aluno)
	VALUE (6.5, 3);
    
INSERT INTO tb_nota_aluno(nota, fk_aluno)
	VALUE (7, 1);
    
INSERT INTO tb_nota_aluno(nota, fk_aluno)
	VALUE (10, 3);   
    
    
-- SELECT JUNTANDO 2 TABELAS E RETORNANDO ESTUDANTES COM NOTA MAIOR QUE 7
SELECT id_aluno, nome, serie, data_nascimento, cod_materia, nota FROM tb_estudantes 
	INNER JOIN tb_nota_aluno ON id_aluno = fk_aluno
    WHERE nota > 7;
    

-- SELECT JUNTANDO 2 TABELAS E RETORNANDO ESTUDANTES COM NOTA MENOR QUE 7    
 SELECT id_aluno, nome, serie, data_nascimento, cod_materia, nota FROM tb_estudantes 
	INNER JOIN tb_nota_aluno ON id_aluno = fk_aluno
    WHERE nota < 7;
    

-- ATUALIZAÇÃO DE DADOS DAS TABELAS
UPDATE tb_nota_aluno SET nota = 6.9 WHERE fk_aluno = 1;
UPDATE tb_estudantes SET data_nascimento = "24/08/2006" WHERE id_aluno = 4;

    
-- OUTROS COMANDOS UTILIZADOS NO DECORRER DO EXERCICIO
SELECT * FROM tb_estudantes;
SELECT * FROM tb_nota_aluno;
ALTER TABLE tb_estudantes MODIFY COLUMN id_aluno INT(7) NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tb_estudantes MODIFY COLUMN data_nascimento VARCHAR(11) NOT NULL;
ALTER TABLE tb_estudantes MODIFY COLUMN serie VARCHAR(35) NOT NULL;
ALTER TABLE tb_estudantes DROP COLUMN cpf;
ALTER TABLE tb_estudantes DROP COLUMN notas;
ALTER TABLE tb_nota_aluno MODIFY COLUMN nota DECIMAL(3,1) NOT NULL;
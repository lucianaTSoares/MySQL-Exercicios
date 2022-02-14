-- CRIAÇÃO DATABASE
CREATE DATABASE db_generation_game_online;

-- CRIAÇÃO TABELAS
USE db_generation_game_online;
CREATE TABLE tb_classe(
	id_classe INT(3) NOT NULL AUTO_INCREMENT,
	tipoClasse VARCHAR(35) NOT NULL,
    arma VARCHAR(35) NOT NULL,
    
    PRIMARY KEY (id_classe));
    
CREATE TABLE tb_personagem(
	id_char INT(3) NOT NULL AUTO_INCREMENT,
    fk_classe INT(3) NOT NULL,
    nome VARCHAR(35) NOT NULL,
	ataque INT(4) NOT NULL,
    defesa INT(4) NOT NULL,
    vitalidade INT(4) NOT NULL,
    destreza INT(4) NOT NULL,
    
    PRIMARY KEY (id_char),
    FOREIGN KEY (fk_classe) REFERENCES tb_classe (id_classe));


-- POPULAÇÃO DE DADOS
INSERT INTO tb_classe(tipoClasse, arma) 
	VALUES ("Mago", "Cajado"),
			("Assassino", "Adagas"),
            ("Guerreiro", "Espadão"),
            ("Lutador", "Manoplas"),
            ("Atirador", "Pistola");
            
INSERT INTO tb_personagem(nome, ataque, defesa, vitalidade, destreza, fk_classe) 
	VALUES ("Anne", 1500, 2000, 2400, 500, 1),
			("Charlie", 2550, 900, 1400, 1000, 2),
            ("Lucian", 2300, 2000, 2300, 3000, 5),
            ("Vivian", 1900, 2600, 4000, 400, 4),
            ("Lux", 1400, 1000, 2100, 600, 1),
            ("Hiro", 1600, 1400, 2100, 500, 3),
            ("Cloe", 3000, 700, 1500, 500, 2);
            
    
-- SELECT QUE RETORNA PERSONAGENS COM ATAQUE MAIOR QUE 2000
SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.fk_classe
	WHERE ataque > 2000;


-- SELECT QUE RETORNA PERSONAGENS COM DEFESA ENTRE 1000 E 2000
SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.fk_classe
	WHERE defesa BETWEEN 1000 AND 2000;


-- SELECT QUE RETORNA PERSONAGENS QUE POSSUEM A LETRA "C" NO NOME 
SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.fk_classe
	WHERE tb_personagem.nome LIKE "%C%";
    
    
-- SELECT COM INNER JOIN ENTRE AS TABELAS    
SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.fk_classe;


-- SELECT COM RETORNO DE PERSONAGENS DA CLASSE ASSASSINO 
SELECT * FROM tb_classe INNER JOIN tb_personagem ON tb_classe.id_classe = tb_personagem.fk_classe
	WHERE tb_classe.tipoClasse = "Assassino";
    
    
-- OUTROS COMANDOS UTILIZADOS DURANTE A ATIVIDADE
SELECT * FROM tb_classe;
SELECT * FROM tb_personagem;
    
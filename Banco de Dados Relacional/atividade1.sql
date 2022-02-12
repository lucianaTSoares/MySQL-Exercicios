-- CRIAÇÃO DO BANCO DE DADOS RH
create database db_rh;
    
    
-- CRIAÇÃO DA TABELA FUNCIONÁRIES
use db_rh;
create table tb_funcionaries(
	id bigint(4) auto_increment,
	nome varchar(30) not null,
	cpf varchar(15) not null,
	email varchar(30) not null,
	cargo varchar(30) not null,
	salario decimal(10,2) not null,
	
	primary key (id)
);
    
    
-- INSERÇÃO DE ATE 5 DADOS NA TABELA
insert into tb_funcionaries(nome, cpf, email, cargo, salario) 
	values ("Luciana", "xxx.xxx.xxx-xx", "luciana@email.com", "Desenvolvedora Jr", 3700.00);
	
insert into tb_funcionaries(nome, cpf, email, cargo, salario) 
	values ("Flávia", "yyy.yyy.yyy-yy", "flavia@email.com", "Scrum Master", 6000.00);
	
insert into tb_funcionaries(nome, cpf, email, cargo, salario) 
	values ("Bernardo", "zzz.zzz.zzz-zz", "bernardo@email.com", "Estagiário", 1200.00);
	
insert into tb_funcionaries(nome, cpf, email, cargo, salario) 
	values ("Gabriel", "ccc.ccc.ccc-cc", "gabriel@email.com", "Recepcionista", 1300.00);
	
insert into tb_funcionaries(nome, cpf, email, cargo, salario) 
	values ("Amanda", "vvv.vvv.vvv-vv", "amanda@email.com", "Auxiliar de RH", 1500.00);
        
        
-- SELECT PARA RETORNAR FUNCIONÁRIES COM SALÁRIO MAIOR QUE 2000
select * from tb_funcionaries where salario > 2000;
 
 
-- SELECT PARA RETORNAR FUNCIONÁRIES COM SALÁRIO MENOR QUE 2000
select * from tb_funcionaries where salario < 2000;
    
    
-- ATUALIZAÇÃO DE UM DADO NA TABELA
update tb_funcionaries set salario = 2000.00 where id = 5;


-- OUTROS COMANDOS UTILIZADOS NO DECORRER DO EXERCICIO
select * from tb_funcionaries;
delete from tb_funcionaries; -- exclui dados da tabela (usar WHERE para excluir uma linha expecifica)
drop table tb_funcionaries; -- exclui tabela
drop database db_rh; -- exclui banco de dados
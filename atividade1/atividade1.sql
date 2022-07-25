/*Crie role para ele, com acesso apenas à consulta em tabelas (nem dados, nem estrutura podem ser alterados).*/

CREATE ROLE 'app_read';
GRANT SELECT ON uc4atividades.* TO 'app_read';
FLUSH PRIVILEGES;

CREATE USER 'user_read'@'localhost' IDENTIFIED BY '1234';
SHOW GRANTS FOR 'user_read'@'localhost';

GRANT 'app_read' TO 'user_read'@'localhost';
FLUSH PRIVILEGES;

SET DEFAULT ROLE 'app_read' TO 'user_read'@'localhost';

/*Crie usuário e role para funcionário, o qual pode manipular as tabelas de venda, cliente e produto, mas não deve ter acesso 
(nem para consulta) a funcionário e cargo e não deve ser capaz de realizar alterações de estrutura em nenhuma tabela.*/

CREATE ROLE 'app_funcionario';
GRANT CREATE, SELECT, INSERT, UPDATE ON uc4atividades.venda TO 'app_funcionario';
GRANT CREATE, SELECT, INSERT, UPDATE ON uc4atividades.cliente TO 'app_funcionario';
GRANT CREATE, SELECT, INSERT, UPDATE ON uc4atividades.produto TO 'app_funcionario';
FLUSH PRIVILEGES;

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY '1234';

GRANT 'app_funcionario' TO 'user_funcionario'@'localhost';
FLUSH PRIVILEGES;

SET DEFAULT ROLE 'app_funcionario' TO 'user_funcionario'@'localhost';

/*Escolha um método de criptografia ou hash para aplicar às senhas dos usuários.
Atualize a tabela “usuário” aplicando a criptografia ou hash ao campo de senha em todos os registros.*/
ALTER TABLE usuario MODIFY column senha TEXT;

INSERT INTO usuario (login,senha) 
VALUES ('user_read', sha1('mysql')),
('user_funcionario', sha('mysql'));

SELECT * FROM usuario;
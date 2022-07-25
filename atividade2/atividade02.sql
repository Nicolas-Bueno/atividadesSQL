/*Crie um stored procedure que receba id de cliente, data inicial e data final
e que mostre a lista de compras realizadas pelo referido cliente entre as datas informadas (incluindo essas datas),
mostrando nome do cliente, id da compra, total, nome e quantidade de cada produto comprado.
No script, inclua o código de criação e uma chamada ao procedure*/

DELIMITER //
CREATE PROCEDURE lista_compras(varId int, dataInicial datetime, dataFinal datetime)
BEGIN
SELECT C.nome, IV.venda_id, (IV.valor_unitario*IV.quantidade) as valor_total, IV.nome_produto, IV.quantidade
FROM item_venda AS IV JOIN venda AS V ON (IV.venda_id = V.id)
JOIN cliente AS C ON (C.id = V.cliente_id)
where V.data = dataInicial and V.data_envio = dataFinal and V.cliente_id = varId;
END //
DELIMITER ;

/*Crie uma stored function que receba id de funcionário, data inicial e data final e retorne
a comissão total desse funcionário no período indicado.
No script, inclua o código de criação e uma chamada à function.*/

DELIMITER $$
CREATE FUNCTION comissao_funcionario(id_funcionario int, dataIn date, dataFin date)
RETURNS DECIMAL(9,2) DETERMINISTIC 
BEGIN

DECLARE comissao int;
DECLARE valorMes decimal(9,2);

SELECT C.comissao, SUM(V.valor_total)
INTO comissao, valorMes
FROM venda V JOIN funcionario F on (V.funcionario_id=F.id)
JOIN cargo C ON(F.cargo_id = C.id)
WHERE (V.data BETWEEN dataIn AND dataFin) AND V.funcionario_id = id_funcionario;

RETURN valorMes * (comissao/100);

END $$
DELIMITER ;


/*Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”.
Um cliente é “PREMIUM” se já realizou mais de R$ 10 mil em compras nos últimos dois anos.
Um cliente é “REGULAR” se ao contrário. No script, inclua o código de criação e uma chamada à function.*/

DELIMITER $$ 
CREATE FUNCTION tipo_cliente(id_cliente int)
RETURNS VARCHAR(25) DETERMINISTIC
BEGIN
DECLARE total decimal(9,2);

SELECT SUM(V.valor_total)
INTO total
FROM venda V JOIN cliente C ON(V.cliente_id = C.id)
WHERE V.data BETWEEN DATE_SUB(NOW(), INTERVAL 2 YEAR) AND NOW() and V.cliente_id = id_cliente;
 IF(total > 10000) THEN
	RETURN (SELECT "Cliente PREMIUM");
 ELSE 
	RETURN (SELECT "Cliente REGULAR");
 END IF;
END $$
DELIMITER ; 


/*Crie um trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário,
aplique automaticamente MD5() à coluna “senha”.*/

CREATE TRIGGER tr_novoUsuario BEFORE INSERT
ON usuario
FOR EACH ROW
SET NEW.senha = md5(NEW.senha);

INSERT INTO usuario (login,senha) 
VALUES ('teste', 'mysql');
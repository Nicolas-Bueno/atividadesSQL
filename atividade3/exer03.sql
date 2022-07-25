/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/

/* Quando executa esse comando ele pecorre 800 rows para retornar os dados*/
SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/* Foi criado um index na tabela "venda" coluna "tipo_pagamento" para melhorar a perfomace,
 e pecorreu 248 rows para retonar os dados*/

CREATE INDEX index_venda ON venda(tipo_pagamento);
EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/

/*Criado uma view*/
CREATE VIEW vendasProdutosFabricante AS
SELECT P.nome, P.fabricante, IV.quantidade, IV.valor_unitario, IV.subtotal,
V.data, V.data_envio, V.status, V.valor_total, V.tipo_pagamento, V.data_pagamento
FROM item_venda IV join produto P on (IV.produto_id=P.id)
JOIN venda V on (IV.venda_id=V.id)
WHERE P.fabricante like '%lar%';

SELECT * FROM vendasProdutosFabricante;

/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/

/*Criado uma view*/
CREATE VIEW relatorio_vendaCliente AS
SELECT c.nome, iv.nome_produto, SUM(iv.subtotal) valor, SUM(iv.quantidade) quantidade, SUM(iv.subtotal*iv.quantidade) total
FROM produto p JOIN item_venda iv ON (p.id = iv.produto_id)
JOIN venda v ON (v.id = iv.venda_id)
JOIN cliente c ON (c.id = v.cliente_id)
GROUP BY c.nome, p.nome;

select* FROM relatorio_vendaCliente;
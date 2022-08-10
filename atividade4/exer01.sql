/*Foi identificado que era melhor criar uma tabela para o tipo de pagamento*/
CREATE TABLE tipo_pagamento (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento CHAR(1),
    numero_cartao_pagamento VARCHAR(16),
    numero_parcelas INT,
    data_pagamento DATETIME
);

INSERT INTO tipo_pagamento
(forma_pagamento, numero_cartao_pagamento, numero_parcelas, data_pagamento)
SELECT tipo_pagamento, numero_cartao_pagamento, numero_parcelas_pagamento, data_pagamento
FROM venda;

ALTER TABLE venda DROP COLUMN tipo_pagamento;
ALTER TABLE venda DROP COLUMN numero_cartao_pagamento;
ALTER TABLE venda DROP COLUMN numero_parcelas_pagamento;
ALTER TABLE venda DROP COLUMN data_pagamento;

ALTER TABLE venda ADD COLUMN tipo_pagamento_id INT,
ADD FOREIGN KEY (tipo_pagamento_id) REFERENCES tipo_pagamento(id);

SET SQL_SAFE_UPDATES=0;
UPDATE venda SET tipo_pagamento_id = id;
--Exercicio1: resposta

select Dependents.nome as Cliente , clients.nome as Nome_Dependente
from 

(Select cliente.nome as nome, cliente_conta.id_conta as id, cliente_conta.dependente as dependente 
from cliente
INNER JOIN cliente_conta 
ON cliente.id = cliente_conta.id_cliente) as clients

INNER JOIN

(Select cliente.nome as nome, cliente_conta.id_conta as id, cliente_conta.dependente as dependente 
from cliente
INNER JOIN cliente_conta 
ON cliente.id = cliente_conta.id_conta) as Dependents

on Dependents.id = clients.id
where clients.dependente=1 AND Dependents.dependente=1
group by Nome_Dependente;



_______________________________________________________________________________

-- Exercicio2: resposta
SELECT cliente.nome as Cliente, conta.numero as Nro_Cuenta, 
count(id_cliente_conta)as Menor_nro_Transaçãos
FROM transacao
INNER JOIN cliente_conta
On cliente_conta.id_cliente = transacao.id_cliente_conta
INNER join cliente ON cliente.id = cliente_conta.id_cliente
INNER join conta on cliente_conta.id_conta = conta.id
group by transacao.id_cliente_conta
order by Menor_nro_Transaçãos
limit 5;

SELECT cliente.nome as Cliente, conta.numero as Nro_Cuenta, 
count(id_cliente_conta)as Maior_nro_Transacaos
FROM (transacao
INNER JOIN cliente_conta
On cliente_conta.id_cliente = transacao.id_cliente_conta
INNER join cliente ON cliente.id = cliente_conta.id_cliente
INNER join conta on cliente_conta.id_conta = conta.id)
group by transacao.id_cliente_conta
order by Maior_nro_Transacaos DESC
limit 5;


________________________________________________________________________________


-- Exercicio3: resposta
SELECT cliente.nome as Cliente, conta.numero as NroCuenta,
SUM(CASE WHEN id_tipo_transacao = 1 THEN valor 
WHEN id_tipo_transacao = 2 THEN (-1)*valor 
WHEN id_tipo_transacao = 3 THEN (-1)*valor 
WHEN id_tipo_transacao = 4 THEN valor ELSE 0 END) as Total

from (transacao
JOIN cliente_conta
      On cliente_conta.id_cliente = transacao.id_cliente_conta
join cliente ON cliente.id = cliente_conta.id_cliente
join conta on cliente_conta.id_conta = conta.id)

Group by id_cliente_conta;


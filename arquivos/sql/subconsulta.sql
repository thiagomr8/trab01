/*  Os modelo de caminhão coletor diferente de 'VW 8150' */
SELECT DISTINCT nome as modelo_de_caminhao FROM modelo 
WHERE nome IN (SELECT DISTINCT nome FROM modelo WHERE nome <> 'VW 8150')

/* Código das lixeiras vazias */
SELECT lixeira.cod_lixeira, bairro.nome as bairro FROM lixeira 
INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE cod_lixeira NOT IN (SELECT descarte.cod_lixeira FROM descarte LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
WHERE descarte.data_descarte > coleta.data_coleta  GROUP BY descarte.cod_lixeira 
ORDER BY descarte.cod_lixeira)

/* Código e volume das lixeiras coletadas */

SELECT coleta.cod_lixeira, coleta.volume, bairro.nome AS bairro FROM coleta
INNER JOIN lixeira ON (lixeira.cod_lixeira = coleta.cod_lixeira)
INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE coleta.data_coleta IN (SELECT DISTINCT coleta.data_coleta FROM coleta ORDER BY coleta.data_coleta DESC LIMIT 1) 

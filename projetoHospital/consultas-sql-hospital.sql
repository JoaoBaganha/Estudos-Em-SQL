--Quais pacientes realizaram consultas com 
--médicos da especialidade 'Cardiologia' nos 
--últimos 6 meses?
SELECT p.nome AS nome_paciente,
m.nome AS nome_medico,
m.especialidade AS especialidade,
c.data_consulta AS consulta
FROM consulta AS c JOIN paciente AS p ON (p.id = c.id_paciente)
JOIN medico AS m ON (m.id = id_medico)
WHERE m.especialidade = 'Cardiologia'
AND c.data_consulta >= CURRENT_DATE - INTERVAL '6 MONTHS';

--Qual o estoque atual de medicamentos que possuem
--validade dentro dos próximos 30 dias?
SELECT nome, quantidade_estoque, validade
FROM medicamento  
WHERE validade <= CURRENT_DATE + INTERVAL '30 DAYS';

--Quais médicos trabalharam mais de 40 horas nos 
--últimos 30 dias, somando consultas e plantões?
SELECT m.nome AS Nome_medico,
SUM(c.tempo_consulta) + SUM(p.tempo_plantao) AS tempo_total
FROM medico AS m 
JOIN consulta AS c ON m.id = c.id_medico
JOIN plantao AS p ON m.id = p.id_medico
WHERE c.data_consulta >= CURRENT_DATE - INTERVAL '30 DAYS'
AND data_plantao >= CURRENT_DATE - INTERVAL '30 DAYS'
GROUP BY m.nome

--Quantos pacientes foram internados por mais de
--7 dias nos últimos 3 meses, e em quais alas do 
--hospital?
SELECT COUNT(i.id_paciente) AS pacientes,
s.setor AS setor
FROM internacao AS i
JOIN setor AS s ON (s.id = i.id_setor)
WHERE (i.fim_internacao - i.inicio_internacao) > 7
AND i.inicio_internacao >= CURRENT_DATE - INTERVAL '3 MONTHS'
GROUP BY s.setor

--Qual foi o medicamento mais utilizado em cirurgias
--nos últimos 6 meses?
SELECT c.id AS id_cirugia,
COUNT(c.id_medicamento) AS medicamento_usado,
c.data_cirugia AS data_cirugia,
m.nome AS nome_medicamento
FROM medicamento AS m 
JOIN cirugia AS c ON(c.id_medicamento = m.id)
WHERE c.data_cirugia >= CURRENT_DATE - INTERVAL '6 MONTHS'
GROUP BY c.id, m.nome

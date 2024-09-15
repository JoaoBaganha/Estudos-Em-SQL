INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('João', '00000000000', 'Analista de Dados');
INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('Pricila', '00000000001', 'Desenvolvedor Web');
INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('Fulano', '00000000002', 'Desenvolvedor Back-End');
INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('Ciclano', '00000000003', 'Cientista de Dados');
INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('Beltrano', '00000000004', 'PO');
INSERT INTO public.empregado(nome, cpf, cargo) VALUES ('Cipriano', '00000000005', 'Scrum Master');

SELECT * FROM empregado

INSERT INTO public.projeto(nome, orcamento, descricao) VALUES ('GERDAÇO', '1234567', 'Cliente Centure');
INSERT INTO public.projeto(nome, orcamento, descricao) VALUES ('Panco Ban', '1234567', 'Galera da grana');
INSERT INTO public.projeto(nome, orcamento, descricao) VALUES ('Pesuca', '1234567', 'Alcindo Cacela');

SELECT * FROM projeto

INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (1, 1);
INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (1, 2);
INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (2, 2);
INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (3, 4);
INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (3, 5);
INSERT INTO public.empregado_projeto(id_projeto_fk, id_empregado_fk) VALUES (2, 1);

SELECT * FROM empregado_projeto


SELECT projeto.nome, empregado.nome 
FROM projeto
JOIN empregado_projeto ON (projeto.id_projeto = empregado_projeto.id_projeto_fk)
JOIN empregado ON (empregado.id_empregado = empregado_projeto.id_empregado_fk)
WHERE projeto.id_projeto = 2


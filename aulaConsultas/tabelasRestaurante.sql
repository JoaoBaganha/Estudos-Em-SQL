create table mesas (
id int not null primary key,
mesa_codigo varchar(20),
mesa_situacao varchar(1) default 'A',
data_criacao timestamp,
data_atualizacao timestamp);

create table funcionarios(
id int not null primary key,
funcionario_codigo varchar(20),
funcionario_nome varchar(100),
funcionario_situacao varchar(1) default 'A',
funcionario_comissao real,
funcionario_cargo varchar(30),
data_criacao timestamp,
data_atualizacao timestamp);

create table vendas(
id int not null primary key,
funcionario_id int references funcionarios (id),
mesa_id int references mesas(id),
venda_codigo varchar(20),
venda_valor real,
venda_total real,
venda_desconto real,
venda_situacao varchar(1) default 'A',
data_criacao timestamp,
data_atualizacao timestamp);

create table produtos(
id int not null primary key,
produto_codigo varchar(20),
produto_nome varchar(60),
produto_valor real,
produto_situacao varchar(1) default 'A',
data_criacao timestamp,
data_atualizacao timestamp);

create table itens_vendas(
id int not null primary key,
produto_id int not null references produtos(id),
vendas_id int not null references vendas(id),
item_valor real,
item_quantidade int,
item_total real,
data_criacao timestamp,
data_atualizacao timestamp);

create table comissoes(
id int not null primary key,
funcionario_id int references funcionarios(id),
comissao_valor real,
comissao_situacao varchar(1) default 'A',
data_criacao timestamp,
data_atualizacao timestamp);

alter table vendas add check (venda_total > 0 );

create sequence mesa_id_seq;
create sequence vendas_id_seq;
create sequence itens_vendas_id_seq;
create sequence produtos_id_seq;
create sequence funcionario_id_seq;
create sequence comissoes_id_seq;

alter table mesas alter column id set default nextval('mesa_id_seq');
alter table vendas alter column id set default nextval('vendas_id_seq');

alter table itens_vendas alter column id set default nextval('itens_vendas_id_seq');

alter table produtos alter column id set default nextval('produtos_id_seq');

alter table funcionarios alter column id set default nextval('funcionario_id_seq');

alter table comissoes alter column id set default nextval('comissoes_id_seq');

alter table comissoes add column data_pagamento int;

alter table comissoes alter column data_pagamento type timestamp without time zone using to_timestamp(data_pagamento) AT TIME ZONE 'UTC'





insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00001', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00002', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00003', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00004', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00005', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00006', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00007', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00008', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('00009', 'A', '2022-01-01', '2022-01-01');
insert into mesas (mesa_codigo, mesa_situacao, data_criacao, data_atualizacao) values ('000010', 'A', '2022-01-01', '2022-01-01');




insert into funcionarios(funcionario_codigo, funcionario_nome, funcionario_situacao, funcionario_comissao, funcionario_cargo, data_criacao) values('0001', 'Funcionário Gerente', 'A', 5, 'Gerente', '2022-01-01');
insert into funcionarios(funcionario_codigo, funcionario_nome, funcionario_situacao, funcionario_comissao, funcionario_cargo, data_criacao) values('0002', 'Funcionário Garçom', 'A', 2, 'Garçom', '2022-01-01');
insert into funcionarios(funcionario_codigo, funcionario_nome, funcionario_situacao, funcionario_comissao, funcionario_cargo, data_criacao) values('0003', 'Funcionário Garçom 2', 'A', 2, 'Garçom', '2022-01-01');
insert into funcionarios(funcionario_codigo, funcionario_nome, funcionario_situacao, funcionario_comissao, funcionario_cargo, data_criacao) values('0004', 'Funcionário Garçom 2', 'A', 2, 'Garçom', '2022-01-01');


insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('001', 'Refrigerante', 5, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('002', 'Água', 3, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('003', 'Pastel', 7, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('004', 'Coxinha', 8, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('005', 'Lasanha', 20, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('006', 'Tábua de frios', 25, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('007', 'Frango frito', 30, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('008', 'Carne assada', 30, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('009', 'Picadinho', 28, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('010', 'Lombo Suíno', 35, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('011', 'Batata frita', 18, 'A', '2022-01-01', '2022-01-01');
insert into produtos (produto_codigo, produto_nome, produto_valor, produto_situacao, data_criacao, data_atualizacao) values ('012', 'Macaxeira', 18, 'A', '2022-01-01', '2022-01-01');


insert into vendas (funcionario_id, mesa_id, venda_codigo, venda_valor, venda_total, venda_desconto, venda_situacao, data_criacao, data_atualizacao) values (2, 1, '0001', '20', '20', '0', 'A', '2022-01-01', '2022-01-01');
insert into vendas (funcionario_id, mesa_id, venda_codigo, venda_valor, venda_total, venda_desconto, venda_situacao, data_criacao, data_atualizacao) values (2, 2, '0002', '21', '21', '0', 'A', '2022-01-01', '2022-01-01');


insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (1, 1, 5, 4, 20, '2022-01-01', '2022-01-01');
insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (6, 1, 25, 2, 50, '2022-01-01', '2022-01-01');
insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (12, 1, 18, 1, 18, '2022-01-01', '2022-01-01');
insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (2, 2, 3, 8, 24, '2022-01-01', '2022-01-01');
insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (4, 2, 8, 4, 32, '2022-01-01', '2022-01-01');
insert into itens_vendas (produto_id, vendas_id, item_valor, item_quantidade, item_total, data_criacao, data_atualizacao) values (10, 2, 35, 2, 70, '2022-01-01', '2022-01-01');




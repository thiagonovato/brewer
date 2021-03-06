-- SQL Manager Lite for PostgreSQL 5.7.1.47382
-- ---------------------------------------
-- Host      : localhost
-- Database  : brewer
-- Version   : PostgreSQL 9.6.4, compiled by Visual C++ build 1800, 64-bit



SET check_function_bodies = false;
--
-- Structure for table schema_version (OID = 45684) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.schema_version (
    installed_rank integer NOT NULL,
    version varchar(50),
    description varchar(200) NOT NULL,
    type varchar(20) NOT NULL,
    script varchar(1000) NOT NULL,
    checksum integer,
    installed_by varchar(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
)
WITH (oids = false);
--
-- Structure for table estilo (OID = 45696) : 
--
CREATE TABLE public.estilo (
    codigo serial NOT NULL,
    nome varchar(50) NOT NULL
)
WITH (oids = false);
--
-- Structure for table cerveja (OID = 45704) : 
--
CREATE TABLE public.cerveja (
    codigo serial NOT NULL,
    sku varchar(50) NOT NULL,
    nome varchar(80) NOT NULL,
    descricao text NOT NULL,
    valor numeric(10,2) NOT NULL,
    teor_alcoolico numeric(10,2) NOT NULL,
    comissao numeric(10,2) NOT NULL,
    sabor varchar(50) NOT NULL,
    origem varchar(50) NOT NULL,
    codigo_estilo bigint NOT NULL,
    quantidade_estoque integer NOT NULL
)
WITH (oids = false);
--
-- Data for table public.schema_version (OID = 45684) (LIMIT 0,2)
--
INSERT INTO schema_version (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
VALUES (1, '01', 'criar tabelas estilo e cerveja', 'SQL', 'V01__criar_tabelas_estilo_e_cerveja.sql', -634038470, 'postgres', '2018-01-02 11:09:35.052526', 129, true);

INSERT INTO schema_version (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
VALUES (2, '02', 'criar coluna quantidade estoque', 'SQL', 'V02__criar_coluna_quantidade_estoque.sql', -1474760089, 'postgres', '2018-01-02 11:51:21.416327', 142, true);

--
-- Data for table public.estilo (OID = 45696) (LIMIT 0,10)
--
INSERT INTO estilo (codigo, nome)
VALUES (1, 'Amber Lager');

INSERT INTO estilo (codigo, nome)
VALUES (2, 'Dark Lager');

INSERT INTO estilo (codigo, nome)
VALUES (3, 'Pale Lager');

INSERT INTO estilo (codigo, nome)
VALUES (4, 'Pilsner');

INSERT INTO estilo (codigo, nome)
VALUES (5, 'Teste');

INSERT INTO estilo (codigo, nome)
VALUES (6, 'Cerveja de Trigo');

INSERT INTO estilo (codigo, nome)
VALUES (7, 'Novo teste');

INSERT INTO estilo (codigo, nome)
VALUES (8, 'asdfasdfadsf');

INSERT INTO estilo (codigo, nome)
VALUES (9, 'asdf');

INSERT INTO estilo (codigo, nome)
VALUES (10, 'Frutada');

--
-- Data for table public.cerveja (OID = 45704) (LIMIT 0,7)
--
INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (1, 'A1111', 'Heineken', 'Boa pra tudo', 4.50, 4.50, 3.00, 'AMARGA', 'INTERNACIONAL', 3, 50);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (2, 'A1112', 'Itaipava', 'Teste', 1.69, 4.80, 2.50, 'SUAVE', 'NACIONAL', 1, 500);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (3, 'A1113', 'teste', 'df', 1.23, 1.23, 12.31, 'AMARGA', 'NACIONAL', 2, 123);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (5, '234', 'asf', 'lk', 1.23, 1.23, 1.23, 'SUAVE', 'NACIONAL', 3, 123);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (6, 'AA1234', 'Teste', 'adsf', 9.90, 5.00, 2.50, 'AMARGA', 'INTERNACIONAL', 3, 50);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (7, 'AA5555', '123123', '123123', 50.00, 12.00, 5.00, 'ADOCICADA', 'NACIONAL', 2, 200);

INSERT INTO cerveja (codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque)
VALUES (8, 'AA9999', 'Teste', 'Frutada', 9.90, 6.00, 5.00, 'FRUTADA', 'INTERNACIONAL', 10, 23);

--
-- Definition for index schema_version_s_idx (OID = 45693) : 
--
CREATE INDEX schema_version_s_idx ON schema_version USING btree (success);
--
-- Definition for index schema_version_pk (OID = 45691) : 
--
ALTER TABLE ONLY schema_version
    ADD CONSTRAINT schema_version_pk
    PRIMARY KEY (installed_rank);
--
-- Definition for index estilo_codigo_key (OID = 45700) : 
--
ALTER TABLE ONLY estilo
    ADD CONSTRAINT estilo_codigo_key
    UNIQUE (codigo);
--
-- Definition for index cerveja_codigo_key (OID = 45711) : 
--
ALTER TABLE ONLY cerveja
    ADD CONSTRAINT cerveja_codigo_key
    UNIQUE (codigo);
--
-- Definition for index cerveja_codigo_estilo_fkey (OID = 45713) : 
--
ALTER TABLE ONLY cerveja
    ADD CONSTRAINT cerveja_codigo_estilo_fkey
    FOREIGN KEY (codigo_estilo) REFERENCES estilo(codigo);
--
-- Data for sequence public.estilo_codigo_seq (OID = 45694)
--
SELECT pg_catalog.setval('estilo_codigo_seq', 10, true);
--
-- Data for sequence public.cerveja_codigo_seq (OID = 45702)
--
SELECT pg_catalog.setval('cerveja_codigo_seq', 8, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';

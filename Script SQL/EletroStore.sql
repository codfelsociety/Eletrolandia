CREATE TABLE produto (
    cod_produto        NUMBER(8) NOT NULL,
    cod_subcategoria   NUMBER(8) NOT NULL,
    cod_marca          NUMBER(8) NOT NULL,
    cod_frete          NUMBER(8) NOT NULL,
    cod_barras         NUMBER(8),
    nome               VARCHAR2(50) NOT NULL,
    descricao          VARCHAR2(200),
    estoque            NUMBER(8) NOT NULL,
    estoque_min        NUMBER(8),
    estoque_max        NUMBER(8),
    ativo              CHAR(1) NOT NULL,
    data_cadastro      DATE NOT NULL,
    on_line            NUMBER(1),
    limitado           NUMBER(1)
);
ALTER TABLE produto ADD CONSTRAINT produtos_pk PRIMARY KEY ( cod_produto );

CREATE TABLE artigo (
    cod_artigo   NUMBER(8) NOT NULL,
    cod_categoria      NUMBER(8) NOT NULL,
    descricao          VARCHAR2(25) NOT NULL
);

ALTER TABLE artigo ADD CONSTRAINT artigo_produto_pk PRIMARY KEY ( cod_artigo );

CREATE TABLE categoria_produto (
    cod_categoria   NUMBER(8) NOT NULL,
    descricao       VARCHAR2(50) NOT NULL
);

ALTER TABLE categoria_produto ADD CONSTRAINT categoria_produto_pk PRIMARY KEY ( cod_categoria );

CREATE TABLE cliente (
    cod_cliente   NUMBER(8) NOT NULL,
    cod_contato   NUMBER(8) NOT NULL,
    nome          VARCHAR2(50),
    sobrenome     VARCHAR2(50),
    gênero        VARCHAR2(1),
    cpf           VARCHAR2(11)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cod_cliente );

CREATE TABLE endereço (
    cod_endereço   NUMBER(8) NOT NULL,
    tipo           NUMBER(2) NOT NULL,
    cep            VARCHAR2(8),
    cidade         VARCHAR2(30),
    estado         VARCHAR2(30),
    bairro         VARCHAR2(30),
    rua            VARCHAR2(30),
    número         NUMBER(4),
    complemento    VARCHAR2(50)
);

ALTER TABLE endereço ADD CONSTRAINT endereco_pk PRIMARY KEY ( cod_endereço );

CREATE TABLE endereco_cliente (
    cod_endereco_cliente   NUMBER(8) NOT NULL,
    cod_endereco           NUMBER(8) NOT NULL,
    cod_cliente            NUMBER(8) NOT NULL
);

ALTER TABLE endereco_cliente ADD CONSTRAINT endereco_cliente_pk PRIMARY KEY ( cod_endereco_cliente );

CREATE TABLE especificacao (
    cod_especificacao   NUMBER(8) NOT NULL,
    descricao           VARCHAR2(50) NOT NULL,
    tipo_valor          CHAR(1) NOT NULL
);

ALTER TABLE especificacao ADD CONSTRAINT especificacoes_pk PRIMARY KEY ( cod_especificacao );

CREATE TABLE especificacao_artigo (
    cod_especificao_artigo   NUMBER(8) NOT NULL,
    cod_especificacao        NUMBER(8) NOT NULL,
    cod_artigo_produto       NUMBER(8) NOT NULL
);

ALTER TABLE especificacao_artigo ADD CONSTRAINT especificacao_artigo_pk PRIMARY KEY ( cod_especificao_artigo );

CREATE TABLE especificacao_pre_valores (
    cod_espec_pre_valor   NUMBER(8) NOT NULL,
    cod_especificacao     NUMBER(8) NOT NULL,
    valor                 VARCHAR2(80) NOT NULL
);

ALTER TABLE especificacao_pre_valores ADD CONSTRAINT especificacao_pre_valores_pk PRIMARY KEY ( cod_espec_pre_valor );

CREATE TABLE especificacao_produto (
    cod_especificacao_produto   NUMBER NOT NULL,
    cod_especificacao           NUMBER(8) NOT NULL,
    cod_prod                    NUMBER(8) NOT NULL,
    valor_espec                 VARCHAR2(80),
    cod_pre_valor               NUMBER(8)
);

ALTER TABLE especificacao_produto ADD CONSTRAINT especificacao_produto_pk PRIMARY KEY ( cod_especificacao_produto );

CREATE TABLE fornecedor (
    cod_fornecedor   NUMBER(8) NOT NULL,
    cod_endereço     NUMBER(8) NOT NULL,
    cod_contato      NUMBER(8) NOT NULL,
    nome             VARCHAR2(50),
    cnpj             VARCHAR2(15),
    ins_estadual     VARCHAR2(15)
);

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( cod_fornecedor );

CREATE TABLE frete (
    cod_frete     NUMBER(8) NOT NULL,
    peso          NUMBER,
    altura        NUMBER,
    largura       NUMBER,
    comprimento   NUMBER,
    fragil        NUMBER,
    isFree        NUMBER(1)
);
ALTER TABLE frete ADD CONSTRAINT frete_pk PRIMARY KEY ( cod_frete );

CREATE TABLE imagem_produto (
    cod_produto    NUMBER(8) NOT NULL,
    local_imagem   VARCHAR2(100) NOT NULL,
    descricao      VARCHAR2(50)
);

CREATE TABLE info_contato (
    cod_info_contato   NUMBER(8) NOT NULL,
    telefone           NUMBER(15),
    celular            NUMBER(15),
    email              VARCHAR2(70)
);

ALTER TABLE info_contato ADD CONSTRAINT info_contato_pk PRIMARY KEY ( cod_info_contato );

CREATE TABLE log_produto (
    cod_log_prod   NUMBER(8) NOT NULL,
    cod_produto    NUMBER(8) NOT NULL,
    data           DATE,
    custo          NUMBER(10,2),
    preco_venda    NUMBER(10,2)
);

ALTER TABLE log_produto ADD CONSTRAINT log_produto_pk PRIMARY KEY ( cod_log_prod );

CREATE TABLE marca (
    cod_marca   NUMBER(4) NOT NULL,
    descricao   VARCHAR2(50)
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( cod_marca );

CREATE TABLE mensagem_contato (
    cod_mensagem   NUMBER(8) NOT NULL,
    mensagem       VARCHAR2(300),
    remetente      VARCHAR2(100),
    nome           VARCHAR2(50),
    celular        VARCHAR2(20)
);

ALTER TABLE mensagem_contato ADD CONSTRAINT mensagem_contato_pk PRIMARY KEY ( cod_mensagem );

CREATE TABLE pagamento_venda (
    cod_pagamento   NUMBER(8) NOT NULL,
    cod_venda       NUMBER(8) NOT NULL,
    tipo_venda      NUMBER(1),
    valor           NUMBER(10,2)
);

ALTER TABLE pagamento_venda ADD CONSTRAINT pagamento_venda_pk PRIMARY KEY ( cod_pagamento );

CREATE TABLE produto_fornecedor (
    cod_prod_forn    NUMBER(8) NOT NULL,
    cod_prod         NUMBER(8) NOT NULL,
    cod_fornecedor   NUMBER(8) NOT NULL
);

ALTER TABLE produto_fornecedor ADD CONSTRAINT produto_fornecedor_pk PRIMARY KEY ( cod_prod_forn );

CREATE TABLE tipo_endereço (
    cod_tipo_endereco   NUMBER(2) NOT NULL,
    descricao           VARCHAR2(20)
);

ALTER TABLE tipo_endereço ADD CONSTRAINT tipo_endereço_pk PRIMARY KEY ( cod_tipo_endereco );

CREATE TABLE venda (
    cod_venda     NUMBER(8) NOT NULL,
    cod_info      NUMBER(8) NOT NULL,
    cod_cliente   NUMBER(8) NOT NULL,
    data_venda    DATE NOT NULL,
    tipo          VARCHAR2(20)
);

ALTER TABLE venda ADD CONSTRAINT venda_pk PRIMARY KEY ( cod_venda );

CREATE TABLE venda_info_entrega (
    cod_venda_info   NUMBER(8) NOT NULL,
    cod_endereco     NUMBER(8) NOT NULL,
    cod_contato      NUMBER(8) NOT NULL,
    nome             VARCHAR2(50)
);

ALTER TABLE venda_info_entrega ADD CONSTRAINT venda_info_pk PRIMARY KEY ( cod_venda_info );

CREATE TABLE venda_produto (
    cod           NUMBER(8) NOT NULL,
    cod_venda     NUMBER(8) NOT NULL,
    cod_produto   NUMBER(8) NOT NULL,
    preco_unit    NUMBER(10,2),
    quantidade    NUMBER(2),
    desconto      NUMBER(10,2)
);

ALTER TABLE venda_produto ADD CONSTRAINT venda_produto_pk PRIMARY KEY ( cod );

ALTER TABLE artigo ADD CONSTRAINT artigo_cat_prod_fk FOREIGN KEY ( cod_categoria )
    REFERENCES categoria_produto ( cod_categoria );

ALTER TABLE cliente ADD CONSTRAINT cliente_info_contato_fk FOREIGN KEY ( cod_contato )
    REFERENCES info_contato ( cod_info_contato );

ALTER TABLE endereco_cliente ADD CONSTRAINT endereco_cliente_cliente_fk FOREIGN KEY ( cod_cliente )
    REFERENCES cliente ( cod_cliente );

ALTER TABLE endereco_cliente ADD CONSTRAINT endereco_cliente_endereço_fk FOREIGN KEY ( cod_endereco )
    REFERENCES endereço ( cod_endereço );

ALTER TABLE endereço ADD CONSTRAINT endereço_tipo_endereço_fk FOREIGN KEY ( tipo )
    REFERENCES tipo_endereço ( cod_tipo_endereco );

ALTER TABLE especificacao_artigo ADD CONSTRAINT espec_artigo_produto_fk FOREIGN KEY ( cod_artigo_produto )
    REFERENCES artigo ( cod_subcategoria );

ALTER TABLE especificacao_artigo ADD CONSTRAINT espec_artigo_espec_fk FOREIGN KEY ( cod_especificacao )
    REFERENCES especificacao ( cod_especificacao );

ALTER TABLE especificacao_pre_valores ADD CONSTRAINT espec_pre_val_espec_fk FOREIGN KEY ( cod_especificacao )
    REFERENCES especificacao ( cod_especificacao );

ALTER TABLE especificacao_produto ADD CONSTRAINT espec_produto_espec_fk FOREIGN KEY ( cod_especificacao )
    REFERENCES especificacao ( cod_especificacao );

ALTER TABLE especificacao_produto ADD CONSTRAINT espec_prod_espec_pre_val_fk FOREIGN KEY ( cod_pre_valor )
    REFERENCES especificacao_pre_valores ( cod_espec_pre_valor );

ALTER TABLE especificacao_produto ADD CONSTRAINT espec_prod_prod_fk FOREIGN KEY ( cod_prod )
    REFERENCES produto ( cod_produto );

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_endereço_fk FOREIGN KEY ( cod_endereço )
    REFERENCES endereço ( cod_endereço );

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_info_contato_fk FOREIGN KEY ( cod_contato )
    REFERENCES info_contato ( cod_info_contato );

ALTER TABLE imagem_produto ADD CONSTRAINT imagem_produto_produto_fk FOREIGN KEY ( cod_produto )
    REFERENCES produto ( cod_produto );

ALTER TABLE log_produto ADD CONSTRAINT log_produto_produto_fk FOREIGN KEY ( cod_produto )
    REFERENCES produto ( cod_produto );

ALTER TABLE pagamento_venda ADD CONSTRAINT pagamento_venda_venda_fk FOREIGN KEY ( cod_venda )
    REFERENCES venda ( cod_venda );

ALTER TABLE produto_fornecedor ADD CONSTRAINT prod_forn_forn_fk FOREIGN KEY ( cod_fornecedor )
    REFERENCES fornecedor ( cod_fornecedor );

ALTER TABLE produto_fornecedor ADD CONSTRAINT prod_forn_prod_fk FOREIGN KEY ( cod_prod )
    REFERENCES produto ( cod_produto );

ALTER TABLE produto ADD CONSTRAINT produto_artigo_produto_fk FOREIGN KEY ( cod_subcategoria )
    REFERENCES artigo ( cod_subcategoria );

ALTER TABLE produto ADD CONSTRAINT produto_frete_fk FOREIGN KEY ( cod_frete )
    REFERENCES frete ( cod_frete );

ALTER TABLE produto ADD CONSTRAINT produto_marca_fk FOREIGN KEY ( cod_marca )
    REFERENCES marca ( cod_marca );

ALTER TABLE venda ADD CONSTRAINT venda_cliente_fk FOREIGN KEY ( cod_cliente )
    REFERENCES cliente ( cod_cliente );

ALTER TABLE venda_info_entrega ADD CONSTRAINT vend_info_entr_ender_fk FOREIGN KEY ( cod_endereco )
    REFERENCES endereço ( cod_endereço );

ALTER TABLE venda_info_entrega ADD CONSTRAINT vend_info_entr_info_con_fk FOREIGN KEY ( cod_contato )
    REFERENCES info_contato ( cod_info_contato );

ALTER TABLE venda_produto ADD CONSTRAINT venda_produto_produto_fk FOREIGN KEY ( cod_produto )
    REFERENCES produto ( cod_produto );

ALTER TABLE venda_produto ADD CONSTRAINT venda_produto_venda_fk FOREIGN KEY ( cod_venda )
    REFERENCES venda ( cod_venda );

ALTER TABLE venda ADD CONSTRAINT venda_venda_info_entrega_fk FOREIGN KEY ( cod_info )
    REFERENCES venda_info_entrega ( cod_venda_info );

CREATE SEQUENCE espec_pre_cod_espec_pre_valor START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER espec_pre_cod_espec_pre_valor BEFORE
    INSERT ON especificacao_pre_valores
    FOR EACH ROW
    WHEN (
        new.cod_espec_pre_valor IS NULL
    )
BEGIN
    :new.cod_espec_pre_valor := espec_pre_cod_espec_pre_valor.nextval;
END;
/

CREATE SEQUENCE prod_cod_produto_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER prod_cod_produto_trg BEFORE
    INSERT ON produto
    FOR EACH ROW
    WHEN (
        new.cod_produto IS NULL
    )
BEGIN
    :new.cod_produto := seq_produtos.nextval;
END;

CREATE TABLE max_seq(
    cod           NUMBER(8) NOT NULL,
    nome_seq      VARCHAR2(30) NOT NULL,
    valor_max     NUMBER(8) NOT NULL
);

CREATE SEQUENCE seq_produtos;
INSERT INTO max_seq VALUES(1,'seq_produtos',0);
CREATE SEQUENCE seq_cliente;
INSERT INTO max_seq VALUES(2,'seq_cliente',0);
CREATE SEQUENCE seq_fornecedor;
INSERT INTO max_seq VALUES(3,'seq_fornecedor',0);
CREATE SEQUENCE seq_especificacao;
INSERT INTO max_seq VALUES(4,'seq_especificacao',0);
CREATE SEQUENCE seq_marca;
INSERT INTO max_seq VALUES(5,'seq_marca',0);

CREATE SEQUENCE seq_categoria;
CREATE SEQUENCE seq_frete;
CREATE SEQUENCE seq_artigo;
CREATE SEQUENCE seq_espec_prod;
CREATE SEQUENCE seq_espec_artigo;
CREATE SEQUENCE seq_espec_pre_val;
CREATE SEQUENCE seq_prod_forn;
CREATE SEQUENCE seq_log_produto;

INSERT INTO categoria_produto VALUES(SEQ_CATEGORIA.NEXTVAL, 'Periféricos');
INSERT INTO categoria_produto VALUES(SEQ_CATEGORIA.NEXTVAL, 'Máquinas');
INSERT INTO categoria_produto VALUES(SEQ_CATEGORIA.NEXTVAL, 'Câmeras');
INSERT INTO categoria_produto VALUES(SEQ_CATEGORIA.NEXTVAL, 'Portáteis');
INSERT INTO categoria_produto VALUES(SEQ_CATEGORIA.NEXTVAL, 'Sala');

INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 1, 'Mouse');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 1, 'Webcam');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 1, 'Teclado');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 2, 'PC Gamer');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 2, 'Desktop CPU');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 2, 'Servidor');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 2, 'All in One');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 3, 'Filmadora');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 3, 'Go Pro');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 3, 'Digital');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 3, 'Profissional');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 4, 'Celular');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 4, 'Notebook');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 4, 'Tablet');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 5, 'TV');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 5, 'Rádio');
INSERT INTO artigo VALUES(seq_artigo.NEXTVAL, 5, 'Conversor');


INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Acer');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Asus');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Apple');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Samsung');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Nokia');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Sony');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Microsoft');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Positivo');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'HP');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Epson');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Tecpix');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'LG');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Lumia');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Google');
INSERT INTO marca VALUES(seq_marca.NEXTVAL, 'Original Orro');

INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'RAM',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'HD',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Processador',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Video',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'DPI',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Polegadas',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Frequencia',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Sinal',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Cor',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Camera',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Audio',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Rede',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Placa',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'Entradas',1);
INSERT INTO especificacao VALUES(seq_especificacao.NEXTVAL, 'IRDA',1);

INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 1,4 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 2,4 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 3,4 );

INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 1,5 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 2,5 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 3,5 );

INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 1,6 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 2,6 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 3,6 );

INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 1,7 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 2,7 );
INSERT INTO especificacao_artigo VALUES(seq_espec_artigo.NEXTVAL, 3,7 );

INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 1, '2Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 1, '4Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 1, '8Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 1, '16Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 1, '32Gb');

INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '50Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '100Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '250Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '500Gb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '1Tb');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 2, '2Tb');

INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 3, 'Intel Pentium');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 3, 'Intel Core 2 Duo');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 3, 'Intel i3');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 3, 'Intel i5');
INSERT INTO especificacao_pre_valores VALUES(seq_espec_pre_val.NEXTVAL, 3, 'Intel i7');

INSERT INTO frete VALUES(seq_frete.NEXTVAL, 2.5, 2.714, 2.54, 25, 1);
commit;



CREATE OR REPLACE PROCEDURE insert_produto(
	   p_cod_produto IN PRODUTO.COD_PRODUTO%TYPE,
	   p_cod_subcategoria IN PRODUTO.COD_SUBCATEGORIA%TYPE,
	   p_cod_marca IN PRODUTO.COD_MARCA%TYPE,
	   p_cod_frete IN PRODUTO.COD_FRETE%TYPE,
       p_cod_barras IN PRODUTO.COD_BARRAS%TYPE,
	   p_nome IN PRODUTO.NOME%TYPE,
       p_descricao IN PRODUTO.DESCRICAO%TYPE,
       p_estoque IN PRODUTO.ESTOQUE%TYPE,
       p_estoque_min IN PRODUTO.ESTOQUE_MIN%TYPE,
       p_estoque_max IN PRODUTO.ESTOQUE_MAX%TYPE,
       p_ativo IN PRODUTO.ATIVO%TYPE,
       p_online IN PRODUTO.ON_LINE%TYPE,
       p_limitado IN PRODUTO.LIMITADO%TYPE,
       p_data_cadastro IN VARCHAR2)
IS
BEGIN
  INSERT INTO produto 
  VALUES (p_cod_produto, p_cod_subcategoria,p_cod_marca, p_cod_frete, p_cod_barras, p_nome,
  p_descricao, p_estoque, p_estoque_min, p_estoque_max, p_ativo, TO_DATE(p_data_cadastro,'DD/MM/YYYY HH24:MI:SS'),
  p_online, p_limitado);
  COMMIT;
END;

INSERT INTO produto VALUES (seq_produtos.NEXTVAL,2,3,1,858475, 'teste', 'description', 10, 5, 20, 0,To_date ('20/05/2017 16:47:32', 'DD/MM/YYYY HH24:MI:SS'));



INSERT INTO produto_fornecedor VALUES(seq_prod_forn.NEXTVAL, 27, 3);

CREATE OR REPLACE PROCEDURE insert_produto_fornecedor(
	   p_cod_prod IN produto_fornecedor.cod_prod%TYPE,
	   p_cod_fornecedor IN produto_fornecedor.cod_fornecedor%TYPE)
IS
BEGIN
  INSERT INTO produto_fornecedor 
  VALUES (seq_prod_forn.NEXTVAL, p_cod_prod, p_cod_fornecedor);
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE insert_log_produto(
	   p_cod_produto IN log_produto.cod_produto%TYPE,
	   p_data IN VARCHAR2,
	   p_custo IN log_produto.custo%TYPE,       
	   p_preco_venda IN log_produto.preco_venda%TYPE)
IS
BEGIN
  INSERT INTO log_produto 
  VALUES (seq_log_produto.NEXTVAL,p_cod_produto, TO_DATE(p_data,'DD/MM/YYYY HH24:MI:SS'), p_custo, p_preco_venda);
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE insert_imagem_produto(
	   p_cod_produto IN imagem_produto.cod_produto%TYPE,
	   p_local_imagem IN imagem_produto.local_imagem%TYPE,
	   p_descricao IN imagem_produto.descricao%TYPE)
IS
BEGIN
  INSERT INTO imagem_produto
  VALUES (p_cod_produto, p_local_imagem, p_descricao);
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE insert_espec_prod(
	   p_cod_espec IN especificacao_produto.cod_especificacao%TYPE,
	   p_cod_prod IN especificacao_produto.cod_prod%TYPE,
	   p_valor_espec IN especificacao_produto.valor_espec%TYPE,
	   p_cod_pre_valor IN especificacao_produto.cod_pre_valor%TYPE)
IS
BEGIN
  INSERT INTO especificacao_produto
  VALUES (seq_espec_prod.NEXTVAL, p_cod_espec, p_cod_prod, p_valor_espec, p_cod_pre_valor);
  COMMIT;
END;

SELECT prod.cod_produto AS "cod", img.local_imagem AS "path"
from produto prod
RIGHT JOIN imagem_produto img
ON img.cod_produto = prod.cod_produto
WHERE prod.cod_produto = '63' 
and ROWNUM = 1;

commit;
SELECT prod.cod_produto AS cod, img.local_imagem, prod.nome, art.descricao AS artigo, cat.descricao AS categoria,
mar.descricao AS marca, prod.estoque,logprod.custo, logprod.preco_venda AS preco, 
(logprod.preco_venda - logprod.custo)*prod.estoque AS lucro_total ,prod.ativo AS status,prod.data_cadastro AS data
FROM produto prod
JOIN artigo art
ON art.cod_artigo = prod.cod_subcategoria
 full JOIN marca mar
ON mar.cod_marca = prod.cod_marca
JOIN categoria_produto cat
ON cat.cod_categoria = art.cod_categoria
JOIN 
(SELECT inn.* FROM (SELECT log2.*, (ROW_NUMBER() OVER(PARTITION BY cod_produto ORDER BY cod_log_prod DESC)) As Rank 
              FROM log_produto log2) inn WHERE inn.Rank=1) logprod
ON  prod.cod_produto = logprod.cod_produto
LEFT JOIN
(SELECT inn.* FROM (SELECT img2.*, (ROW_NUMBER() OVER(PARTITION BY cod_produto ORDER BY local_imagem DESC)) As Rank 
              FROM imagem_produto img2) inn WHERE inn.Rank=1) img
ON prod.cod_produto = img.cod_produto;

SELECT * FROM PRODUTO;

SELECT prod.COD_BARRAS, prod.NOME, prod.DESCRICAO, prod.ESTOQUE,
prod.ESTOQUE_MIN, prod.ESTOQUE_MAX, prod.ATIVO, prod.ON_LINE,
prod.LIMITADO,  prod.DATA_CADASTRO, prod.COD_SUBCATEGORIA, art.COD_CATEGORIA,
prod.COD_MARCA, logp.CUSTO, logp.PRECO_VENDA, fr.PESO, fr.ALTURA,
fr.COMPRIMENTO, fr.LARGURA, fr.FRAGIL, fr.ISFREE
FROM PRODUTO prod
JOIN ARTIGO art
ON prod.COD_SUBCATEGORIA = art.COD_ARTIGO
JOIN LOG_PRODUTO logp
ON logp.COD_PRODUTO = prod.COD_PRODUTO
JOIN FRETE fr
ON fr.COD_FRETE = prod.COD_FRETE
WHERE prod.COD_PRODUTO = 121 ORDER BY logp.cod_log_prod desc;

SELECT prodf.cod_fornecedor, forn.nome
from produto_fornecedor prodf
JOIN fornecedor forn
ON prodf.cod_fornecedor = forn.cod_fornecedor
where prodf.cod_prod = 84;

SELECT img.LOCAL_IMAGEM
FROM IMAGEM_PRODUTO img
WHERE img.COD_PRODUTO = 85;

SELECT ep.COD_PRE_VALOR
FROM ESPECIFICACAO_PRODUTO ep
WHERE ep.COD_PROD = 117
AND ep.COD_ESPECIFICACAO = 3;

CREATE OR REPLACE PROCEDURE UpdateProduto(
	   p_cod_subcategoria IN produto.cod_subcategoria%TYPE,
	   p_cod_marca IN produto.cod_marca%TYPE,
	   p_cod_barras IN produto.cod_barras%TYPE,
	   p_nome IN produto.nome%TYPE,
	   p_descricao IN produto.descricao%TYPE,
	   p_estoque IN produto.estoque%TYPE,
	   p_estoque_min IN produto.estoque_min%TYPE,
	   p_estoque_max IN produto.estoque_max%TYPE,
	   p_ativo IN produto.ativo%TYPE,
	   p_online IN produto.on_line%TYPE,
	   p_limitado IN produto.limitado%TYPE,
       p_cod_produto IN produto.cod_produto%TYPE)
IS
BEGIN
  UPDATE produto SET cod_subcategoria = p_cod_subcategoria,
  cod_marca = p_cod_marca, cod_barras = p_cod_barras, 
  nome = p_nome, descricao = p_descricao, estoque= p_estoque,
  estoque_min = p_estoque_min, estoque_max = p_estoque_max,
  ativo = p_ativo, on_line = p_online, limitado = p_limitado
  WHERE cod_produto = p_cod_produto;
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE UpdateFrete(
        p_cod_frete IN frete.cod_frete%TYPE,
        p_peso IN frete.peso%TYPE,
        p_altura IN frete.altura%TYPE,
        p_largura IN frete.largura%TYPE,
        p_comprimento IN frete.comprimento%TYPE,
        p_isfree IN frete.isfree%TYPE,
        p_fragil IN frete.fragil%TYPE)
IS BEGIN
    UPDATE frete SET peso = p_peso,
    altura = p_altura, largura = p_largura,
    comprimento = p_comprimento, isfree = p_isfree,
    fragil = p_fragil WHERE cod_frete = p_cod_frete;
COMMIT;
END;

EXECUTE UpdateFrete(124, 30, 10, 10, 10, 1, 1);

CREATE OR REPLACE PROCEDURE DeleteImagens (p_cod_produto IN imagem_produto.cod_produto%TYPE)
IS BEGIN
    DELETE FROM IMAGEM_PRODUTO WHERE cod_produto = p_cod_produto;
COMMIT;
END;

CREATE OR REPLACE PROCEDURE DeleteProdForn (p_cod_produto IN produto_fornecedor.cod_prod%TYPE)
IS BEGIN
    DELETE FROM produto_fornecedor WHERE cod_prod = p_cod_produto;
COMMIT;
END;


CREATE OR REPLACE PROCEDURE DeleteEspecProd (p_cod_produto IN especificacao_produto.cod_prod%TYPE)
IS BEGIN
    DELETE FROM especificacao_produto WHERE cod_prod = p_cod_produto;
COMMIT;
END;
execute DeleteEspecProd(0);




CREATE OR REPLACE PROCEDURE DeleteProduto (p_cod_produto IN produto.cod_produto%TYPE, p_cod_frete IN produto.cod_frete%TYPE)
IS BEGIN
    DELETE FROM Produto WHERE cod_produto = p_cod_produto;
    DELETE FROM Produto_Fornecedor WHERE cod_prod = p_cod_produto;
    DELETE FROM Imagem_Produto WHERE cod_produto = p_cod_produto;
    DELETE FROM Frete WHERE cod_frete = p_cod_frete;
    DELETE FROM Log_Produto WHERE cod_produto = p_cod_produto;
    DELETE FROM Especificacao_Produto WHERE cod_prod = p_cod_produto;
COMMIT;
END;


SELECT prod.nome, logp.custo, logp.preco_venda
FROM produto prod
JOIN 
(SELECT inn.* FROM (SELECT log2.*, (ROW_NUMBER() OVER(PARTITION BY cod_produto ORDER BY cod_log_prod DESC)) As Rank 
              FROM log_produto log2) inn WHERE inn.Rank=1) logp
ON  prod.cod_produto = logp.cod_produto;

CREATE OR REPLACE PROCEDURE insert_fornecedores(
	   p_cod_fornecedor IN fornecedor.cod_fornecedor%TYPE,
	   p_cod_endereco IN fornecedor.cod_endereço%TYPE,
	   p_cod_contato IN fornecedor.cod_fornecedor%TYPE,
	   p_cod_nome IN fornecedor.cod_fornecedor%TYPE,
	   p_cod_cnpj IN fornecedor.cod_fornecedor%TYPE,
	  
BEGIN
  INSERT INTO especificacao_produto
  VALUES (seq_espec_prod.NEXTVAL, p_cod_espec, p_cod_prod, p_valor_espec, p_cod_pre_valor);
  COMMIT;
END;
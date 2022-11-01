S-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2022-03-01 10:50:09 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g

DELETE t_mc_bairro;
DELETE t_mc_categoria_prod;
DELETE t_mc_cidade;
DELETE t_mc_cli_fisica;
DELETE t_mc_cli_juridica;
DELETE t_mc_cliente;
DELETE t_mc_depto;
DELETE t_mc_end_cli;
DELETE t_mc_end_func;
DELETE t_mc_estado;
DELETE t_mc_funcionario;
DELETE t_mc_logradouro;
DELETE t_mc_produto;
DELETE t_mc_sgv_ocorrencia_sac;
DELETE t_mc_sgv_produto_video;
DELETE t_mc_sgv_sac;
DELETE t_mc_sgv_visualizacao_video;

DROP SEQUENCE SQ_MC_CATEGORIA_PROD;
DROP SEQUENCE SQ_MC_PRODUTO;
DROP SEQUENCE SQ_MC_VISUALIZACAO_VIDEO;
DROP SEQUENCE SQ_MC_SAC;
DROP SEQUENCE SQ_MC_CLIENTE;
DROP SEQUENCE SQ_MC_FUNCIONARIO;
DROP SEQUENCE SQ_MC_DEPTO;
DROP SEQUENCE SQ_MC_LOGRADOURO;
DROP SEQUENCE SQ_MC_BAIRRO;
DROP SEQUENCE SQ_MC_CIDADE;

DROP TABLE t_mc_bairro CASCADE CONSTRAINTS;

DROP TABLE t_mc_categoria_prod CASCADE CONSTRAINTS;

DROP TABLE t_mc_cidade CASCADE CONSTRAINTS;

DROP TABLE t_mc_cli_fisica CASCADE CONSTRAINTS;

DROP TABLE t_mc_cli_juridica CASCADE CONSTRAINTS;

DROP TABLE t_mc_cliente CASCADE CONSTRAINTS;

DROP TABLE t_mc_depto CASCADE CONSTRAINTS;

DROP TABLE t_mc_end_cli CASCADE CONSTRAINTS;

DROP TABLE t_mc_end_func CASCADE CONSTRAINTS;

DROP TABLE t_mc_estado CASCADE CONSTRAINTS;

DROP TABLE t_mc_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_mc_logradouro CASCADE CONSTRAINTS;

DROP TABLE t_mc_produto CASCADE CONSTRAINTS;

DROP TABLE t_mc_sgv_ocorrencia_sac CASCADE CONSTRAINTS;

DROP TABLE t_mc_sgv_produto_video CASCADE CONSTRAINTS;

DROP TABLE t_mc_sgv_sac CASCADE CONSTRAINTS;

DROP TABLE t_mc_sgv_visualizacao_video CASCADE CONSTRAINTS;

-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2022-03-01 10:57:57 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_mc_bairro (
    cd_bairro       NUMBER(8) NOT NULL,
    cd_cidade       NUMBER(8) NOT NULL,
    nm_bairro       VARCHAR2(45),
    nm_zona_bairro  VARCHAR2(20)
);

COMMENT ON COLUMN t_mc_bairro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_bairro.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_bairro.nm_bairro IS
    'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_bairro.nm_zona_bairro IS
    'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.';

ALTER TABLE t_mc_bairro ADD CONSTRAINT pk_mc_bairro PRIMARY KEY ( cd_bairro );

CREATE TABLE t_mc_categoria_prod (
    cd_categoria  NUMBER NOT NULL,
    tp_categoria  CHAR(1) NOT NULL,
    ds_categoria  VARCHAR2(500) NOT NULL,
    dt_inicio     DATE,
    dt_termino    DATE,
    st_categoria  CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_mc_categoria_prod.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN t_mc_categoria_prod.tp_categoria IS
    'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_categoria_prod.ds_categoria IS
    'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.';

COMMENT ON COLUMN t_mc_categoria_prod.dt_inicio IS
    'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.';

COMMENT ON COLUMN t_mc_categoria_prod.dt_termino IS
    'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.';

COMMENT ON COLUMN t_mc_categoria_prod.st_categoria IS
    'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

ALTER TABLE t_mc_categoria_prod
    ADD CONSTRAINT ck_mc_categoria_st_cat CHECK ( st_categoria IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_categoria_prod ADD CONSTRAINT pk_mc_categoria PRIMARY KEY ( cd_categoria );

CREATE TABLE t_mc_cidade (
    cd_cidade  NUMBER(8) NOT NULL,
    sg_estado  CHAR(2) NOT NULL,
    nm_cidade  VARCHAR2(60) NOT NULL,
    cd_ibge    NUMBER(8),
    nr_ddd     NUMBER(3)
);

COMMENT ON COLUMN t_mc_cidade.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_cidade.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_cidade.nm_cidade IS
    'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_cidade.cd_ibge IS
    'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.';

COMMENT ON COLUMN t_mc_cidade.nr_ddd IS
    'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.';

ALTER TABLE t_mc_cidade ADD CONSTRAINT pk_mc_cidade PRIMARY KEY ( cd_cidade );

CREATE TABLE t_mc_cli_fisica (
    nr_cliente         NUMBER(10) NOT NULL,
    dt_nascimento      DATE NOT NULL,
    fl_sexo_biologico  CHAR(1) NOT NULL,
    ds_genero          VARCHAR2(100),
    nr_cpf             VARCHAR2(14) NOT NULL
);

COMMENT ON COLUMN t_mc_cli_fisica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN t_mc_cli_fisica.dt_nascimento IS
    'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ';

COMMENT ON COLUMN t_mc_cli_fisica.fl_sexo_biologico IS
    'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. ';

COMMENT ON COLUMN t_mc_cli_fisica.ds_genero IS
    'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_cli_fisica.nr_cpf IS
    'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ';

ALTER TABLE t_mc_cli_fisica ADD CONSTRAINT pk_mc_cli_fisica PRIMARY KEY ( nr_cliente );

CREATE TABLE t_mc_cli_juridica (
    nr_cliente    NUMBER(10) NOT NULL,
    dt_fundacao   DATE NOT NULL,
    nr_cnpj       VARCHAR2(20) NOT NULL,
    nr_inscr_est  VARCHAR2(15)
);

COMMENT ON COLUMN t_mc_cli_juridica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN t_mc_cli_juridica.dt_fundacao IS
    'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_cli_juridica.nr_cnpj IS
    'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_cli_juridica.nr_inscr_est IS
    'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional';

ALTER TABLE t_mc_cli_juridica ADD CONSTRAINT pk_mc_cli_juridica PRIMARY KEY ( nr_cliente );

CREATE TABLE t_mc_cliente (
    nr_cliente       NUMBER(10) NOT NULL,
    nm_cliente       VARCHAR2(160) NOT NULL,
    qt_estrelas      NUMBER(1) NOT NULL,
    vl_medio_compra  NUMBER(10, 2),
    st_cliente       CHAR(1) NOT NULL,
    ds_email         VARCHAR2(100) NOT NULL,
    nr_telefone      VARCHAR2(20),
    nm_login         VARCHAR2(50) NOT NULL,
    ds_senha         VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_mc_cliente.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.';

COMMENT ON COLUMN t_mc_cliente.nm_cliente IS
    'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_cliente.qt_estrelas IS
    'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.';

COMMENT ON COLUMN t_mc_cliente.vl_medio_compra IS
    'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.';

COMMENT ON COLUMN t_mc_cliente.st_cliente IS
    'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN t_mc_cliente.ds_email IS
    'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.';

COMMENT ON COLUMN t_mc_cliente.nr_telefone IS
    'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.';

COMMENT ON COLUMN t_mc_cliente.nm_login IS
    'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.';

COMMENT ON COLUMN t_mc_cliente.ds_senha IS
    'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

ALTER TABLE t_mc_cliente ADD CONSTRAINT pk_mc_cliente PRIMARY KEY ( nr_cliente );

ALTER TABLE t_mc_cliente ADD CONSTRAINT uk_mc_cliente_nm_login UNIQUE ( nm_login );

CREATE TABLE t_mc_depto (
    cd_depto  NUMBER(3) NOT NULL,
    nm_depto  VARCHAR2(100) NOT NULL,
    st_depto  CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_mc_depto.cd_depto IS
    'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_depto.nm_depto IS
    'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_depto.st_depto IS
    'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.';

ALTER TABLE t_mc_depto
    ADD CONSTRAINT ck_mc_depto_st_depto CHECK ( st_depto IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_depto ADD CONSTRAINT pk_mc_depto PRIMARY KEY ( cd_depto );

CREATE TABLE t_mc_end_cli (
    nr_cliente          NUMBER(10) NOT NULL,
    cd_logradouro_cli   NUMBER(10) NOT NULL,
    nr_end              NUMBER(8) NOT NULL,
    ds_complemento_end  VARCHAR2(80),
    dt_inicio           DATE,
    dt_termino          DATE,
    st_end              CHAR(1)
);

COMMENT ON COLUMN t_mc_end_cli.nr_cliente IS
    'Esta coluna irá receber o número do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_end_cli.cd_logradouro_cli IS
    'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_end_cli.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN t_mc_end_cli.ds_complemento_end IS
    'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.';

COMMENT ON COLUMN t_mc_end_cli.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN t_mc_end_cli.dt_termino IS
    'Data de término do endereço associado ao cliente.';

COMMENT ON COLUMN t_mc_end_cli.st_end IS
    'Status do endereço. (A)itvo ou (I)nativo.';

ALTER TABLE t_mc_end_cli
    ADD CONSTRAINT ck_mc_end_cli_st_end CHECK ( st_end IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_end_cli ADD CONSTRAINT pk_mc_end_cli PRIMARY KEY ( nr_cliente,
                                                                    cd_logradouro_cli );

CREATE TABLE t_mc_end_func (
    cd_funcionario      NUMBER(10) NOT NULL,
    cd_logradouro       NUMBER(10) NOT NULL,
    nr_end              NUMBER(8) NOT NULL,
    ds_complemento_end  VARCHAR2(80),
    dt_inicio           DATE NOT NULL,
    dt_termino          DATE,
    st_end              CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_mc_end_func.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN t_mc_end_func.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN t_mc_end_func.dt_termino IS
    'Data de término do endereço associado ao cliente.';

ALTER TABLE t_mc_end_func
    ADD CONSTRAINT ck_mc_end_func_st_end CHECK ( st_end IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_end_func ADD CONSTRAINT pk_mc_end_func_pk PRIMARY KEY ( cd_funcionario,
                                                                         cd_logradouro );

CREATE TABLE t_mc_estado (
    sg_estado  CHAR(2) NOT NULL,
    nm_estado  VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_mc_estado.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_estado.nm_estado IS
    'Esta coluna irá receber o nome do estado';

ALTER TABLE t_mc_estado ADD CONSTRAINT pk_mc_estado PRIMARY KEY ( sg_estado );

CREATE TABLE t_mc_funcionario (
    cd_funcionario     NUMBER(10) NOT NULL,
    cd_depto           NUMBER(3) NOT NULL,
    cd_gerente         NUMBER(10),
    nm_funcionario     VARCHAR2(160),
    dt_nascimento      DATE NOT NULL,
    fl_sexo_biologico  CHAR(1),
    ds_genero          VARCHAR2(100),
    ds_cargo           VARCHAR2(80) NOT NULL,
    vl_salario         NUMBER(10, 2),
    ds_email           VARCHAR2(80),
    st_func            CHAR(1),
    dt_cadastramento   DATE,
    dt_desligamento    DATE
);

COMMENT ON COLUMN t_mc_funcionario.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_funcionario.cd_depto IS
    'Esta coluna irá receber o codigo do departamento onde o funcionario trabalha  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_funcionario.cd_gerente IS
    'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_funcionario.nm_funcionario IS
    'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_funcionario.dt_nascimento IS
    'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_funcionario.fl_sexo_biologico IS
    'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)';

COMMENT ON COLUMN t_mc_funcionario.ds_genero IS
    'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_funcionario.ds_cargo IS
    'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_funcionario.vl_salario IS
    'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_funcionario.ds_email IS
    'Esta coluna irá receber o email do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_funcionario.st_func IS
    'Essa coluna irá armazenar o stauts do funcionário da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN t_mc_funcionario.dt_cadastramento IS
    'Data de cadastramento do Funcionario';

COMMENT ON COLUMN t_mc_funcionario.dt_desligamento IS
    'Data de desligamento  do Funcionario. Seu conteúdo é opcional.';

ALTER TABLE t_mc_funcionario
    ADD CONSTRAINT ck_mc_funcionario_st_func CHECK ( st_func IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_funcionario ADD CONSTRAINT pk_mc_funcionario PRIMARY KEY ( cd_funcionario );

CREATE TABLE t_mc_logradouro (
    cd_logradouro  NUMBER(10) NOT NULL,
    cd_bairro      NUMBER(8) NOT NULL,
    nm_logradouro  VARCHAR2(160) NOT NULL,
    nr_cep         NUMBER(8)
);

COMMENT ON COLUMN t_mc_logradouro.cd_logradouro IS
    'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_logradouro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_logradouro.nm_logradouro IS
    'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_logradouro.nr_cep IS
    'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.';

ALTER TABLE t_mc_logradouro ADD CONSTRAINT pk_mc_logradouro PRIMARY KEY ( cd_logradouro );

CREATE TABLE t_mc_produto (
    cd_produto         NUMBER(10) NOT NULL,
    cd_categoria       NUMBER NOT NULL,
    nr_cd_barras_prod  VARCHAR2(50),
    ds_produto         VARCHAR2(80) NOT NULL,
    vl_unitario        NUMBER(8, 2) NOT NULL,
    tp_embalagem       VARCHAR2(15),
    st_produto         CHAR(1),
    vl_perc_lucro      NUMBER(8, 2),
    ds_completa_prod   VARCHAR2(4000) NOT NULL
);

COMMENT ON COLUMN t_mc_produto.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN t_mc_produto.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN t_mc_produto.nr_cd_barras_prod IS
    'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN t_mc_produto.ds_produto IS
    'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.';

COMMENT ON COLUMN t_mc_produto.vl_unitario IS
    'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ';

COMMENT ON COLUMN t_mc_produto.tp_embalagem IS
    'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.';

COMMENT ON COLUMN t_mc_produto.st_produto IS
    'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN t_mc_produto.vl_perc_lucro IS
    'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN t_mc_produto.ds_completa_prod IS
    'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.';

ALTER TABLE t_mc_produto
    ADD CONSTRAINT ck_mc_produto_st_status CHECK ( st_produto IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_produto ADD CONSTRAINT pk_mc_produto PRIMARY KEY ( cd_produto );

CREATE TABLE t_mc_sgv_ocorrencia_sac (
    nr_ocorrencia_sac             NUMBER NOT NULL,
    dt_abertura_sac               DATE,
    hr_abertura_sac               NUMBER(2),
    ds_tipo_classificacao_sac     VARCHAR2(30) NOT NULL,
    ds_indice_satisfacao_atd_sac  VARCHAR2(30),
    cd_categoria_prod             NUMBER NOT NULL,
    nm_tipo_categoria_prod        VARCHAR2(25) NOT NULL,
    ds_categoria_prod             VARCHAR2(500) NOT NULL,
    cd_produto                    NUMBER(10),
    ds_produto                    VARCHAR2(80) NOT NULL,
    tp_embalagem                  VARCHAR2(15),
    vl_unitario_produto           NUMBER(10, 2) NOT NULL,
    vl_perc_lucro                 NUMBER(8, 2),
    vl_unitario_lucro_produto     NUMBER(8, 2),
    sg_estado                     CHAR(2) NOT NULL,
    nm_estado                     VARCHAR2(30) NOT NULL,
    nm_cidade                     VARCHAR2(60) NOT NULL,
    nm_bairro                     VARCHAR2(45) NOT NULL,
    nr_cliente                    NUMBER(10) NOT NULL,
    nm_cliente                    VARCHAR2(160) NOT NULL,
    qt_estrelas_cliente           NUMBER(1) NOT NULL,
    vl_icms_produto               NUMBER(8, 2)
);

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nr_ocorrencia_sac IS
    'Essa coluna irá armazenar a chave primária da tabela ocorrência SAC, que será utilizada pela area de negócio da Melhores  Compras.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.dt_abertura_sac IS
    'Essa coluna  irá  receber a data e horário do chamado  SAC aberto pelo cliente. Seu conteudo deve ser obrigatório e deve ser uma cópia dos dados da coluna DT_ABERTURA_SAC na  tabela T_MC_SGV_SAC.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac IS
    'Essa coluna  irá  receber a descrição da classficação do tipo de chamado SAC. O tipo do chamado SAC aberto pelo cliente. Seu conteúdo deve ser  obrigatório e os possíveis valores são: Sugestão; Dúvida ou  Elogio. Esses valores devem ser calculados a partir do conteúdo da coluna TP_SAC na tabela T_MC_SGV_SAC.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.ds_indice_satisfacao_atd_sac IS
    'Essa coluna irá receber a descrição do índice de satisfação  do cliente  perante o chamado aberto no SAC das Melhores Compras. Esse conteúdo pode ser recuperado na tabela ORCL da FIAP pf0110.fun_gera_indice_sac_cli e deve ser selecionado sempre que necessário.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.cd_categoria_prod IS
    'Essa coluna irá receber o código da  categoria do produto  e seu conteúdo deve ser obrigatório. Esse código deve ser uma cópia dos dados da coluna CD_CATEGORIA  na tabela T_MC_CATEGORIA_PROD.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nm_tipo_categoria_prod IS
    'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser Vídeo ou Produdto. Seu conteúdo deve ser obrigatório e deve ser transformado a partir da coluna TP_CATEGORIA na tabela T_MC_CATEGORIA_PROD.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.ds_categoria_prod IS
    'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão. Essa descrição  deve ser uma cópia dos dados da coluna DS_CATEGORIA na tabela T_MC_CATEGORIA_PROD.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.cd_produto IS
    'Essa coluna irá receber o código do produto e seu conteúdo deve ser obrigatório. Essa descrição  deve ser uma cópia dos dados da coluna CD_PRODUTO na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.ds_produto IS
    'Essa coluna irá receber a descrição do produto e seu conteúdo deve ser obrigatório. Essa descrição  deve ser uma cópia dos dados da coluna DS_PRODUTO na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.tp_embalagem IS
    'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional e deve ser uma cópia da coluna TP_EMBALAGEM na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.vl_unitario_produto IS
    'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 e  deve ser uma cópia dos dados da coluna VL_UNITARIO na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.vl_perc_lucro IS
    'Essa coluna irá armazenar o valor percentual  do lucro sobre o produto ofertado. Seu conteúdo deve ser uma cópia dos dados da coluna VL_PERC_LUCRO na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.vl_unitario_lucro_produto IS
    'Essa coluna irá armazenar o valor do lucro unitario do lucro sobre o produto ofertado. Seu conteúdo deve ser calculado sobre a seguinte formula: conteúdo da coluna (VL_PERC_LUCRO / 100 ) * VL_UNITARIO_PRODUTO. Esses valores se  encontram na tabela T_MC_PRODUTO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório e deve ser uma cópia dos dados da coluna SG_ESTADO  na tabela T_MC_ESTADO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nm_estado IS
    'Esta coluna ira receber a descrição do nome  do Estado. Esse conteúdo é obrigatório e deve ser uma cópia dos dados da coluna NM_ESTADO  na tabela T_MC_ESTADO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nm_cidade IS
    'Esta coluna ira receber a descrição do nome  da Cidade. Esse conteúdo é obrigatório e deve ser uma cópia dos dados da coluna NM_CIDADE  na tabela T_MC_CIDADE.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nm_bairro IS
    'Esta coluna ira receber a descrição do nome  do  Bairro. Esse conteúdo é obrigatório e deve ser uma cópia dos dados da coluna NM_BAIRRO na tabela T_MC_BAIRRO.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nr_cliente IS
    'Essa coluna irá receber o código do nome do cliente  e seu conteúdo deve ser obrigatório. Essa descrição  deve ser uma cópia dos dados da coluna NR_CLIENTE  na tabela T_MC_CLIENTE.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.nm_cliente IS
    'Essa coluna irá receber o  nome do cliente  e seu conteúdo deve ser obrigatório. Essa descrição  deve ser uma cópia dos dados da coluna NM_CLIENTE  na tabela T_MC_CLIENTE.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.qt_estrelas_cliente IS
    'Essa coluna irá receber a quantidade de estrelas do cliente  e seu conteúdo deve ser obrigatório. Esse valor deve ser uma cópia dos dados da coluna QT_ESTRELAS  na tabela T_MC_CLIENTE.';

COMMENT ON COLUMN t_mc_sgv_ocorrencia_sac.vl_icms_produto IS
    'Essa coluna irá armazenar o valor médio do ICMS pago sobre o produto ofertado a partir do Estado onde o cliente solicita a entrega. Seu conteúdo deve ser calculado sobre a seguinte formula: conteúdo da coluna (VL_PERC_ALIQUOTA_MEDIA / 100 ) * VL_UNITARIO_PRODUTO. O valor da alíquota é extraído da procedure prc_pega_aliquota_media_ICMS e o valor unitário do produto se  encontra na tabela T_MC_PRODUTO.';

ALTER TABLE t_mc_sgv_ocorrencia_sac ADD CONSTRAINT pk_mc_ocorrencia_sac PRIMARY KEY ( nr_ocorrencia_sac );

CREATE TABLE t_mc_sgv_produto_video (
    cd_produto          NUMBER(10) NOT NULL,
    nr_sequencia        NUMBER(3) NOT NULL,
    cd_categoria        NUMBER NOT NULL,
    vd_produto          BLOB,
    tp_video_prod       VARCHAR2(10),
    ds_path_video_prod  VARCHAR2(500),
    st_video_prod       CHAR(1)
);

COMMENT ON COLUMN t_mc_sgv_produto_video.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN t_mc_sgv_produto_video.nr_sequencia IS
    'Essa coluna irá armazenar a sequencia do vídeo a partir do codigo do produto. Sempre o primeiro vídeo de determinado  produto deve iniciar com o número 1. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_sgv_produto_video.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN t_mc_sgv_produto_video.vd_produto IS
    'Essa coluna irá armazenar oo vídeo do produto no formato que melhor lhe  convier.  Para utilizar essa coluna tenha acesso a documentação oficial da Oracle. Seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_sgv_produto_video.tp_video_prod IS
    'Essa coluna irá armazenar o tipo do  vídeo do produto. Seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_sgv_produto_video.ds_path_video_prod IS
    'Essa coluna irá armazenar o caminho de acesso (link) contendo o  vídeo do produto. Seu conteúdo é opcional.';

COMMENT ON COLUMN t_mc_sgv_produto_video.st_video_prod IS
    'Essa coluna irá armazenar o stauts do vídeo do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

ALTER TABLE t_mc_sgv_produto_video
    ADD CONSTRAINT ck_mc_sgv_prd_video_st_vidprd CHECK ( st_video_prod IN (
        'A',
        'I'
    ) );

ALTER TABLE t_mc_sgv_produto_video ADD CONSTRAINT pk_mc_produto_imagem PRIMARY KEY ( nr_sequencia,
                                                                                     cd_produto );

CREATE TABLE t_mc_sgv_sac (
    nr_sac                    NUMBER NOT NULL,
    nr_cliente                NUMBER(10) NOT NULL,
    cd_produto                NUMBER(10) NOT NULL,
    cd_funcionario            NUMBER(10),
    ds_detalhada_sac          CLOB,
    dt_abertura_sac           DATE,
    hr_abertura_sac           NUMBER(2),
    dt_atendimento            DATE,
    hr_atendimento_sac        NUMBER(2),
    nr_tempo_total_sac        NUMBER(10),
    ds_detalhada_retorno_sac  CLOB,
    tp_sac                    CHAR(1) NOT NULL,
    st_sac                    CHAR(1),
    nr_indice_satisfacao      NUMBER(2)
);

COMMENT ON COLUMN t_mc_sgv_sac.nr_sac IS
    'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a Sequence  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.';

COMMENT ON COLUMN t_mc_sgv_sac.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN t_mc_sgv_sac.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN t_mc_sgv_sac.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN t_mc_sgv_sac.ds_detalhada_sac IS
    'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_sgv_sac.dt_abertura_sac IS
    'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_sgv_sac.hr_abertura_sac IS
    'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN t_mc_sgv_sac.dt_atendimento IS
    'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..';

COMMENT ON COLUMN t_mc_sgv_sac.hr_atendimento_sac IS
    'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.';

COMMENT ON COLUMN t_mc_sgv_sac.nr_tempo_total_sac IS
    'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.';

COMMENT ON COLUMN t_mc_sgv_sac.ds_detalhada_retorno_sac IS
    'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.';

COMMENT ON COLUMN t_mc_sgv_sac.tp_sac IS
    'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (S)ugestão; (D)úvida ou  (E)logio.';

COMMENT ON COLUMN t_mc_sgv_sac.st_sac IS
    'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.';

COMMENT ON COLUMN t_mc_sgv_sac.nr_indice_satisfacao IS
    'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.';

ALTER TABLE t_mc_sgv_sac ADD CONSTRAINT pk_mc_sgv_sac PRIMARY KEY ( nr_sac );

CREATE TABLE t_mc_sgv_visualizacao_video (
    cd_visualizacao_video  NUMBER(10) NOT NULL,
    nr_cliente             NUMBER(10),
    cd_produto             NUMBER(10) NOT NULL,
    dt_visualizacao        DATE NOT NULL,
    nr_hora_visualizacao   NUMBER(2) NOT NULL,
    nr_minuto_video        NUMBER(2) NOT NULL,
    nr_segundo_video       NUMBER(2) NOT NULL
);

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.cd_visualizacao_video IS
    'Essa coluna irá armazenar a chave primária da tabela de visualização do vídeo, onde a cada click que o usuario logado ou anônimo realizar, será anotado o acesso realizado.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.dt_visualizacao IS
    'Essa  coluna  irá  receber a data da visualização feita pelo  usuário no formato dd/mm/yyyy. Essa coluna é obrigatória.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.nr_hora_visualizacao IS
    'Essa  coluna  irá  receber o horário no formato HH24 da visualização feita pelo  usuário. Essa coluna é obrigatória.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.nr_minuto_video IS
    'Essa  coluna  irá  receber o horário do minuto do vídeo quando foi feita a visualização pelo  usuário. Essa coluna é obrigatória e os valores possíveis estão entre 00 e 59, representando os minutos.';

COMMENT ON COLUMN t_mc_sgv_visualizacao_video.nr_segundo_video IS
    'Essa  coluna  irá  receber o horário dos segundos do vídeo quando foi feita a visualização pelo  usuário. Essa coluna é obrigatória e os valores possíveis estão entre 00 e 59, representando os minutos.';

ALTER TABLE t_mc_sgv_visualizacao_video ADD CONSTRAINT pk_mc_sgv_visualizacao_video PRIMARY KEY ( cd_visualizacao_video );

ALTER TABLE t_mc_bairro
    ADD CONSTRAINT fk_mc_bairro_cidade FOREIGN KEY ( cd_cidade )
        REFERENCES t_mc_cidade ( cd_cidade );

ALTER TABLE t_mc_sgv_produto_video
    ADD CONSTRAINT fk_mc_categoria_video FOREIGN KEY ( cd_categoria )
        REFERENCES t_mc_categoria_prod ( cd_categoria );

ALTER TABLE t_mc_cidade
    ADD CONSTRAINT fk_mc_cidade_estado FOREIGN KEY ( sg_estado )
        REFERENCES t_mc_estado ( sg_estado );

ALTER TABLE t_mc_end_cli
    ADD CONSTRAINT fk_mc_cliente_end FOREIGN KEY ( nr_cliente )
        REFERENCES t_mc_cliente ( nr_cliente );

ALTER TABLE t_mc_cli_fisica
    ADD CONSTRAINT fk_mc_cliente_fisica FOREIGN KEY ( nr_cliente )
        REFERENCES t_mc_cliente ( nr_cliente );

ALTER TABLE t_mc_cli_juridica
    ADD CONSTRAINT fk_mc_cliente_juridica FOREIGN KEY ( nr_cliente )
        REFERENCES t_mc_cliente ( nr_cliente );

ALTER TABLE t_mc_sgv_sac
    ADD CONSTRAINT fk_mc_cliente_sgv_sac FOREIGN KEY ( nr_cliente )
        REFERENCES t_mc_cliente ( nr_cliente );

ALTER TABLE t_mc_sgv_visualizacao_video
    ADD CONSTRAINT fk_mc_cliente_visualiz_video FOREIGN KEY ( nr_cliente )
        REFERENCES t_mc_cliente ( nr_cliente );

ALTER TABLE t_mc_funcionario
    ADD CONSTRAINT fk_mc_depto_func FOREIGN KEY ( cd_depto )
        REFERENCES t_mc_depto ( cd_depto );

ALTER TABLE t_mc_end_func
    ADD CONSTRAINT fk_mc_end_func FOREIGN KEY ( cd_funcionario )
        REFERENCES t_mc_funcionario ( cd_funcionario );

ALTER TABLE t_mc_end_func
    ADD CONSTRAINT fk_mc_end_func_logradouro FOREIGN KEY ( cd_logradouro )
        REFERENCES t_mc_logradouro ( cd_logradouro );

ALTER TABLE t_mc_funcionario
    ADD CONSTRAINT fk_mc_func_superior FOREIGN KEY ( cd_gerente )
        REFERENCES t_mc_funcionario ( cd_funcionario );

ALTER TABLE t_mc_sgv_sac
    ADD CONSTRAINT fk_mc_funcionario_sgv_sac FOREIGN KEY ( cd_funcionario )
        REFERENCES t_mc_funcionario ( cd_funcionario );

ALTER TABLE t_mc_logradouro
    ADD CONSTRAINT fk_mc_logradouro_bairro FOREIGN KEY ( cd_bairro )
        REFERENCES t_mc_bairro ( cd_bairro );

ALTER TABLE t_mc_end_cli
    ADD CONSTRAINT fk_mc_logradouro_end FOREIGN KEY ( cd_logradouro_cli )
        REFERENCES t_mc_logradouro ( cd_logradouro );

ALTER TABLE t_mc_sgv_produto_video
    ADD CONSTRAINT fk_mc_produto_imagem FOREIGN KEY ( cd_produto )
        REFERENCES t_mc_produto ( cd_produto );

ALTER TABLE t_mc_sgv_sac
    ADD CONSTRAINT fk_mc_produto_sgv_sac FOREIGN KEY ( cd_produto )
        REFERENCES t_mc_produto ( cd_produto );

ALTER TABLE t_mc_sgv_visualizacao_video
    ADD CONSTRAINT fk_mc_produto_visualizacao FOREIGN KEY ( cd_produto )
        REFERENCES t_mc_produto ( cd_produto );

ALTER TABLE t_mc_produto
    ADD CONSTRAINT fk_mc_sub_categoria_prod FOREIGN KEY ( cd_categoria )
        REFERENCES t_mc_categoria_prod ( cd_categoria );

CREATE OR REPLACE TRIGGER arc_fk_arco_cl_t_mc_cli_fisica BEFORE
    INSERT OR UPDATE OF nr_cliente ON t_mc_cli_fisica
    FOR EACH ROW
DECLARE
    d NUMBER(10);
BEGIN
    SELECT
        a.nr_cliente
    INTO d
    FROM
        t_mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> :new.nr_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_FISICA in Table T_MC_CLI_FISICA violates Arc constraint on Table T_MC_CLIENTE - discriminator column NR_CLIENTE doesn''t have value NR_CLIENTE');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fk_arco__t_mc_cli_juridica BEFORE
    INSERT OR UPDATE OF nr_cliente ON t_mc_cli_juridica
    FOR EACH ROW
DECLARE
    d NUMBER(10);
BEGIN
    SELECT
        a.nr_cliente
    INTO d
    FROM
        t_mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> :new.nr_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_JURIDICA in Table T_MC_CLI_JURIDICA violates Arc constraint on Table T_MC_CLIENTE - discriminator column NR_CLIENTE doesn''t have value NR_CLIENTE');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



CREATE SEQUENCE SQ_MC_CATEGORIA_PROD
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_PRODUTO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_VISUALIZACAO_VIDEO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_SAC
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_CLIENTE
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_FUNCIONARIO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_DEPTO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_LOGRADOURO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_BAIRRO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_CIDADE
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

-- ESTADOS.
INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'AC' , 'ACRE' ); 

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'AL' , 'ALAGOAS' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'AP' , 'AMAPÁ' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'AM' , 'AMAZONAS' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'BA' , 'BAHIA' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'CE' , 'CEARÁ' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'DF' , 'DISTRITO FEDERAL' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'ES' , 'ESPIRITO SANTO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'GO' , 'GOIÁS' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'MA' , 'MARANHÃO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'MT' , 'MATO GROSSO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'MS' , 'MATO GROSSO DO SUL' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'MG' , 'MINAS GERAIS' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'PA' , 'PARÁ' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'PB' , 'PARAIBA' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'PR' , 'PARANÁ' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'PE' , 'PERNAMBUCO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'PI' , 'PIAUÍ' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'RJ' , 'RIO DE JANEIRO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'RN' , 'RIO GRANDE DO NORTE' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'RS' , 'RIO GRANDE DO SUL' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'RO' , 'RONDÔNIA' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'RR' , 'RORAIMA' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'SC' , 'SANTA CATARINA' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'SP' , 'SÃO PAULO' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'SE' , 'SERGIPE' );

INSERT INTO t_mc_estado
    ( sg_estado, nm_estado )
VALUES
    ( 'TO' , 'TOCANTIS' );

-- 3 CIDADES POR ESTADO.

-- AC - rio branco , feijó , sena madureira.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AC' , SQ_MC_CIDADE.NEXTVAL , 'RIO BRANCO' , 1200401 , 68 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AC' , SQ_MC_CIDADE.NEXTVAL , 'FEIJÓ' , 1200302 , 68 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AC' , SQ_MC_CIDADE.NEXTVAL , 'SENA MADUREIRA' , 1200500 , 68 );

-- AL - agua branca , estrela de alagoas , arapiraca.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AL' , SQ_MC_CIDADE.NEXTVAL , 'MACEIÓ' , 2704708 , 82 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AL' , SQ_MC_CIDADE.NEXTVAL , 'ESTRELA DE ALAGOAS' , 2702553 , 82 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AL' , SQ_MC_CIDADE.NEXTVAL , 'ARAPIRACA' , 2700300 , 82 );

-- AP - macapá , santana , laranjal do jari.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AP' , SQ_MC_CIDADE.NEXTVAL , 'MACAPÁ' , 1600303 , 96 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AP' , SQ_MC_CIDADE.NEXTVAL , 'SANTANA' , 2910800 , 55 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AP' , SQ_MC_CIDADE.NEXTVAL , 'LARANJAL DO JARI' , 1600279 , 96 );

-- AM - manaus , parintins ,manacapuru. 

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AM' , SQ_MC_CIDADE.NEXTVAL , 'MANAUS' , 1302603 , 92 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AM' , SQ_MC_CIDADE.NEXTVAL , 'PARINTINS' , 1303403 , 92 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'AM' , SQ_MC_CIDADE.NEXTVAL , 'MANACAPURU' , 1302504 , 92 );

-- BA - salvador , feira de santana , vitoria da conquista.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'BA' , SQ_MC_CIDADE.NEXTVAL , 'SALVADOR' , 2927408 , 71 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'BA' , SQ_MC_CIDADE.NEXTVAL , 'FEIRA DE SANTANA' , 2910800 , 75 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'BA' , SQ_MC_CIDADE.NEXTVAL , 'VITORIA DA CONQUISTA' , 2933307 , 77 );

-- CE - pacatuba , aquiraz , russas.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'CE' , SQ_MC_CIDADE.NEXTVAL , 'PACATUBA' , 2309706 , 85 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'CE' , SQ_MC_CIDADE.NEXTVAL , 'AQUIRAZ' , 2301000 , 85 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'CE' , SQ_MC_CIDADE.NEXTVAL , 'RUSSAS' , 2311801 , 88 );

-- DF - ceilandia , samambala , plano piloto.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'DF' , SQ_MC_CIDADE.NEXTVAL , 'CEIL NDIA' , 5300108 , 61 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'DF' , SQ_MC_CIDADE.NEXTVAL , 'SAMAMBALA' , 5300108 , 61 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'DF' , SQ_MC_CIDADE.NEXTVAL , 'PLANO PILOTO' ,  5300108 , 61 );

-- ES - serra , vila velha , cariacica.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'ES' , SQ_MC_CIDADE.NEXTVAL , 'SERRA' , 3205002 , 27 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'ES' , SQ_MC_CIDADE.NEXTVAL , 'VILA VELHA' , 3205200 , 27 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'ES' , SQ_MC_CIDADE.NEXTVAL , 'CARIACICA' , 3201308 , 27 );

-- GO - abadiania , acreuna , pirenópolis.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'GO' , SQ_MC_CIDADE.NEXTVAL , 'ABADIANIA' , 5200100 , 34 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'GO' , SQ_MC_CIDADE.NEXTVAL , 'ACREÚNA' , 5200134 , 64 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'GO' , SQ_MC_CIDADE.NEXTVAL , 'Pirenópolis' , 5205455 , 64 );

-- MA - são luiz , imperatriz , são jose de ribamar.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MA' , SQ_MC_CIDADE.NEXTVAL , 'SÃO LUIS' , 2111300 , 98 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MA' , SQ_MC_CIDADE.NEXTVAL , 'IMPERATRIZ' , 2105302 , 99 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MA' , SQ_MC_CIDADE.NEXTVAL , 'SÃO JOSÉ DE RIBAMAR' , 2111201 , 98 );

-- MT - acorizal , agua boa, apiacás.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MT' , SQ_MC_CIDADE.NEXTVAL , 'ACORIZAL' , 5100102 , 65 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MT' , SQ_MC_CIDADE.NEXTVAL , 'agua boa', 5100201, 66 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MT' , SQ_MC_CIDADE.NEXTVAL , 'APIACÁS' , 5100805 , 66 );

-- MS - campo grande , dourados , tres lagoas.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MS' , SQ_MC_CIDADE.NEXTVAL , 'CAMPO GRANDE' , 5002704 , 67 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MS' , SQ_MC_CIDADE.NEXTVAL , 'DOURADOS' , 5003702 , 67 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MS' , SQ_MC_CIDADE.NEXTVAL , 'TRES LAGOAS' , 5008305 , 67 );

-- MG - belo horizonte , uberlandia , contagem.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MG' , SQ_MC_CIDADE.NEXTVAL , 'BELO HORIZONTE' , 3106200 , 31 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MG' , SQ_MC_CIDADE.NEXTVAL , 'UBERL NDIA' , 3170206 , 34 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'MG' , SQ_MC_CIDADE.NEXTVAL , 'CONTAGEM' , 3118601 , 31 );

-- PA - belem , ananindeua , santarém.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PA' , SQ_MC_CIDADE.NEXTVAL , 'BELÉM' , 1501402 , 91 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PA' , SQ_MC_CIDADE.NEXTVAL , 'ANANINDEUA' , 1500800 , 91 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PA' , SQ_MC_CIDADE.NEXTVAL , 'SANTARÉM' , 1506807 , 93 );

-- PB - água branca , aguiar , alagoa grande.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PB' , SQ_MC_CIDADE.NEXTVAL , 'ÁGUA BRANCA' , 2500106 , 86 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PB' , SQ_MC_CIDADE.NEXTVAL , 'AGUIAR' , 2500205 , 83 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PB' , SQ_MC_CIDADE.NEXTVAL , 'ALAGOA GRANDE' , 2500304 , 34 );


-- PR - curitiba , londrina , maringá.

-- Parana

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PR' , SQ_MC_CIDADE.NEXTVAL , 'curitiba' , 4106902 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PR' , SQ_MC_CIDADE.NEXTVAL , 'londrina' , 4113700 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PR' , SQ_MC_CIDADE.NEXTVAL , 'maringa' , 4115200 , NULL );

-- Pernambuvo

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PE' , SQ_MC_CIDADE.NEXTVAL , 'Recife' , 2611606 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PE' , SQ_MC_CIDADE.NEXTVAL , 'Paulista' , 2610707 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PE' , SQ_MC_CIDADE.NEXTVAL , 'Abreu e Lima' , 2600054 , NULL );

-- piaui

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PI' , SQ_MC_CIDADE.NEXTVAL , 'Teresina' , 2211001 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PI' , SQ_MC_CIDADE.NEXTVAL , 'Parnaiba' , 2207702 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'PI' , SQ_MC_CIDADE.NEXTVAL , 'picos' , 2208007 , NULL );

-- Rio de janeiro

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RJ' , SQ_MC_CIDADE.NEXTVAL , 'Rio de Janeiro' , 3304557 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RJ' , SQ_MC_CIDADE.NEXTVAL , 'Niterói' , 3303302 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RJ' , SQ_MC_CIDADE.NEXTVAL , 'São Gonçalo' , 3304904 , NULL );

-- rio grande do norte

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RN' , SQ_MC_CIDADE.NEXTVAL , 'Natal' , 2408102 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RN' , SQ_MC_CIDADE.NEXTVAL , 'Parnamirim' , 2403251 , NULL );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RN' , SQ_MC_CIDADE.NEXTVAL , 'Mossoró' , 2408003 , NULL );

-- RS - porto alegre , caxias do sul , candas.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RS' , SQ_MC_CIDADE.NEXTVAL , 'PORTO ALEGRE' , 4314902 , 51 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RS' , SQ_MC_CIDADE.NEXTVAL , 'CAXIAS DO SUL' , 4305108 , 54 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RS' , SQ_MC_CIDADE.NEXTVAL , 'CANOAS' , 4304606 , 51 );

-- RO - alta da floresta doest , alto alegre dos parecis.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RO' , SQ_MC_CIDADE.NEXTVAL , 'ALTA DA FLORESTA DOESTE' , 1100015 , 69 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RO' , SQ_MC_CIDADE.NEXTVAL , 'ALTO ALEGRE DOS PARECIS' , 1100379 , 69 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RO' , SQ_MC_CIDADE.NEXTVAL , 'ALTO PARAISO' , 4128625 , 69 );

-- RR - roraima , alto alegre , boa vista.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RR' , SQ_MC_CIDADE.NEXTVAL , 'AMAJARI' ,  1400027 , 95 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RR' , SQ_MC_CIDADE.NEXTVAL , 'ALTO ALEGRE' , 1400027 , 95 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'RR' , SQ_MC_CIDADE.NEXTVAL , 'BOA VISTA' , 1400027 , 95 );

-- SC - abdon batista , abelardo luz , agrolandia.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SC' , SQ_MC_CIDADE.NEXTVAL , 'ABDON BATISTA' , 4200051 , 47 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SC' , SQ_MC_CIDADE.NEXTVAL , 'ABELARDO LUZ' , 4200101 , 48 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SC' , SQ_MC_CIDADE.NEXTVAL , 'AGROLÂNDIA' , 4200101 , 49 );

-- SP - são paulo , são bernado do campo , santo andré.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SP' , SQ_MC_CIDADE.NEXTVAL , 'SÃO PAULO' , 3550308 , 11 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SP' , SQ_MC_CIDADE.NEXTVAL , 'SÃO BERNARDO DO CAMPO' , 3548708 , 11 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SP' , SQ_MC_CIDADE.NEXTVAL , 'SANTO ANDRE' , 3547809 , 11 );

-- SE - aracaju , lagarto , arauá.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SE' , SQ_MC_CIDADE.NEXTVAL , 'ARACAJU' , 2800308 , 79 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SE' , SQ_MC_CIDADE.NEXTVAL , 'LAGARTO' , 2803500 , 79 );

    INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'SE' , SQ_MC_CIDADE.NEXTVAL , 'ARAUÁ' ,   2800407 , 79 );

-- TO - araguaína , gurupi , palmas.

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'TO' , SQ_MC_CIDADE.NEXTVAL , 'ARAGUAÍNA' , 1702109 , 63 );

INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'TO' , SQ_MC_CIDADE.NEXTVAL , 'GURUPI' , 1709500 , 63 );

    INSERT INTO t_mc_cidade
    ( sg_estado , cd_cidade, nm_cidade, cd_ibge, nr_ddd )
VALUES
    ( 'TO' , SQ_MC_CIDADE.NEXTVAL , 'PALMAS' , 1721000 , 63 );

--- POPULAÇÃO -- T_MC_BAIRRO.
--- *AINDA NÃO ESTÁ POPULADO*

--- REGRAS DE POPULAÇÃO:
--- 1: para cada cidade, associe no mínimo três bairros.

--- ACRE
-- Rio Branco
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 1  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 1  , SQ_MC_BAIRRO.NEXTVAL , 'Distrito Industrial' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 1  , SQ_MC_BAIRRO.NEXTVAL , 'Placas' , '' );

-- Feijó
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 2  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 2  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 2  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

--Sena Madureira
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 3 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 3  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 3 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , ' ' );


--- ALAGOAS
-- MACEIÓ
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 4  , SQ_MC_BAIRRO.NEXTVAL , 'Antares' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 4  , SQ_MC_BAIRRO.NEXTVAL , 'Cidade Universitária' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 4  , SQ_MC_BAIRRO.NEXTVAL , 'Clima Bom ' , ' ' );

-- ALAGOAS
--estrela de alagoas
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 5  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 5  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 5  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , ' ' );


--Arapiaca
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 6  , SQ_MC_BAIRRO.NEXTVAL , 'Alto Cruzeiro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 6  , SQ_MC_BAIRRO.NEXTVAL , 'Santa Esmeralda' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 6  , SQ_MC_BAIRRO.NEXTVAL , 'Caititus' , '' );

--- AMAPA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 7  , SQ_MC_BAIRRO.NEXTVAL , 'Congós' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 7  , SQ_MC_BAIRRO.NEXTVAL , 'Brasil Novo' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 7  , SQ_MC_BAIRRO.NEXTVAL , 'Pacoval' , '  ' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 8  , SQ_MC_BAIRRO.NEXTVAL , 'Remédios' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 8  , SQ_MC_BAIRRO.NEXTVAL , 'Nova Brasílial' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 8  , SQ_MC_BAIRRO.NEXTVAL , 'Vila Amazonas' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 9  , SQ_MC_BAIRRO.NEXTVAL , 'Nova Esperança' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 9  , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 9 , SQ_MC_BAIRRO.NEXTVAL , 'Malvina' , '' );

--- AMAZONAS

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 10 , SQ_MC_BAIRRO.NEXTVAL , 'Santo Gostinho' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 10 , SQ_MC_BAIRRO.NEXTVAL , 'Gilberto Mestrinho' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 10 , SQ_MC_BAIRRO.NEXTVAL , 'Distrito Industrial' , ' ' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 11 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 11 , SQ_MC_BAIRRO.NEXTVAL , 'Palmares' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 11 , SQ_MC_BAIRRO.NEXTVAL , 'Itaúna II' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 12 , SQ_MC_BAIRRO.NEXTVAL , 'Aparecida' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 12 , SQ_MC_BAIRRO.NEXTVAL , 'Terra Preta' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 12 , SQ_MC_BAIRRO.NEXTVAL , 'São José' , '' );

--- BAHIA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 13 , SQ_MC_BAIRRO.NEXTVAL , 'Cajazeiras' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 13 , SQ_MC_BAIRRO.NEXTVAL , 'Cabula' , 'nome bairro' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 13 , SQ_MC_BAIRRO.NEXTVAL , 'Águas Claras' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 14 , SQ_MC_BAIRRO.NEXTVAL , 'Tomba' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 14 , SQ_MC_BAIRRO.NEXTVAL , 'Santo Antônio dos Prazeres' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 14 , SQ_MC_BAIRRO.NEXTVAL , 'Mangabeira' , ' ' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 15 , SQ_MC_BAIRRO.NEXTVAL , 'Alto Maron' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 15 , SQ_MC_BAIRRO.NEXTVAL , 'Espírito Santo' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 15 , SQ_MC_BAIRRO.NEXTVAL , 'Brasil' , '' );

--- CEARÁ
-- Pacatuba
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 16 , SQ_MC_BAIRRO.NEXTVAL , 'Senador Carlos Jereissati' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 16 , SQ_MC_BAIRRO.NEXTVAL , 'Pavuna' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 16 , SQ_MC_BAIRRO.NEXTVAL , 'Monguba' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 17 , SQ_MC_BAIRRO.NEXTVAL , 'centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 17 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Matoso' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 17 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Ramalho' , ' ');

--Aquiraz
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 18 , SQ_MC_BAIRRO.NEXTVAL , 'centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 18 , SQ_MC_BAIRRO.NEXTVAL , 'Alto Alegre' , ' ');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 18 , SQ_MC_BAIRRO.NEXTVAL , 'Tapuió' , '' );

--- DISTRITO FEDERAL
-- Ceilândia
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 19 , SQ_MC_BAIRRO.NEXTVAL , 'Ceilândia Norte' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 19 , SQ_MC_BAIRRO.NEXTVAL , 'Ceilândia Sul' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 19 , SQ_MC_BAIRRO.NEXTVAL , 'Ceilândia Centro' , '' );

--Samambaia
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 20 , SQ_MC_BAIRRO.NEXTVAL , 'Samambaia Norte' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 20 , SQ_MC_BAIRRO.NEXTVAL , 'Samambaia Sul' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 20 , SQ_MC_BAIRRO.NEXTVAL , 'Samambaia Centro' , '' );

--Plano Piloto
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 21 , SQ_MC_BAIRRO.NEXTVAL , 'Asa Norte' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 21 , SQ_MC_BAIRRO.NEXTVAL , 'Asa Sul' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 21 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

--- ESPIRITO SANTO
-- Serra

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 22 , SQ_MC_BAIRRO.NEXTVAL , 'Central Carapina' ,' ');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 22 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Carapina' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 22 , SQ_MC_BAIRRO.NEXTVAL , 'André Carloni' , '' );

--Vila Velha
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 23 , SQ_MC_BAIRRO.NEXTVAL , 'Araçás' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 23 , SQ_MC_BAIRRO.NEXTVAL , 'Darly Santos' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 23 , SQ_MC_BAIRRO.NEXTVAL , 'Pontal das Garças' , '' );

--Cariacica
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 24 , SQ_MC_BAIRRO.NEXTVAL , 'Alzira Ramos' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 24 , SQ_MC_BAIRRO.NEXTVAL , 'Chácaras União' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 24 , SQ_MC_BAIRRO.NEXTVAL , 'São Conrado' , '' );

--- GOIÁS
-- Abadiania
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 25 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 25 , SQ_MC_BAIRRO.NEXTVAL , 'Fazenda Mariká' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 25 , SQ_MC_BAIRRO.NEXTVAL , 'Três Veredas' , '' );

--Acreúna
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 26 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 26 , SQ_MC_BAIRRO.NEXTVAL , 'Conjunto Paineira' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 26 , SQ_MC_BAIRRO.NEXTVAL , 'Setor sul', '');

--Pirenópolis
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 27 , SQ_MC_BAIRRO.NEXTVAL , 'Centro', '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 27 , SQ_MC_BAIRRO.NEXTVAL , 'Radiolândia' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 27 , SQ_MC_BAIRRO.NEXTVAL , 'Jaranápolis' , '');

--- MARANHÃO
-- São Luis
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 28 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Sarney' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 28 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Itamar II', '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 28 , SQ_MC_BAIRRO.NEXTVAL , 'Anjo da Guarda','' );

--Imperatriz
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 29 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Santa Luzia','' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 29 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Ipiranga','');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 29 , SQ_MC_BAIRRO.NEXTVAL , 'Nova Imperatriz','');

--São José de Ribamar
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 30 , SQ_MC_BAIRRO.NEXTVAL , 'Itaguará II','');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 30 , SQ_MC_BAIRRO.NEXTVAL , 'Centro','');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 30 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Jardim Lima','');

--- MATO GROSSO DO SUL
--Acorizal
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 31  , SQ_MC_BAIRRO.NEXTVAL , 'Aldeia','' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 31  , SQ_MC_BAIRRO.NEXTVAL , 'Santa Cruz' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 31  , SQ_MC_BAIRRO.NEXTVAL , 'nova acorizal' , '' );

-- Agua  Boa
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 32  , SQ_MC_BAIRRO.NEXTVAL , 'Guaruja Expansao' ,'' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 32  , SQ_MC_BAIRRO.NEXTVAL , 'Coopercana' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 32  , SQ_MC_BAIRRO.NEXTVAL , 'Jd. Tropical 3' ,'' );
--Apiacas

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 33 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' ,'');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 33 , SQ_MC_BAIRRO.NEXTVAL , 'Comun Boa Sorte' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 33 , SQ_MC_BAIRRO.NEXTVAL , 'Uniao' , '' );

--- MATO GROSSO 
--Campo Grande

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 34  , SQ_MC_BAIRRO.NEXTVAL , 'Alphaville Campo Grande' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 34  , SQ_MC_BAIRRO.NEXTVAL , 'Bairro Sao Pedro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 34  , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Inapolis' , '');
--

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 35  , SQ_MC_BAIRRO.NEXTVAL , 'Sagrada Familia' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 35  , SQ_MC_BAIRRO.NEXTVAL , 'Padre Eustaquio' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 35  , SQ_MC_BAIRRO.NEXTVAL , 'Santa Monica' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 36  , SQ_MC_BAIRRO.NEXTVAL , 'Sao Jorge' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 36  , SQ_MC_BAIRRO.NEXTVAL , 'Vila Cardoso' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 36  , SQ_MC_BAIRRO.NEXTVAL , 'Jupiá' , '');

--- MINAS GERAIS
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 37  , SQ_MC_BAIRRO.NEXTVAL , 'bonfim' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 37  , SQ_MC_BAIRRO.NEXTVAL , 'bairu' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 37  , SQ_MC_BAIRRO.NEXTVAL ,'Eldorado' , '');


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 38  , SQ_MC_BAIRRO.NEXTVAL , 'Benefica', '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 38  , SQ_MC_BAIRRO.NEXTVAL , 'Grajau' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 38  , SQ_MC_BAIRRO.NEXTVAL , 'Jaraguá' , '');


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 39  , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Canaã' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 39  , SQ_MC_BAIRRO.NEXTVAL , 'Carajás' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 39 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim California' , '');

--- PARA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 40 , SQ_MC_BAIRRO.NEXTVAL , 'Cidade Velha' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 40 , SQ_MC_BAIRRO.NEXTVAL , 'Campina' , '');


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 41 , SQ_MC_BAIRRO.NEXTVAL , 'Nazare' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 41 , SQ_MC_BAIRRO.NEXTVAL , '3 Barras' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 41 , SQ_MC_BAIRRO.NEXTVAL , 'Santa Helena' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 41 , SQ_MC_BAIRRO.NEXTVAL , 'Santa Terezinha' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 42 , SQ_MC_BAIRRO.NEXTVAL , 'Alvorada' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 42 , SQ_MC_BAIRRO.NEXTVAL , 'Mararu','');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 42 , SQ_MC_BAIRRO.NEXTVAL , 'Santo André', '');


--- PARAIBA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 43 , SQ_MC_BAIRRO.NEXTVAL , 'Gruta Lurdes' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 43 , SQ_MC_BAIRRO.NEXTVAL , 'Fonte Grande' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 43 , SQ_MC_BAIRRO.NEXTVAL , 'Zona Rural' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 44 , SQ_MC_BAIRRO.NEXTVAL , 'Engenheiro Evandro' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 44 , SQ_MC_BAIRRO.NEXTVAL , 'Novo Aguiar' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 44 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 45 , SQ_MC_BAIRRO.NEXTVAL , 'Conjunto Manoel Raimundo' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 45 , SQ_MC_BAIRRO.NEXTVAL , 'Vera Cruz' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 45 , SQ_MC_BAIRRO.NEXTVAL , 'Distrito Canafistula' , '' );

--- curitiba -- Parana.

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 46  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 46  , SQ_MC_BAIRRO.NEXTVAL , 'Juvevê' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 46  , SQ_MC_BAIRRO.NEXTVAL , 'cabral' , ' ' );

--- londrina -- Parana.

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 47  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 47  , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Londrilar' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 47  , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Mazzei 1' , ' ' );
    
--- maringa -- Parana.

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 48  , SQ_MC_BAIRRO.NEXTVAL , 'Parque Industrial Cidade de Maringa 4ª parte' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 48  , SQ_MC_BAIRRO.NEXTVAL , 'Parque Industrial Bandeirantes' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 48  , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Ouro Cola' , ' ' );

--- Santo Antônio -- pernambuco

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 49  , SQ_MC_BAIRRO.NEXTVAL , 'Santo Antônio' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 49  , SQ_MC_BAIRRO.NEXTVAL , 'boa vista' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 49  , SQ_MC_BAIRRO.NEXTVAL , 'santo amaro' , ' ' );

--- Paulista -- pernambuco

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 50  , SQ_MC_BAIRRO.NEXTVAL , 'Maranguape' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 50  , SQ_MC_BAIRRO.NEXTVAL , 'Vila Torres Galvao' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 50  , SQ_MC_BAIRRO.NEXTVAL , 'Janga' , ' ' );

--- Abreu e Lima -- pernambuco

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 51  , SQ_MC_BAIRRO.NEXTVAL , 'Caetés III' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 51  , SQ_MC_BAIRRO.NEXTVAL , 'Desterro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 51  , SQ_MC_BAIRRO.NEXTVAL , 'boa esperanca' , ' ' );

--- Teresina -- piaui

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 52  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 52  , SQ_MC_BAIRRO.NEXTVAL , 'Matinha' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 52  , SQ_MC_BAIRRO.NEXTVAL , 'Real Copagri' , ' ' );

--- Parnaíba -- piaui

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 53  , SQ_MC_BAIRRO.NEXTVAL , 'São Vicente de Paula' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 53  , SQ_MC_BAIRRO.NEXTVAL , 'Igaraçu' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 53  , SQ_MC_BAIRRO.NEXTVAL , 'Santa Luzia' , ' ' );

--- picos -- piaui

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 54  , SQ_MC_BAIRRO.NEXTVAL , 'Catavento' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 54  , SQ_MC_BAIRRO.NEXTVAL , 'conduru' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 54  , SQ_MC_BAIRRO.NEXTVAL , 'Parque de Exposição' , ' ' );

--- Rio de Janeiro -- rio de janeiro

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 55  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 55  , SQ_MC_BAIRRO.NEXTVAL , 'Senador Camará' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 55  , SQ_MC_BAIRRO.NEXTVAL , 'Bangu' , ' ' );

--- Niterói -- rio de janeiro

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 56  , SQ_MC_BAIRRO.NEXTVAL , 'Itaipu' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 56  , SQ_MC_BAIRRO.NEXTVAL , 'Santo Antônio' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 56  , SQ_MC_BAIRRO.NEXTVAL , 'Piratininga' , ' ' );

--- são gonçalo -- rio de janeiro

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 57  , SQ_MC_BAIRRO.NEXTVAL , 'Barro Vermelho' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 57  , SQ_MC_BAIRRO.NEXTVAL , 'Engenho Pequeno' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 57  , SQ_MC_BAIRRO.NEXTVAL , 'Rocha' , ' ' );

--- Natal -- rio grande do norte

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 58  , SQ_MC_BAIRRO.NEXTVAL , 'Praia do meio' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 58  , SQ_MC_BAIRRO.NEXTVAL , 'Ribeira' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 58  , SQ_MC_BAIRRO.NEXTVAL , 'Petrópolis' , ' ' );

--- Parnamirim -- rio grande do norte

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 59  , SQ_MC_BAIRRO.NEXTVAL , 'Cohabinal' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 59  , SQ_MC_BAIRRO.NEXTVAL , 'Boa Esperança' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 59  , SQ_MC_BAIRRO.NEXTVAL , 'Emaus' , ' ' );

--- Mossoró -- rio grande do norte

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 60  , SQ_MC_BAIRRO.NEXTVAL , 'Santa Júlia' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 60  , SQ_MC_BAIRRO.NEXTVAL , 'Alto do Sumaré' , ' ' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 60  , SQ_MC_BAIRRO.NEXTVAL , 'Dom Jaime Câmara' , ' ' );

--- RIO GRANDE DO SUL

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 61  , SQ_MC_BAIRRO.NEXTVAL , 'Independência' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 61  , SQ_MC_BAIRRO.NEXTVAL , 'Anchieta' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 61  , SQ_MC_BAIRRO.NEXTVAL , 'São Geraldo' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 62 , SQ_MC_BAIRRO.NEXTVAL , 'Madureira' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 62 , SQ_MC_BAIRRO.NEXTVAL , 'Pôr do Sol' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 62 , SQ_MC_BAIRRO.NEXTVAL , 'Pioneiro' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 63 , SQ_MC_BAIRRO.NEXTVAL , 'Rio Branco' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 63 , SQ_MC_BAIRRO.NEXTVAL , 'Fátima' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 63 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

--- RONDÔNIA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 64 , SQ_MC_BAIRRO.NEXTVAL , 'Colina Park I' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 64 , SQ_MC_BAIRRO.NEXTVAL , 'Colina Park II' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 64 , SQ_MC_BAIRRO.NEXTVAL , 'Açaí' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 65  , SQ_MC_BAIRRO.NEXTVAL , 'Nova Porto Velho' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 65  , SQ_MC_BAIRRO.NEXTVAL , 'Agenor de Carvalho' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 65  , SQ_MC_BAIRRO.NEXTVAL , 'Flodoaldo Pontes Pinto' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 66  , SQ_MC_BAIRRO.NEXTVAL , 'Setor 01' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 66  , SQ_MC_BAIRRO.NEXTVAL , 'Setor 03' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 66  , SQ_MC_BAIRRO.NEXTVAL , 'BNH' , '' );

--- RORAIMA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 67  , SQ_MC_BAIRRO.NEXTVAL , 'Mecejana' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 67  , SQ_MC_BAIRRO.NEXTVAL , 'São Vicente' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 67  , SQ_MC_BAIRRO.NEXTVAL , 'Calungá' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 68 , SQ_MC_BAIRRO.NEXTVAL , 'São Sebastião' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 68 , SQ_MC_BAIRRO.NEXTVAL , 'Nacional' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 68 , SQ_MC_BAIRRO.NEXTVAL , 'Costa e Silva' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 69  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 69  , SQ_MC_BAIRRO.NEXTVAL , 'centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 69 , SQ_MC_BAIRRO.NEXTVAL , 'centro' , '' );

--- SANTA CATARINA

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 70 , SQ_MC_BAIRRO.NEXTVAL , 'Carvalho' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 70 , SQ_MC_BAIRRO.NEXTVAL , 'São João' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 70 , SQ_MC_BAIRRO.NEXTVAL , 'Barra do Rio' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 71 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 71 , SQ_MC_BAIRRO.NEXTVAL , 'Pantanal' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 71 , SQ_MC_BAIRRO.NEXTVAL , 'Saco dos Limões' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 72 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 72 , SQ_MC_BAIRRO.NEXTVAL , 'Praia dos Amores' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 72 , SQ_MC_BAIRRO.NEXTVAL , 'Barra' , '' );

--- SÃO PAULO

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 73 , SQ_MC_BAIRRO.NEXTVAL , 'Sé' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 73 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 73 , SQ_MC_BAIRRO.NEXTVAL , 'República' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 74 , SQ_MC_BAIRRO.NEXTVAL , 'Assunção' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 74 , SQ_MC_BAIRRO.NEXTVAL , 'Demarchi' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 74 , SQ_MC_BAIRRO.NEXTVAL , 'Dos Casa' , '' );


INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 75 , SQ_MC_BAIRRO.NEXTVAL , 'Parque Oratório' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 75 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Ana Maria' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 75 , SQ_MC_BAIRRO.NEXTVAL , 'Tamanduateí 8' , '' );
 
--- SERGIPE
-- Aracajú
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 76 , SQ_MC_BAIRRO.NEXTVAL , 'olaria' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 76 , SQ_MC_BAIRRO.NEXTVAL , 'Jabotiana' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 76 , SQ_MC_BAIRRO.NEXTVAL , 'Ponto Novo' , '');

-- Lagarto
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 77 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 77 , SQ_MC_BAIRRO.NEXTVAL , 'Cidade Nova' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 77 , SQ_MC_BAIRRO.NEXTVAL , 'Horta' , '');

-- Aruá
INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 78 , SQ_MC_BAIRRO.NEXTVAL , 'Centro' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 78 , SQ_MC_BAIRRO.NEXTVAL , 'Bela vista' , '');

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 78 , SQ_MC_BAIRRO.NEXTVAL , 'olaria' , '');

--- TOCANTIS - araguaina

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 79 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Paulista' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 79 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Mansões Palmeiras' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 79 , SQ_MC_BAIRRO.NEXTVAL , 'Setor Carajá' , '' );

-- gurupi

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 80 , SQ_MC_BAIRRO.NEXTVAL , 'Muniz Santana' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 80 , SQ_MC_BAIRRO.NEXTVAL , 'Vila Alagoana' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 80 , SQ_MC_BAIRRO.NEXTVAL , 'Loteamento Campo Bello' , '' );

-- palmas

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 81 , SQ_MC_BAIRRO.NEXTVAL , 'Plano Diretor Norte' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 81 , SQ_MC_BAIRRO.NEXTVAL , 'Plano Diretor Sul' , '' );

INSERT INTO t_mc_bairro
    ( cd_cidade , cd_bairro, nm_bairro, nm_zona_bairro )
VALUES
    ( 81 , SQ_MC_BAIRRO.NEXTVAL , 'Jardim Aureny I' , '' );


-- AC - Rio Branco 
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 1 ,'R. Rui Barbosa' , 69900-084);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 1 ,'R. Arlíndo Leal' , 69908-040);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 1 ,'Av. Brasil' , 69900-100);
 
-- Distrito Industrial
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 2 ,'R. São José' , 69920-217);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 2 ,' R. das Acácias' , 69918-070);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 2 ,'R. Seis' , 69920-166);

-- Placas
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 3 ,'R. 3 de Setembro' , 69914-780);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 3 ,'R. Doze de Junho' , 69914-840);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 3 ,'R. Primeiro de Agosto' , 69902-760);

-- AC - Feijó
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 4 ,'R. Vinte e Um de Dezembro' , 69960-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 4 ,'Av. Castelo Branco' , 69960-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 4 ,'R. Vanderilo M Marquês' , 69960-000 );
 
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 5 ,'R.Dilermando Barroso Braga', 69960-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 5 ,'R. Francisco T Guimaraes' , 69960-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 5 ,'R. Francisco Pereira' , 69960-000 );

-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 6 ,'R. Assis Vasconcelos' , 69960-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 6 ,'R. Antônio Ferreira Braga' , 69960-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 6 ,'R. José Lopes Filho' , 69960-000 );

-- AC - Sena Madureira
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 7 ,'R. Antônio Nicácio Teixeira' , 69940-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 7 ,'R. Virgolino De Alencar' , 69940-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 7 ,'R. Pelicano' , 69940-000);
 
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 8 ,'R. Benjamin Constant' , 69940-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 8 ,'R. Siqueira Campos' , 09321190 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 8 ,'R. Maj. João Câncio' , 69940-000);

-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 9 ,'R. Newton Prado' , 69940-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 9 ,'Tv. J Basquete' , 69940-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 9 ,'Tv. Ten. Assis' , 69940-000);

-- AL - Maceió 
-- Antares
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 10 ,'R.Seis' , 57083-410);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 10 ,'Av. Maria Carolina Moreira Sampaio' , 57048-740 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 10 ,'R. Cinco' , 57048-260 );
 
-- Cidade Universitária
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 11 ,'Av. Alice Karoline' , 57073-415 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 11 ,'R. do Arame' , 57073-610 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 11 ,'Av. Frei Damião de Bozano' , 57073-610 );

-- Clima Bom
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 12 ,'1A Travessa Nossa Sra. da Conceição' , 57071-143 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 12 ,'R. Sebastião Fagundes' , 57071-190 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 12 ,'R. Nossa Sra. da Conceição' , 57071-142);

-- AL - Estrela de Alagoas
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 13 ,'R. São João' , 57625-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 13 ,'Tv. José Duarte Sobrinho' , 57625-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 13 ,'Tv. José Duarte Sobrinho 2' , 57625-000 );
 
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 14 ,'R. Arnaldo Duarte' ,57625-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 14 ,'R. Ricardo Gonzaga' , 57625-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 14 ,'R. Pref. Enéas Simplício' , 57625-000);

-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 15 ,'R. Braz Henrique-Centro' , 57625-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 15 ,'Vila das Irmãs-Centro' , 57625-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 15 ,'R. Dom Epaminondas' ,57625-000 );

-- AL - Arapiaca
-- Alto Cruzeiro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 16 ,'R. Pres. Tancredo de Almeida Neves' ,57312-260 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 16 ,'R. Manoel Francelino de Albuquerque' ,57312-350 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 16 ,'R. Gov. Luís Cavalcante' ,57312-270 );
 
-- Santa Esmeralda
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 17 ,'R. Matias Vieira da Silva' , 57312-108 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 17 , 'R. Alexandrina Pereira de Oliveira' , 57312-016);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 17 ,'R. da Liberdade' , 57312-230 );

-- Caititus
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 18 ,'R. Francisco Pereira de Albuquerque' , 57311-280);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 18 ,'R. José Antônio de Albuquerque' , 57311-260);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 18 ,'R. Petrolina' , 57311-305 );



-- AP - Macapá
-- Congós
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 19 ,'Av. Padre Rinaldo Bossi' , 68904-383 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 19 ,'Av. Ben-Hur C. Alves' ,68904-395 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 19 ,'Av. José de Mont Alverne' , 68904-398 );
 
-- Brasil Novo
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 20 ,'R. Pêssego' , 68909-331);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 20 ,'R. Mamoeiro' , 68909-324);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 20 ,'Av. Coqueiro' , 68909-315 );

-- Pacoval
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 21 ,'Av. Paraíba' ,68908-280 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 21 ,'R. São Paulo' , 68908-370 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 21 ,'Av. Pernambuco' , 68908-290 );

--AP  - Santana
-- Remédios
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 22 ,'R. Pres. Arthur Costa e Silva' ,68925-099 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 22 ,'Av. Veiga Cabral' ,68925-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 22 ,'R. Pastor Sozinho' , 68925-000 );
 
-- Nova Brasília
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 23 ,'Av. Stélio de Oliveira' , 68927-263);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 23 ,'Tv. São Camilo' , 68929-520 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 23 ,'Tv. Manoel Pereira Da Rocha' , 68927-257 );

-- Vila Amazonas
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 24 ,'R. D Dez' ,68926-146 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 24 ,'R. D Vinte e Seis' , 68926-114 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 24 ,'R. D Vinte e Um' ,68925-000 );

-- AP - Laranjal do Jari
-- Nova Esperança
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 25 ,'Av.29 De Julho' , 68920-000 );
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 25 ,'Quadra 3' , 68920-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 25 ,'Passarela 4' , 68920-000);
 
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 26 ,'R. Condé das Galveias' , 68920-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 26 ,'R. Visc. de Montalegre' , 68920-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 26 ,'R. Barão das Laranjeiras' , 68920-000);

-- Malvina
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 27 ,'Estr. Boa Vista' , 68920-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 27 , 'Estr. Servidão 2' , 68920-000);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 27 ,'Estr. P. Cinco Lagos' , 68920-000);




-- AM - Manaus 
-- Santo Agostinho
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 28 ,'Tv. 2' , 69036-664 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 28 ,'Alameda Rafael' , 69036-790 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 28 ,'Av. Liberdade' ,69036-600 );
 
-- Gilberto Mestrinho
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 29 ,'Av. Magalhães' , 69006-310 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 29 ,'R. Pará' , 69006-322 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 29 ,'R. Jordão' , 69006-313 );

-- Distrito Industrial
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 30 ,'Vicinal' , 69009-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 30 ,'Av. Puraquequara Ramal' , 69009-000  );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 30 ,'Av. Grande Circular' , 69009-000 );

-- AM - Paritins
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 31 ,'R. Pedro Gonçalves' , 69151-450 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 31 ,'R. Umuri' , 69151-420 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 31 ,'R. Gov. Leopoldo Neves' , 69151-460 );
 
-- Palmares
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 32 ,'R. Fortaleza' , 69153-020 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 32 ,'R. Alberto Mendes' , 69153-512 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 32 ,'R. Nhamunda' , 69153-050 );

-- Itaúna II 
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 33 ,'R. Gláucio Gonçalves' , 69152-193 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 33 ,'R. Wilson Cursino' , 69152-193 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 33 ,'R. José Nilton' , 69152-173 );

-- AM - Aparecida

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 34 ,'Tv. Alvarães' , 69400-458 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 34 ,'R. Gáspar Fernandes' , 69400-470 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 34 ,'R. Barcelos' , 69400-469 );
 
-- Terra Preta
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 35 ,'R. Manoel G Bastos' , 69400-001 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 35 ,'R. José Afonso' , 69400-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 35 ,'R. Maria Walcacecer Nogueira' , 69401-347 );

-- São José
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 36 ,'R. Carolina Fernandes' , 69400-836 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 36 ,'R. Virgílio Barroso Alexandre' , 69400-725 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 36 ,'R. Ten. Edilson' , 69400-002 );



-- BA - Salvador
-- Cajazeiras
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 37 ,'Caminho 08 St. 03' , 41340-680 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 37 ,'Caminho 26 Cj Cajazeira X St 2 Qd D' , 41330-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 37 ,'R. Min. Apolônio Sáles' , 41340-095 );
 
-- Cabula
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 38 ,'R. Cabo Lopes,' , 41180-675 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 38 ,'R. Manuel Luís Osório' , 41180-685 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 38 ,'R. Direta da Lagoa' , 41180-087 );

-- Águas Claras
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 39 ,'R. Benedito Jenkis' , 41310-270 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 39 ,'R. Jacob Carvalho' , 41310-320 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 39 ,'R. Frank Nalva' ,41310-240
);

-- BA - Feira de Santana
-- Tomba
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 40 ,'R. Coração de Jesus' , 44091-500 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 40 ,'R. Brasil, 20 - Tomba' , 44091-480 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 40 ,'R. Ciclo Norte' , 44091-512 );
 
-- Santo Antônio dos Prazeres
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 41 ,'R. Egito' , 40301-110 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 41 ,'Av. Artêmia Pires Freitas' , 40301-110 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 41 ,'R. Cerquilho' , 40301-111 );

-- Mangabeira
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 42 ,'R. Ibiapora' , 40301-110 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 42 ,'R. Ibirá' , 44057-480 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 42 ,'R. Upuranga' , 40301-112 );

-- BA - Vitória da Conquista
-- Alto Maron

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 43 ,'Av. Bruno Bacelar' , 45005-146 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 43 ,'R. Uruguaiana' ,  45005-138 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 43 ,'Tv. Edigar Celino' , 45005-150 );
 
-- Espírito Santo
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 44 ,'R. Tg Vinte e Oito' , 45037-810 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 44 ,'R. Tg Vinte e Nove' , 45037-795  );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 44 ,'R. C Oito' ,45037-798 );

-- Brasil
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 45 ,'Av. Lapa' , 45051-270 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 45 ,'Av. Macaúbas' , 45051-225);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 45 ,'Av. Maceió' , 45051-210 ); 

-- CE - pacatuba
-- Senador Carlos Jereissati
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 46 ,'Avenida Estrela' , 61814-384 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 46 ,'Avenida Virgilio Távora' , 61814-192 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 46 ,'Av Senador Carlos Jereissati' , 61814-212);
 
-- Pavuna
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 47 ,'Avenida 1' , 61808-110 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 47 ,'Rua 11' , 61808-105 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 47 ,'Rua 24' , 61808-010 );

-- Monguba
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 48 ,'Avenida das Mongubeiras' , 61805-715 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 48 ,'Avenida A' , 61805-220 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 48 ,'Rua 5' , 61805-320 );

-- CE - Russas
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 49 ,'Rua Russas' , 62905-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 49 ,'Rua Manuel Peixoto' , 62200-970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 49 ,'Rua Central' , 62908-990 );
 
-- Vila Matoso
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 50 ,'Avenida Dom Lino' ,62900-971 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 50 ,'BR 116' , 62900-993 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 50 ,'Rua Principal' , 62900-992 );

-- Vila Ramalho
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 51 ,'Rua Principal' , 62900-992);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 51 ,'Avenida Dom Lino' , 62900-971);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 51 ,'Rua Principal' , 62908-991 );

-- CE - Aquiraz
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 52 ,'Rua Doca Sales' , 61753-990 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 52 ,'Avenida Noé Leite de Freitas' , 61700-992 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 52 ,'Avenida Santos Dumont' , 61700-970);
 
-- Alto Alegre
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 53 ,'Avenida Arterial I' , 61700-995 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 53 ,'Rua Via Local Vinte e Três' , 61700-972 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 53 ,'Vila Machuca' , 61700-993 );

-- Tapuió
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 54 ,'Rua Osvaldo Studart' , 61752-990 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 54 ,'Rua Josué Leite de Freitas' , 61756-990 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 54 ,'Rua Cândido Benício Sampaio' , 61754-990 );

-- DF - Ceilândia
-- Ceilândia do norte
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 55 ,'EQNO 1/3 Bloco A' , 72250-501 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 55 ,'EQNO 1/3 Bloco D' , 72250-504 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 55 ,'EQNO 4/6 Bloco B' , 72250-542 );
 
-- Ceilândia Sul
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 56 ,'EQNP 14/18 Bloco A ' ,72231-541 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 56 ,'EQNP 14/18 Bloco C ' , 72231-543 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 56 ,'EQNP 14/18 Bloco H ' , 72231-548 );

-- Ceilândia centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 57 ,'EQNO 5/7 Bloco D' , 72251-504 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 57 ,'EQNO 4/6 Bloco D ' , 72250-544 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 57 ,'EQNO 4/6 Bloco B' , 72250-542 );

-- DF- Samambaia 
-- Samambaia norte
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 58 ,'EQ 212/412' , 72316-325 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 58 ,'QN 114' , 72302-650 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 58 ,'QN 210 Conjunto B' , 72316-522 );
 
-- Samambaia Sul
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 59 ,'ADE Conjunto 16' ,72314-716 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 59 ,'ADE Conjunto 17' , 72314-717 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 59 ,'ADE Conjunto 20' , 72314-720);

-- Samambaia Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 60 ,'QN 116 Conjunto 3' , 72302-753);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 60 ,'QN 206 Conjunto C Comércio' , 72316-503 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 60 ,'QN 208' , 72316-510 );

-- DF-  Plano Piloto
-- Asa Norte
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 61 ,'CLN 107 Bloco A' , 70743-510 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 61 ,'CLN 109' , 70752-500 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 61 ,'CLN 110 Bloco B' , 70753-520);
 
-- Asa Sul
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 62 ,'CLS 107 Bloco AI' , 70346-510 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 62 ,'CLS 108 Bloco A' , 70347-510 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 62 ,'CLS 108 Bloco D' , 70347-540 );

-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 63 ,'CLS 109 Bloco D' , 70372-540 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 63 ,'CLS 111 Bloco C' ,70374-530 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 63 ,'CLS 114 Bloco B' ,70377-520 );



-- Central Carapina
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 64 ,'Beco Vitória II' ,29161-540 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 64 ,'Beco Vinte e Um' , 29161-466 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 64 ,'Rua Aracajú' , 29161-559 );
 
-- Jardim Carapina
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 65 ,'Rua Anchieta ' ,29161-763 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 65 ,'Rua Aracruz ' , 29161-728 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 65 ,'Rua Baixo Guandu ' , 29161-748 );

-- André Carloni
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 66 ,'Rua Granada' , 29161-837 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 66 ,'Rua Onix' , 29161-818 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 66 ,'Rua Pérola' , 29161-834 );

-- Araçás
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 67 ,'Rua Berna' , 29103-290 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 67 ,'Rua Budapeste' , 29103-000 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 67 ,'Rua Caracas' , 29103-019 );
 
-- Darly Santos
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 68 ,'Rua Apóstolo Lucas' ,29103-310 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 68 ,'Rua Buganvilia' , 29103-339 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 68 ,'Rua Petúlia' , 29103-337);

-- Pontal das Garças
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 69 ,'Rua Garibaldi' , 29103-413);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 69 ,'Rua Jandaia' , 29103-385 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 69 ,'Rua Pavão' , 29103-379 );


-- Alzira Ramos
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 70 ,'Beco A' ,29156-199 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 70 ,'Avenida Bahia' , 29156-040 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 70 ,'Rua Acre' ,29156-013);
 
-- Chácaras União
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 71 ,'Alameda Mineira' , 29152-679 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 71 ,'Alameda Dois' , 29158-382 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 71 ,'Avenida Alzira Ramos' , 29142-600 );

-- São Conrado
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 72 ,'Avenida Bragança' , 70372-540 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 72 ,'Avenida Alice Coutinho Santos' ,29146-679 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 72 ,'Alameda Afonso Cláudio' ,29153-1520 );




-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 73 ,'Avenida Geraldo Rodrigues dos Santos' ,72940-959 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 73 ,'Avenida Geraldo Rodrigues dos Santos' ,72940-959 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 73 ,'Avenida Geraldo Rodrigues dos Santos' ,72940-959 );
 
-- Fazenda Marika
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 74 ,'Rodovia GO-474 ' ,72940-900 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 74 ,'Rodovia GO-474 ' ,72940-900 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 74 ,'Rodovia GO-474 ' ,72940-900 );

-- Três Veredas
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 75 ,'Avenida Pequizeiro' , 74926-690 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 75 ,'Avenida Pequizeiro' , 74926-690 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 75 ,'Avenida Pequizeiro' , 74926-690 );

--– GO - Acreúnas
-- centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 76 ,'Rua Genipapo' ,74926-470 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 76 ,'Rua Genipapo' ,74926-470 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 76 ,'Rua Genipapo' ,74926-470 );
 
-- Conjunto Paineira
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 77 ,'Rua H 58' ,74938-163);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 77 ,'Rua H 58' ,74938-163);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 77 ,'Rua H 58' ,74938-163);

-- Setor sul
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 78 ,'Rua El Salvador' , 74988-680);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 78 ,'Rua El Salvador' , 74988-680);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 78 ,'Rua El Salvador' , 74988-680);

-- Go-  Pirenópolis
-- Centro
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 79 ,'Rua Luís Pereira' ,74423-330 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 79 ,'Rua Luís Pereira' ,74423-330 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 79 ,'Rua Luís Pereira' ,74423-330 );
 
-- Radiolândia
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 80 ,'Rua Natal e Silva' , 74423-270 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 80 ,'Rua Natal e Silva' , 74423-270 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 80 ,'Rua Natal e Silva' , 74423-270 );

-- Jaranápolis
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 81 ,'Rua Prudente de Morais' , 74363-020 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 81 ,'Rua Prudente de Morais' , 74363-020 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 81 ,'Rua Prudente de Morais' , 74363-020 );

-- Maranhão -
-- São Luís -- 
--  Vila Sarney  --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 82 ,'2ª Travessa Eugenio Garcia' , 65090704 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 82 ,'2ª Travessa da Pedreira' , 65090710 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 82 ,'2ª Travessa do Ribeirão' , 65090677 );
 
--  Vila Itamar II --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 83 ,'Rua Cinco' , 65090056 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 83 ,'Rua Dezenove de Novembro' , 65090068 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 83 ,'Rua Dois' , 65090044 );


-- Anjo da Guarda --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 84 ,'Avenida Odilo Costa Filho' , 65085900 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 84 ,'1ª Travessa Israel' , 65085418 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 84 ,'1ª Travessa João Castelo' , 65085440 );

 
-- Imperatriz --
-- Vila Santa Luzia --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 85 ,'Rua B' , 65908155 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 85 ,'Rua Belo Horizonte' , 65908113 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 85 ,'Rua C' , 65908161 );
 
-- Vila Ipiranga --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 86 ,'Rua Dezessete' , 65908102 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 86 ,'Rua Dois' , 65908060 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 86 ,'Rua Doze' , 65908090 );


-- Nova Imperatriz --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 87 ,'Avenida Prefeito Chiquilito Erse' , 76820392 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 87 ,'Rua Eduardo Lima e Silva' , 76820394 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 87 ,'Rua Pastor Eurico Alfredo Nelson' , 76820396 );


-- São José de Ribamar --
-- Itaguará II --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 88 ,'Travessa Angelim' , 76870024 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 88 ,'Travessa Cajarana' , 76870025 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 88 ,'Travessa Copaíba' , 76870026 );
 
-- Vila Jardim Lima --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 89 ,'Alameda Porto Alegre' , 76870326 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 89 ,'Rua Porto Alegre' , 76870328 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 89 ,'Avenida Jarú' , 76870330 );


-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 90 ,'Avenida Gonçalves Dias 485' , 65110970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 90 ,'Avenida Beira-Mar' , 65010070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 90 ,'Praça Benedito Leite' , 65010080 );

--ESTADO - MATO GROSSO DO SUL
--CIDADE - ACORIZAL
-- BAIRRO - Aldeia
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 91 ,' Rua Gentil Boaventura Corrêa', 78480-000 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 91 ,' Rua Principal, s/n Aldeia', 78489-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 91 ,' Estr Vicinal do Alambique', 78482-860 );

-- BAIRRO – Santa Cruz
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 92 ,' Rua 06 Guaruja Expansao', 78635-000 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 92 ,' Rua 01 Coopercana',  78635-000);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 92 ,' Rua 01 Jd Tropical 3', 78635-000);

--BAIRRO – Nova Acorizal
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 93 ,' R Nova Xavantina ', 78055-389 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 93 ,' R Tesouro ', 78052-070 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 93 ,' R Professora Alice Freire Silva ', 26554-120 );

--CIDADE – Agua Boa
--BAIRRO – Guaruja Expansão
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 94 ,' Av Coopercana, 415 - BL 2 C 8 AP 2 ', 78892-075 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 94 ,' Avenida Claudino Frâncio - lado ímpar ', 78892-075  );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 94 ,' Rua Hematita ', 78892-079 );

--BAIRRO – Coorpercana

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 95 ,' Avenida Carlos Hugney ',  78780-959);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 95 ,' Avenida Carlos Hugney, 260 AC Alto Araguaia ', 78780-970 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 95 ,' Avenida Coronel Macario Subtil de Oliveira ',  78785-970 );

--BAIRRO – Jd. Tropical 3

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 96 ,' Avenida Europa ', 78065-130);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 96 ,' Avenida Itália ', 78065-158);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 96 ,' Avenida Portugal ', 78065-145);

-- CIDADE - APIACAS
--BAIRRO – Centro

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 97 ,' Avenida Governador Dante Martins de Oliveira ', 78595-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 97 ,' Avenida Dante Martins de Oliveira ', 78595-959 );

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 97 ,' Rua Serra Apiacás (Lot S Dourada)  ', 78141-276);
--BAIRRO – COMUN BOA SORTE

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 98 ,' Estrada Cláudia ', 78553-410);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 98 ,' Rua Ilsa Ferreira de Moraes ', 78553-422);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 98 ,' Rua Pedro Duarte ', 78553-446);

-- BAIRRO – UNIAO
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 99 ,' Rua Campo Grande ', 78603-306);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 99 ,' Rua Domingos Mariano ', 78603-308);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 99 ,' Rua José Francisco de Souza ', 78603-322);

-- ESTADO – MATO GROSSO
-- CIDADE – CAMPO GRANDE
--BAIRRO – Alphaville Campo Grande
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 100 ,' Rua Ajuru  ', 79035-612);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 100 ,' Rua Atauba ', 79035-660);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 100 ,' Rua Agave ', 79035-624);

--BAIRRO – Bairro São Pedro

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 101 ,' Rua Xavantes ', 79092-620);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 101 ,' Rua São Pedro ', 54762-077);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 101 ,' Rua Engracia Gimene ', 13520-990);

--BAIRRO – Jardim Inapolis

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 102 ,' Rua Ajuana ', 79108-290);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 102 ,' Rua Arapoema ', 79108-301);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 102 ,' Rua Atenas ', 79108-303);

--
--BAIRRO – Sagrada Familia
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 103 ,' Avenida Sagrada Família ', 78740-032);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 103 ,' Avenida Sagrada Família ', 78740-108);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 103 ,' Avenida Sagrada Família ', 78730-6120);

--BAIRRO – Padre Eustaquio

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 104 ,' Rua Padre Eustáquio ', 69921-232);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 104 ,' Praça Geraldo Torres ', 30720-330);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 104 ,' Praça São Vicente de Paulo ', 30730-460);

--BAIRRO – Santa Mônica
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 105 ,' Avenida João Pessoa ', 44078-380);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 105 ,' Avenida São Paulo ', 44078-430);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 105 ,' Rua Alvim ', 44077-290);

--
--BAIRRO - São Jorge
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 106 ,' Estrada Fazenda São Jorge ', 07782-480);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 106 ,' Estrada Recreio São Jorge ', 07144-150);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 106 ,' Ilha São Jorge ', 22640-036);

--BAIRRO - Vila Cardoso
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 107 ,' Avenida João Paulo I ', 78730-050);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 107 ,' Avenida Papa Anastácio I ', 78730-099);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 107 ,' Avenida Papa Urbano VI ', 78730-000);

--BAIRRO - Jupiá

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 108 ,' Rua Bruno Ferreira de Souza ', 79612-818);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 108 ,' Rua Gama ', 79612-824);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 108 ,' Rua Omega ', 79612-836);

--ESTADO – MINAS GERAIS
--BAIRRO – Bonfim
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 109 ,' Praça Bonfim  ', 31210-820);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 109 ,' Rua Bonfim ', 31210-150);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 109 ,' Travessa do Porto do Bonfim ', 40415-035);

--BAIRRO – Bairu
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 110 ,' Travessa Bosque Bairu ', 36050-060);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 110 ,' Praça Olavo Costa ', 36050-100);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 110 ,' Rua Américo Lobo ', 36050-000);

--BAIRRO - Eldorado
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 111 ,' Rua Eldorado dos Carajás ', 07179-810);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 111 ,' Avenida Eldorado ', 06910-740);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 111 ,' Novo Eldorado ', 78574-000);
--
--BAIRRO – Benefica
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 112 ,' Rua Embaixador Rui Barbosa ', 36200-088);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 112 ,' Rua Francisco Sá ', 36200-092);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 112 ,' Rua José Bonifácio ', 36200-106);

--BAIRRO – Grajau
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 113 ,' Rua Grajaú ', 30310-480);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 113 ,' Rua Grajaú ', 30290-320);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 113 ,' Rua Grajaú ', 31575-020);

--BAIRRO – Jaragua
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 114 ,' Rua Jaraguá do Sul ', 78558-138);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 114 ,' Rua Jaraguá ', 30290-182);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 114 ,' Avenida Jaraguá ', 38057-560);

-- BAIRRO – Jardim Canaã
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 115 ,' Alameda Monte das Oliveiras ', 38412-414);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 115 ,' Avenida Babel ', 38412-442);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 115 ,' Avenida Filadélfia ', 38412-460);

--BAIRRO - Carajás
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 116 ,' Rua dos Carajás ', 31230-740);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 116 ,' Rua dos Carajás ', 35633-290);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 116 ,' Rua Serra dos Carajás ', 35163-001);

--BAIRRO – Jardim California
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 117 ,' Rua Heitor Villa Lobos ', 73807-610);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 117 ,' Rua Califórnia ', 73807-730);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 117 ,' Praça Jardim Califórnia ', 37416-281);
--ESTADO – PARA
--
--BAIRRO – Cidade Velha
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 118 ,' Viela Araguaia ', 78601-258);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 118 ,' Alameda Antônio Neves ', 66020-800);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 118 ,' Alameda Macedônia ', 66020-360);

--BAIRRO – Campina
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 119 ,' Rua Campina Verde ', 38400-396);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 119 ,' Rua Galo de Campina ', 54789-610);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 119 ,' Rua Campina Verde ', 33902-535);

--BAIRRO - Nazaré
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 120 ,' Rua Jesus de Nazaré ', 57038-111);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 120 ,' Rua Veraleide Nazaré ', 57062-004);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 120 ,' Vila Nazaré ', 57014-214);
--
--BAIRRO – 3 Barras
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 121 ,' Rua Três ', 78058-547);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 121 ,' Rua Projetada Três ', 17160-534);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 121 ,' Estrada Três Barras ', 89239-792);

--BAIRRO – Santa Helena
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 122 ,' Rua Torquato Marchini ', 29307-080);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 122 ,' Rua Santa Helena ', 29156-115);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 122 ,' Rua Santa Helena ', 29148-580);

--BAIRRO – Santa Terezinha
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 123 ,' Rua Benedito Cindio ', 14821-134);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 123 ,' Rua Eduardo Pollo Randes ', 14821-138);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 123 ,' Rua Francisco Fernandes ', 14821-172);

--
--BAIRRO - Alvorada
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 124 ,' Rua Alvorada ', 06784-080);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 124 ,' Rua Alvorada do Sul ', 05612-010);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 124 ,' Avenida Alvorada ', 07075-223);

--BAIRRO - Mararu
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 125 ,' Beco Amazonas ', 68050-135);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 125 ,' Beco Mararuá ', 68050-075);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 125 ,' Beco Santa Cruz ', 68050-020);

--BAIRRO – Santo André
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 126 ,' Estrada Municipal Santo André ', 06514-001);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 126 ,' Rua Santo André ', 06814-155);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 126 ,' Rua Santo André ', 07132-350);

--ESTADO – PARAIBA
--
--BAIRRO – Gruta Lurdes
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 127 ,' Parque Nossa Senhora de Lourdes ', 57052-424);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 127 ,' Travessa Projetada 85 ', 57052-425);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 127 ,' Rua Nossa Senhora de Lourdes ', 89705-140);

--BAIRRO – Fonte Grande
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 128 ,' Praça Expedicionário Aquiles Braga ', 36405-013);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 128 ,' Escadaria Ranulpho Gianordoli ', 29016-716);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 128 ,' Rua da Fonte Grande ', 42510-140);

--BAIRRO – Zona Rural
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 129 ,' Avenida 4 de junho ', 58480-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 129 ,' Rua Principal ', 58480-971);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 129 ,' Rua Cabaceiras ', 58302-260);

--
--BAIRRO – Engenheiro Evandro
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 130 ,' Rua Apolônio Zenaide ', 58388-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 130 ,' Rua Joaquim Carlos ', 58388-972);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 130 ,' Rua Telesforo Onofre ', 58388-971);

--BAIRRO – Novo Aguiar
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 131 ,' Rua Felipe Aguiar ', 39440-276);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 131 ,' Rua Francisco Amandio Aguiar ', 37505-420);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 131 ,' Rua Joaquim Vieira de Aguiar ', 19034-670);

--BAIRRO – Centro
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 132 ,' Rua Deputado Francisco Antonio ', 58390-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 132 ,' Rua Presidente João Pessoa ', 58320-959);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 132 ,' Rua Hermes Lira ', 58396-959);
--
--BAIRRO – Conjunto Manoel Raimundo
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 133 ,' Rua Raimundo Escócio de Farias ', 69918-416);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 133 ,' Rua Manoel Raimundo Soares ', 02281-234);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 133 ,' Rua Analice Guedes Chianca ', 58110-092);

--BAIRRO – Vera Cruz
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 134 ,' Avenida Vera Cruz ', 57240-014);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 134 ,' Avenida Vera Cruz ', 69038-270);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 134 ,' Jardim Vera Cruz ', 40340-590);

--BAIRRO – Distrito Canafistula
INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 135 ,' Rua João Moura ', 58125-970);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 135 ,' Rua Alagoas ', 26013-590);

INSERT INTO t_mc_logradouro
( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
( SQ_MC_LOGRADOURO.NEXTVAL , 135 ,' Rua Alagoas ', 26013-590);

-- PARANA.
-- centro - curitiba
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 136 ,'Largo Alfredo Parodi' , 80010040 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 136 ,'Rua Emiliano Perneta' , 89800302 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 136 ,'Rua Emiliano Perneta' , 80030252 );

-- jureve - curitiba.
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 137 ,'Rua Alberto Bolliger' , 80030280 );
    
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 137 ,'Rua Cândido Mader' , 80030300 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 137 ,'Rua Campos Sales' , 80030378 );

-- cabral - curitiba.
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 138 ,'Rua Pedro Fabri' , 80035250 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 138 ,'Rua Pedro Fabri' , 80035250 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 138 ,'Praça Major Idegaldo Coutinho Bacci' , 80035250 );

-- centro - londrina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 139 ,'Praça Gabriel Martins' , 86010010 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 139 ,'Praça Primeiro de Maio' , 86010100 );
    
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 139 ,'Rua Mato Grosso' , 86010180 );

-- Jardim Londrilar - londrina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 140 ,'Rua João Wanderley' , 86010670 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 140 ,'Praça do Aleijadinho' , 86010700 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 140 ,'Rua Atlântico' , 86010740 );

-- Jardim Mazzei 1 - londrina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 141 ,'Rua Capitão Joaquim Paiva' , 86015740 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 141 ,'Rua Deputado José Afonso' , 86015750 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 141 ,'Rua Deputado José Afonso' , 86015750 );

-- Parque Industrial Cidade de Maringa 4ª parte - maringa

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 142 ,'Avenida 61.021' , 87069060 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 142 ,'Rua Ivone Teixeira Coelho' , 87069064 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 142 ,'Rua Pioneira Maria de Lourdes Françoso' , 87069066 );

-- Parque Industrial Bandeirantes - maringa

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 143 ,'Rua Pioneira Maria de Lourdes Françoso' , 87069066 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 143 ,'Rua Renato Javorski Tico-Tico de Oliveira' , 87069066 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 143 ,'Rodovia PR-317', 87069066 );

-- Jardim Ouro Cola - maringa

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 144 ,'Rua Pioneiro Geraldo Tono' , 87070380 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 144 ,'Avenida Virgílio Manília' , 87069066 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 144 ,'Rua Pioneiro Francisco Castoldo' , 87070760 );

--  Santo Antônio - recife

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 145 ,'Avenida Guararapes' , 87090760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 145 ,'Rua Siqueira Campos' , 81170760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 145 ,'Rua Ulhoa Cintra' , 87070766 );

-- Boa Vista - recife

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 146 ,'Rua Ulhoa Cintra' , 87070777 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 146 ,'Rua Samuel Pinto' , 87070710 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 146 ,'Rua Joao Fernandes Vieira' , 09632126 );

-- Santo Amaro - recife

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 147 ,'Beco da Pitombeira' , 01232654 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 147 ,'Rua Eduardo de Carvalho' , 12330325 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 147 ,'Rua Arquimedes de Oliveira' , 01452369 );

-- Maranguape - paulista

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 148 ,'Travessa Colibri' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 148 ,'Rua Dez' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 148 ,'Rua Treze-A' , 87070760 );

-- Vila Torres Galvao - paulista

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 149 ,'Travessa da União' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 149 ,'Travessa do Vencedor' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 149 ,'Rua Doutor Justino Goncalves' , 87070760 );

-- Janga - paulista

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 150 ,'Rua Zero' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 150 ,'Rua dez' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 150 ,'Rua doze' , 87070760 );

-- Caetés III - abreu e lima

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 151 ,'Rua Oitenta e Dois' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 151 ,'Rua Cinqüenta e Sete' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 151 ,'Travessa Quarenta' , 87070760 );

-- Desterro - abreu e lima

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 152 ,'Rua Rio Camelia' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 152 ,'Rua Santo Amaro' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 152 ,'Rua Universal' , 87070760 );

-- Boa Esperanca - abreu e lima

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 153 ,'Vila Silveira' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 153 ,'Rua Sergio Loreto' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 153 ,'Avenida Clarice Marroquim' , 87070760 );

-- centro - teresina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 154 ,'Avenida Maranhao' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 154 ,'Praça da Liberdade' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 154 ,'Rua Álvaro Mendes' , 87070760 );

-- Matinha - teresina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 155 ,'Rua Padre Marcos' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 155 ,'Rua Aparecida' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 155 ,'Rua Pinto do Lago' , 87070760 );

-- Real Copagri - teresina

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 156 ,'Rua Sebastiao Barbosa' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 156 ,'Rua Osasco' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 156 ,'Rua Comandante Petit' , 87070760 );

-- São Vicente de Paula - parnaiba

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 157 ,'Quadra 04' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 157 ,'Travessa São Vicente de Paula' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 157 ,'Rua do Barreiro' , 87070760 );

-- Igaraçu - parnaiba

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 158 ,'Rua Pilocarpina' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 158 ,'Quadra O4' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 158 ,'Rua Francisco Batista Lopes' , 87070760 );

-- Santa Luzia - parnaiba

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 159 ,'Avenida José de Moraes Correia' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 159 ,'Rua Boaventura Pires do Nascimento' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 159 ,'Rua Montenegro' , 87070760 );

-- catavento - picos

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 160 ,'Travessa Luis Ramos' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 160 ,'Rua Nossa Senhora Aparecida' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 160 ,'Rua Francisco João dos Santos' , 87070760 );

-- conduru - picos

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 161 ,'Rua Jacó Maria' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 161 ,'Rua Leônidas Melo' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 161 ,'Rua Projetada 88' , 87070760 );

-- Parque de Exposição - picos

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 162 ,'Avenida Cícero Eduardo' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 162 ,'Rua Damião Leite Lacerda' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 162 ,'Rua Francisco Matías dos Santos' , 87070760 );

-- centro - rio de janeiro

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 163 ,'Rua Primeiro de Março' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 163 ,'Praça Quinze de Novembro' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 163 ,'Travessa Tinoco' , 87070760 );

-- Senador Camará - rio de janeiro

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 164 ,'Travessa Valão' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 164 ,'Rua Zacatecas' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 164 ,'Rua Madalena' , 87070760 );

-- Bangu - rio de janeiro

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 165 ,'Rua Arildo Valadão' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 165 ,'Rua Maria Quitéria' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 165 ,'Rua Hélio Luiz Navarro' , 87070760 );

-- Itaipu - niteroi

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 166 ,'Rua das Acácias' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 166 ,'Loteamento Terra Nov' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 166 ,'Avenida São Gualter' , 87070760 );

-- Santo Antônio - niteroi

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 167 ,'Estrada Francisco da Cruz Nunes' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 167 ,'Rua Domingos Lazagna' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 167 ,'Rua Santo Antônio' , 87070760 );

-- Piratininga - niteroi

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 168 ,'Rua São Fábio' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 168 ,'Rua São Márcio' , 87070760 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 168 ,'Rua Santa Rita de Cássia' , 24355245 );

-- Barro Vermelho - são gonçalo

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 169 ,'Rua Conceição da Silva Sobral' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 169 ,'Travessa Maria Jurumenha' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 169 ,'Travessa Aldo Calvet' , 24355245 );

-- Engenho Pequeno - são gonçalo

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 170 ,'Estrada Mentor Couto' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 170 ,'Travessa Bom Retiro' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 170 ,'Rua Maria Augusta Couto' , 24355245 );

-- Rocha - são gonçalo

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 171 ,'Rua Guilherme Lópes' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 171 ,'Rua Wilson Dumont' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 171 ,'Rua Honorata Lópes' , 24355245 );

-- praia do meio - natal

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 172 ,'Avenida Presidente Café Filho' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 172 ,'Rua Doutor José Augusto Bezerra de Medeiros' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 172 ,'Avenida Vinte e Cinco de Dezembro' , 24355245 );

-- Ribeira - natal

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 173 ,'Avenida Vinte e Cinco de Dezembro' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 173 ,'Praça Senador João Câmara' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 173 ,'Rua Frei Miguelinho' , 24355245 );

-- Petrópolis - natal

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 174 ,'Rua Valdemar Falcão' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 174 ,'Rua Doutor Manoel Dantas' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 174 ,'Travessa Doutor Manoel Dantas' , 24355245 );

-- Cohabinal - Parnamirim 

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 175 ,'Avenida João XXIII' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 175 ,'Avenida Doutor Átila Paiva' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 175 ,'Rua Padre João Maria' , 24355245 );

-- Boa Esperança - Parnamirim

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 176 ,'Rua Primeiro de Janeiro' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 176 ,'Rua Vinte e Três de Outubro' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 176 ,'Rua Água Santa II' , 24355245 );

-- Emaus - Parnamirim

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 177 ,'Rua Cristo Rei' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 177 ,'Rua Rio Xingu' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 177 ,'Rua Rio São Francisco' , 24355245 );

-- Santa Júlia - mossoró

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 178 ,'Rua Real Sociedade Independente' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 178 ,'Rua Ipiranga Esporte Clube' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 178 ,'Rua Atlético Clube Corinthians' , 24355245 );

-- Alto do Sumaré - mossoró

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 179 ,'Rua Raimunda Pereira Rebouças' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 179 ,'Rua Firmino Silva Marreco' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 179 ,'Rua Antônio Aureliano Bezerra' , 24355245 );

-- Dom Jaime Câmara - mossoró

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 180 ,'Rua Herondina Cavalcante Dantas' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 180 ,'Rua Ranieri Barbosa Paiva' , 24355245 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 180 ,'Rua Antônio Filgueira' , 24355245 );



-- Rio grande do Sul -- 
-- PORTO ALEGRE
--  Independência  --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 181 ,'Avenida Independência' , 90035904 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 181 ,'Avenida Independência' , 90035970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 181 ,'Avenida Independência' , 90035972 );
 
--  Anchieta --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 182 ,'Avenida Fernando Ferrari' , 90200040 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 182 ,'Avenida Fernando Ferrari' , 90200041 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 182 ,'Rua Joaquim Oliveira' , 90200050 );


-- São Geraldo --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 183 ,'Avenida Pátria' , 90230070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 183 ,'Avenida Pátria' , 90230071 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 183 ,'Praça Pinheiro Machado' , 90230080 );

 
-- CAXIAS DO Sul --
-- Madureira --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 184 ,'Rua Carlos Colussi' , 95040170 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 184 ,'Rua Domingos Vanoni' , 95040190 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 184 ,'Rua Doutor Luiz Faccioli' , 95040210 );
 
-- Pôr do Sol --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 185 ,'Rua Alzira Alves de Oliveira' , 95042060 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 185 ,'Rua André Salvador' , 95042070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 185 ,'Rua Angelina Polesso Frigeri' , 95042080 );


-- Pioneiro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 186 ,'Rua Antônio Biachini Panatta' , 95042120 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 186 ,'Rua Arlindo Claudino Knob' , 95042130 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 186 ,'Rua Baden Powell' , 95042140 );

 
-- CANOAS --
-- Rio Branco --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 187 ,'Rua Vereador Alcides Nascimento' , 92200255 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 187 ,'Rua Hipólito José da Costa' , 92200260 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 187 ,'Rua Paes Lemes' , 92200270 );
 
-- Fátima --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 188 ,'Beco Cairu' , 92200653 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 188 ,'Avenida Guilherme Schell' , 92200654 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 188 ,'Rua Maricas' , 92200660 );


-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 189 ,'Rua Guilherme Morsch' , 92310080 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 189 ,'Rua Operário' , 92310090 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 189 ,'Rua Pedro Weingartner' , 92310100 );

-- Rondonia -- 

--  Colina Park I  --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 190 ,'Rua João dos Reis Junior' , 76906664 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 190 ,'Rua Norival Felix de Almeida' , 76906666 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 190 ,'Rua Norival Felix de Almeida' , 76906670 );
 
--  Colina Park II --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 191 ,'Rua Neumayer Pereira de Souza Junior' , 76906750 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 191 ,'Rua Neumayer Pereira de Souza Junior' , 76906752 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 191 ,'Rua Liberdade' , 76906754 );


-- Açaí --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 192 ,'Rua Pérola' , 76907012 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 192 ,'Rua Sucupira' , 76907014 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 192 ,'Rua Garapeira' , 76907016 );

 
-- PORTO VELHO --
-- Nova Porto Velho --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 193 ,'Rua da Beira' , 76820001 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 193 ,'Rua da Beira' , 76820005 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 193 ,'Rua da Beira' , 76820007 );
 
-- Agenor de Carvalho --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 194 ,'Rua Doutor Agenor de Carvalho' , 76820377 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 194 ,'Avenida Sete de Setembro' , 76820378 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 194 ,'Avenida José Vieira Caúla' , 76820390 );


-- Flodoaldo Pontes Pinto --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 195 ,'Avenida Prefeito Chiquilito Erse' , 76820392 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 195 ,'Rua Eduardo Lima e Silva' , 76820394 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 195 ,'Rua Pastor Eurico Alfredo Nelson' , 76820396 );

 
-- Ariquemes --
-- Setor 01 --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 196 ,'Travessa Angelim' , 76870024 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 196 ,'Travessa Cajarana' , 76870025 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 196 ,'Travessa Copaíba' , 76870026 );
 
-- Setor 03 --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 197 ,'Alameda Porto Alegre' , 76870326 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 197 ,'Rua Porto Alegre' , 76870328 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 197 ,'Avenida Jarú' , 76870330 );


-- BNH --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 198 ,'Avenida Jarú' , 76870765 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 198 ,'Rua Colorado do Oeste' , 76870768 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 198 ,'Rua Ariquemes' , 76870770 );

-- Roraima -- 

--  Mecejana  --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 199 ,'Avenida Surumu' , 69304555 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 199 ,'Avenida Glaycon de Paiva' , 69304560 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 199 ,'Rua Antônio Luitgard Moura' , 69304570 );
 
--  São Vicente --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 200 ,'Avenida Terêncio Lima' , 69303490 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 200 ,'Via de Acesso Caxangá' , 69303491 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 200 ,'Rua José Danilo Rufino do Vale' , 69303492 );


-- Calungá --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 201 ,'Travessa Parimé I' , 69303065 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 201 ,'Travessa Parimé II' , 69303067 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 201 ,'Travessa Parimé III' , 69303069 );

 
-- ALTO Alegre --
-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 202 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 202 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 202 ,'Avenida 1 de Julho' , 69350970 );
 
-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 203 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 203 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 203 ,'Avenida 1 de Julho' , 69350970 );


--  Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 204 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 204 ,'Avenida 1 de Julho' , 69350970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 204 ,'Avenida 1 de Julho' , 69350970 );

 
-- AMAJARI --
-- Centro --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 205 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 205 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 205 ,'Avenida Tepequem' , 69343970 );
 
-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 206 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 206 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 206 ,'Avenida Tepequem' , 69343970 );


-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 207 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 207 ,'Avenida Tepequem' , 69343970 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 207 ,'Avenida Tepequem' , 69343970 );

-- SANTA CARTARINA -- 

--  Carvalho --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 208 ,'Rua João Dalmolin' , 88307700 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 208 ,'Rodovia BR-101' , 88307710 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 208 ,'Rua Erna Hoier Corrêa' , 88307720 );
 
--  São João --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 209 ,'Rua Vicente Meirinho' , 88304310 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 209 ,'Servidão Cesar Gaboardi' , 88304315 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 209 ,'Rua Luiz Bonifácio Pinto' , 88304320 );


-- Barra do Rio --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 210 ,'Rua Carlos Alberto Mayer' , 88305580 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 210 ,'Rua Rodrigo Fernando da Rosa' , 88305585 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 210 ,'Rua Carlos Hugo da Rosa' , 88305586 );

 
-- FLORIANÓPOLIS --
-- Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 211 ,'Rua Trajano' , 88010010 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 211 ,'Rua Deodoro' , 88010020 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 211 ,'Rua Jerônimo Coelho' , 88010030 );
 
-- Pantanal --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 212 ,'Servidão José Marcos de Assis' , 88040129 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 212 ,'Travessa Eugênio Joaquim Marques da Silva' , 88040130 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 212 ,'Servidão Adilton Altamiro da Silva' , 88040132 );


--  Saco dos Limões --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 213 ,'Rua Belizário Berto da Silveira' , 88045220 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 213 ,'Rua Desembargador Américo Silveira' , 88045230 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 213 ,'Rua Marcos Nunes Vieira' , 88045240 );

 
-- Balneário Camboriú --
-- Centro --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 214 ,'Rua 1100' , 88330558 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 214 ,'Rua 1304' , 88330561 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 214 ,'Rua 1000' , 88330564 );
 
-- Praia dos Amores --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 215 ,'Rua Evaristo da Veiga' , 88331500 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 215 ,'Rua Clarice Lispector' , 88331505 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 215 ,'Avenida Rui Barbosa' , 88331510 );


-- Barra --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 216 ,'Rua Amara Pereira Corrêa' , 88332040 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 216 ,'Rua Donaciano Santos' , 88332045 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 216 ,'Rua Helena Maria Candido' , 88332047 );

-- São Paulo --  
--  Sé --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 217 ,'Praça da Sé' , 01001900 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 217 ,'Praça da Sé' , 01001901 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 217 ,'Praça da Sé' , 01001902 );
 
--  Centro --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 218 ,'Praça da Bandeira' , 01007020 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 218 ,'Galeria Prestes Maia' , 01007030 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 218 ,'Parque Anhangabaú' , 01007040 );


-- Republica --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 219 ,'Praça da República' , 01045903 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 219 ,'Praça da República' , 01045904 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 219 ,'Praça da República' , 01045905 );

 
-- São Bernardo do Campo --
-- Assunção --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 220 ,'Rua João Rocco' , 09810680 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 220 ,'Rua Romeu Trebbi' , 09810690 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 220 ,'Rua José Tosi Filho' , 09810700 );
 
-- Demarchi --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 221 ,'Rua Camila Basso' , 09811260 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 221 ,'Rua Germino Dias da Rocha' , 09811270 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 221 ,'Rua Rui Amaral Lemos' , 09811280 );


--  Dos Casa --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 222 ,'Rua Izabel Cestari' , 09812160 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 222 ,'Rua Jikichi Makimoto' , 09812170 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 222 ,'Rua Rolando Mário Ramacciotti' , 09812180 );

 
-- SP --  --  Santo André
-- Parques Oratório --

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 223 ,'Rua Congo' , 09251060 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 223 ,'Rua Canárias' , 09251070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 223 ,'Rua Rodésia' , 09251080 );
 
-- Jardim Ana Maria --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 224 ,'Rua Padre Augusto Rizzi' , 09260560 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 224 ,'Rua Otávio Mangabeira' , 09260570 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 224 ,'Rua Professor Pedutto' , 09260580);


-- Tamanduateí 8 --
INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 225 ,'Rua Malaia' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 225 ,'Rua Crispim' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 225 ,'Rua Ipitanga' , 09270078 );

-- ########################################################################################################################
-- SERGIPE - ARACAJU

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 226 ,'Rua José Procópio' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 226 ,'Travessa B' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 226 ,'Rua Idalício Soares' , 2800308 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 227 ,'Rua José Carlos Barbosa de Faro' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 227 ,'Praça Iselte Fernandes Azevedo' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 227 ,'Rua Hildete Falcão Baptista' , 2800308 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 228 ,'Rua Coronel João Gonçalves' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 228 ,'Rua Coronel José Menezes Filho' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 228 ,'Travessa Coronel Leão Viana' , 2800308 );


-- SERGIPE - LAGARTO

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 229 ,'rua dr laudelino freire' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 229 ,'praca da piedade' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 229 ,'placa filomeno hora' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 230 ,'provc cidade nova' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 230 ,'rua são jose' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 230 ,'estrada povoado queiroz' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 231 ,'Rua Enoque amorim' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 231 ,'Travessa Gilson' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 231 ,'Travessa joana do amor divino' , 09270078 );


-- SERGIPE - ARUÁ

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 232 ,'Praça Getúlio Vargas' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 232 ,'Praça Olímpio Campos' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 232 ,'Rua Principal' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 233 ,'Rua joaquim costa nascimento' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 233 ,'rua adelina nascimento' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 233 ,'rua barão do rio branco' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 234 ,'Rua Dezessete' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 234 ,'Rua Dezoito' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 234 ,'Travessa A' , 09270078 );

-- ########################################################################################################################

-- TOCANTIS.

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 235 ,'rua bela cintra' , 77809372 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 235 ,'rua levinha' , 77809450 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 235 ,'rua nossa senhora das graças' , 77809450 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 236 ,'Rua dos pedreiros' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 236 ,'avenida perimetral bezerra' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 236 ,'rua dos mecanicos' , 2800308 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 237 ,'avenida anhanguera' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 237 ,'rua baixa funda' , 2800308 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 237 ,'avenida coronel fleury' , 2800308 );


-- 

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 238 ,'Avenida gurupi' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 238 ,'rua 2-a' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 238 ,'rua adelmo aires negri' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 239 ,'avenida fernando de noronha' , 77403195 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 239 ,'rua joaquim batista de Oliveira' , 77403170 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 239 ,'avenida minas gerais' , 77403165 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 240 ,'avenida 5' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 240 ,'avenida dos esportes' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 240 ,'rua 1a' , 09270078 );


-- 

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 241 ,'praça girassóis' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 241 ,'quadra 101 norte avenida' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 241 ,'quadra 102 norte avenida ' , 09270078 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 242 ,'104 sul se 1 lote 39' , 77020902 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 242 ,'104 sul rua se 5 lote' ,  77020908);

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 242 ,'sul avenida joaquim teotônio segurado' , 77019900 );


INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 243 ,'avenida F' , 09270070 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 243 ,'Avenida tocantins' , 09270072 );

INSERT INTO t_mc_logradouro
    ( cd_logradouro, cd_bairro, nm_logradouro, nr_cep )
VALUES
    ( SQ_MC_LOGRADOURO.NEXTVAL , 243 ,'Praça brasilia' , 09270078 );

-- DEPARTAMENTOS.

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'COMERCIAL' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'CONTABILIDADE' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'ESTOQUE' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'FINANCEIRO' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'SAC' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'RECURSOS HUMANOS' , 'A' );

INSERT INTO t_mc_depto
    ( cd_depto, nm_depto, st_depto )
VALUES
    ( SQ_MC_DEPTO.NEXTVAL , 'TECNOLOGIA DA INFORMAÇÃO' , 'A' );

-- CATEGORIA DOS PRODUTOS.


-- CATEGORIA 1: ARTESANATO.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'ARTESANATO' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 2: AUDIO.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'AUDIO' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 3: BRINQUEDOS.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'BRINQUEDOS' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 4: CELULAR E SMARTPHONE.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'CELULAR E SMARTPHONE' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 5: COLCHOES.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'COLCHOES' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 6: ESPORTE E LAZER.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'ESPORTE E LAZER' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 7: FERRAMENTAS.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'FERRAMENTAS' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 8: GAMES.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'GAMES' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 9: INFORMATICA.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'INFORMATICA' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 10: LIVROS.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'LIVROS' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 11: PETSHOP.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'PETSHOP' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 12: TV E UTILIDADES DOSMESTICAS.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'P' , 'TV E UTILIDADES DOSMESTICAS' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

--#########################################################################################################################################
-- h) Cadastre as seguintes categorias para os vídeos: Instalação do Produto; Uso no Cotidiano; Comercial com Personalidade; entre outros.

-- CATEGORIA 13: INSTALAÇÃO DO PRODUTO.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'V' , 'INSTALAÇÃO DO PRODUTO' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 14: USO NO COTIDIANO.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'V' , 'USO NO COTIDIANO' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CATEGORIA 15: COMERCIAL COM PERSONALIDADE.
INSERT INTO t_mc_categoria_prod
    ( cd_categoria, tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria )
VALUES
    ( SQ_MC_CATEGORIA_PROD.NEXTVAL , 'V' , 'COMERCIAL COM PERSONALIDADE' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO

-- DEPARTAMENTO: COMERCIAL
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 1 , '' ,
        'CARLOS ROBERTO MANUEL' , 
        TO_DATE('01/03/2002' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ASSISTENTE' , 
        1.700 , 'ROBERTOALAMEDA@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 1 , '' ,
        'MANUEL CARLOS ANDRADE' , 
        TO_DATE('10/02/1999' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'VAREJISTA' , 
        1.280 , 'MANUTHETCHOW@GMAIL.COM' , 'I' , 
        TO_DATE('01/02/2010' , 'DD/MM/YYYY') , 
        TO_DATE('01/08/2019' , 'DD/MM/YYYY') );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 1 , '' ,
        'ANNA PENNY AUSTIN' , 
        TO_DATE('01/03/2002' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'SECRETARIA' , 
        19.200 , 'ANNADABALA21@GMAIL.COM' , 'I' , 
        TO_DATE('07/12/2000' , 'DD/MM/YYYY') , 
        TO_DATE('05/10/2019' , 'DD/MM/YYYY') );

-- DEPARTAMENTO: CONTABILIDADE
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 2 , '' ,
        'INCLIMILDA PINTO TAVARES' , 
        TO_DATE('11/06/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'CONTADORA' , 
        7.000 , 'KAKASHIHASHMAN@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 2 , '' ,
        'ROSALINA CRISTINA HUMANA' , 
        TO_DATE('25/03/1980' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'SECRETARIA DE CONTAS A PAGAR' , 
        3.200 , 'ROSALINATHEKING@GMAIL.COM' , 'I' , 
        TO_DATE('01/12/2000' , 'DD/MM/YYYY') , 
        TO_DATE('01/10/2010' , 'DD/MM/YYYY') );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 2 , '' ,
        'EMMANUEL GET MORSE' , 
        TO_DATE('07/03/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ASSISTENTE' , 
        1.200 , 'EMMANUEL123@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

-- DEPARTAMENTO: ESTOQUE
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 3 , '' ,
        'RENGOKU FOGU DE HASHIRA' , 
        TO_DATE('01/03/2002' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ESTOQUISTA' , 
        4.600 , 'RENGOKUFOIDEVALA@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 3 , '' ,
        'YELLICE CASTRO PIRES DE LÓ' , 
        TO_DATE('01/03/2002' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ASSISTENTE' , 
        999.0 , 'ONLYEMMANUEL@GMAIL.COM' , 'A' , 
        TO_DATE('10/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 3 , '' ,
        'TANGIRO KAMADO' , 
        TO_DATE('20/04/2004' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'AUXILIAR' , 
        1.222 , '@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

-- DEPARTAMENTO: FINANCEIRO
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 4 , '' ,
        'DOM GEPPETO DI PAULA' , 
        TO_DATE('03/02/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ANALISTA' , 
        10.000 , 'GEPPETINHO027@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 4 , '' ,
        'HOLIDAY FALLS' , 
        TO_DATE('02/03/1990' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'ASSISTENTE' , 
        2.000 , 'HOLLYPOLLYDAY@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2007' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 4 , '' ,
        'KYLE GALEN' , 
        TO_DATE('25/04/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'APRENDIZ' , 
        2.333 , 'KMILHASTHECROW@GMAIL.COM' , 'I' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , 
        TO_DATE('01/11/2017' , 'DD/MM/YYYY') );

-- DEPARTAMENTO: SAC
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 5 , '' ,
        'ERNESTO YOURNAMEISMINE DA SILVA' , 
        TO_DATE('01/03/1930' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ATENDENTE' , 
        5.000 , 'ENERSTOCAPILAR@GMAIL.COM' , 'A' , 
        TO_DATE('02/02/2005' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 5 , '' ,
        'LUCAS SILVEITRA DE OLINDA' , 
        TO_DATE('10/08/2002' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'COORDENADOR' , 
        1.200 , 'SILVEITRAGODMAN@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 5 , '' ,
        'PAIN TIPOLIZ DE FRANCA ROCHA' , 
        TO_DATE('01/02/2003' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ANALISTA' , 
        7.000 , 'TRIPOLIZPAIN@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2015' , 'DD/MM/YYYY') , ''
         );

-- DEPARTAMENTO: RECURSOS HUMANOS
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 6 , '' ,
        'YASMIN DE MERCEDES COSTA' , 
        TO_DATE('12/12/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'RECRUTADORA' , 
        1.777 , 'YASMINATAPAJOGO@GMAIL.COM' , 'I' , 
        TO_DATE('13/04/2019' , 'DD/MM/YYYY') , 
        TO_DATE('01/10/2019' , 'DD/MM/YYYY') );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 6 , '' ,
        'CLODINALDO CLITORINO CATETO CLOVIS' , 
        TO_DATE('12/12/1968' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ESPECIALISTA DE RH' , 
        5.000 , 'CLOCLOTHEMUSH@GMAIL.COM' , 'A' , 
        TO_DATE('01/01/2009' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 6 , '' ,
        'MATILDA RAWRAW TUBARÃO DA SILVA' , 
        TO_DATE('01/07/2003' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'ANALISTA' , 
        1.200 , 'MATILDINHA21@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2018' , 'DD/MM/YYYY') , ''
         );

-- DEPARTAMENTO: TECNOLOGIA DA INFORMAÇÃO
INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 7 , '' ,
        'NAOFUMI TATE ARAUJO' , 
        TO_DATE('28/09/1990' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , 'ASSISTENTE DE MANUTENÇÃO' , 
        4.999 , 'NANAOTHEMAN@GMAIL.COM' , 'A' , 
        TO_DATE('01/12/2010' , 'DD/MM/YYYY') , ''
        );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 7 , '' ,
        'ANGEL WARRIOR' , 
        TO_DATE('16/04/1983' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'DESENVOLVEDORA WEB' , 
        10.000 , 'WARNOTGOOD@GMAIL.COM' , 'A' , 
        TO_DATE('16/04/1983' , 'DD/MM/YYYY') , ''
         );

INSERT INTO t_mc_funcionario
    ( cd_funcionario , cd_depto , cd_gerente , nm_funcionario , dt_nascimento , fl_sexo_biologico , ds_genero , ds_cargo , vl_salario , ds_email , st_func , dt_cadastramento , dt_desligamento )
VALUES
    ( SQ_MC_FUNCIONARIO.NEXTVAL , 7 , '' ,
        'OLIVIA ANDRADE REQUEST OLIVEIRA' , 
        TO_DATE('01/03/2003' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , 'ESTAGIARIA' , 
        999.0 , 'OLIVINHA19@GMAIL.COM' , 'I' , 
        TO_DATE('01/12/2017' , 'DD/MM/YYYY') , 
        TO_DATE('01/10/2018' , 'DD/MM/YYYY') );

-- CLIENTE.


-- CLIENTE - ANA ROSA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ANA ROSA' , 5 , 1.200 , 'A' , 'anarosa@gmail.com' , '11 99999-9999' , 'anarosa_' , 'password_aqui' );

-- CLIENTE - ANA AZUL.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ANA AZUL' , 4 , 1.000 , 'A' , 'anaazul@gmail.com' , '11 99999-9999' , 'anaazul_' , 'password_aqui' );

-- CLIENTE - ANA AMARELA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ana amarela' , 2 , 800.0 , 'I' , 'anaamarela@gmail.com' , '11 99999-9999' , 'anaamarela_' , 'password_aqui' );

-- CLIENTE - ANA VERMELHA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ANA VERMELHA' , 5 , 15.000 , 'A' , 'anavermelha@gmail.com' , '11 99999-9999' , 'anavermelha_' , 'password_aqui' );

-- CLIENTE - ANA LARANJA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ANA LARANJA' , 3 , 3.000 , 'I' , 'analaranja@gmail.com' , '11 99999-9999' , 'analaranja_' , 'password_aqui' );

-- CLIENTE - ANA CINZA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'ANA CINZA' , 5 , 11.200 , 'A' , 'anacinza@gmail.com' , '11 99999-9999' , 'anacinza_' , 'password_aqui' );

-- CLIENTE - JOÃO SILVA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOÃO SILVA' , 3 , 50.000 , 'A' , 'joaosilva@gmail.com' , '11 99999-9999' , 'joaosilva_' , 'password_aqui' );

-- CLIENTE - JOÃO ARAUJO.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOÃO ARAUJO' , 5 , 500.0 , 'I' , 'joaoaraujo@gmail.com' , '11 99999-9999' , 'joaoaraujo_' , 'password_aqui' );

-- CLIENTE - JOÃO OLIVEIRA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOÃO OLIVEIRA' , 5 , 7.000 , 'I' , 'joaooliveira@gmail.com' , '11 99999-9999' , 'joaooliveira_' , 'password_aqui' );

-- CLIENTE - JOÃO SOUZA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOÃO SOUZA' , 3 , 30.000 , 'I' , 'joaosouza@gmail.com' , '11 99999-9999' , 'joaosouza_' , 'password_aqui' );


-- ####################################### OS PROXIMOS SERÃO USADOS COMO CLIENTES JURIDICOS #######################################


-- CLIENTE - JOSE CASTRO.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOSE CASTRO' , 5 , 80.000 , 'A' , 'josecastro@gmail.com' , '11 99999-9999' , 'josecastro_' , 'password_aqui' );

-- CLIENTE - MARIA SONIA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'MARIA SONIA' , 3 , 55.000 , 'I' , 'mariasonia@gmail.com' , '11 99999-9999' , 'mariasonia_' , 'password_aqui' );

-- CLIENTE - JOSE CARBRAL.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOSE CARBRAL' , 1 , 1.200 , 'I' , 'josecabral@gmail.com' , '11 99999-9999' , 'josecabral_' , 'password_aqui' );

-- CLIENTE - MARIA PADARIA.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'MARIA PADARIA' , 5 , 100.000 , 'A' , 'mariapadaria@gmail.com' , '11 99999-9999' , 'mariapadaria_' , 'password_aqui' );

-- CLIENTE - JOSE RAILLOW.
INSERT INTO t_mc_cliente
    ( nr_cliente, nm_cliente, qt_estrelas, vl_medio_compra, st_cliente, ds_email, nr_telefone, nm_login, ds_senha )
VALUES
    ( SQ_MC_CLIENTE.NEXTVAL , 'JOSE RAILLOW' , 4 , 111.200 , 'A' , 'joseraillow@gmail.com' , '11 99999-9999' , 'joseraillow_' , 'password_aqui' );

-- CLIENTE FISICO.

-- CLIENTE - ANA ROSA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 1 , TO_DATE ('01/01/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '790.802.198-00' );

-- CLIENTE - ANA AZUL.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 2 , TO_DATE ('02/02/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '122.702.447-96' );

-- CLIENTE - ANA AMARELA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 3 , TO_DATE ('03/03/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '682.828.087-33' );

-- CLIENTE - ANA VERMELHA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 4 , TO_DATE ('04/04/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '037.603.320-72' );

-- CLIENTE - ANA LARANJA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 5 , TO_DATE ('05/05/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '601.838.657-74' );

-- CLIENTE - ANA CINZA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 6 , TO_DATE ('06/06/2000' , 'DD/MM/YYYY') , 'F' , 'FEMININO' , '173.198.842-75' );

-- CLIENTE - JOÃO SILVA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 7 , TO_DATE ('07/07/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , '395.988.896-10' );

-- CLIENTE - JOÃO ARAUJO.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 8 , TO_DATE ('08/08/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , '256.082.286-50' );

-- CLIENTE - JOÃO OLIVEIRA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 9 , TO_DATE ('09/09/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , '256.082.286-50' );

-- CLIENTE - JOÃO SOUZA.
INSERT INTO t_mc_cli_fisica
    ( nr_cliente , dt_nascimento, fl_sexo_biologico, ds_genero, nr_cpf )
VALUES
    ( 10 , TO_DATE ('10/10/2000' , 'DD/MM/YYYY') , 'M' , 'MASCULINO' , '787.027.153-50' );

-- CLIENTE JURIDICO

-- CLIENTE - JOSE CASTRO.
INSERT INTO t_mc_cli_juridica
    ( nr_cliente , dt_fundacao, nr_cnpj, nr_inscr_est )
VALUES
    ( 1 , TO_DATE ( '05/05/2005' , 'DD/MM/YYYY') , '18.921.742/0001-15' , '768266238' );

-- CLIENTE - MARIA SONIA.
INSERT INTO t_mc_cli_juridica
    ( nr_cliente , dt_fundacao, nr_cnpj, nr_inscr_est )
VALUES
    ( 2 , TO_DATE ( '05/06/2006' , 'DD/MM/YYYY') , '94.280.876/0001-82' , '768265634' );

-- CLIENTE - JOSE CARBRAL.
INSERT INTO t_mc_cli_juridica
    ( nr_cliente , dt_fundacao, nr_cnpj, nr_inscr_est )
VALUES
    ( 3 , TO_DATE ( '07/07/2007' , 'DD/MM/YYYY') , '63.955.891/0001-50' , '123266235' );

-- CLIENTE - MARIA PADARIA.
INSERT INTO t_mc_cli_juridica
    ( nr_cliente , dt_fundacao, nr_cnpj, nr_inscr_est )
VALUES
    ( 4 , TO_DATE ( '08/08/2008' , 'DD/MM/YYYY') , '97.081.547/0001-09' , '856266237' );

-- CLIENTE - JOSE RAILLOW.
INSERT INTO t_mc_cli_juridica
    ( nr_cliente , dt_fundacao, nr_cnpj, nr_inscr_est )
VALUES
    ( 5 , TO_DATE ( '09/09/2009' , 'DD/MM/YYYY') , '88.821.071/0001-04' , '7682662125' );

-- ENDEREÇO DO CLIENTE.

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 1 , 1 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 2 , 2 , 577 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 3 , 3 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 4 , 4 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 5 , 5 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 6 , 6 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 7 , 7 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 8 , 8 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 9 , 9 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 10 , 10 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 11 , 11 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 12 , 12 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 13 , 13 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 14 , 14 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 15 , 15 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 16 , 16 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 17 , 17 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 18 , 18 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 19 , 19 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 119 , 20 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );


-- ############################### AGORA OS CLIENTES FISICOS ###############################

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 11 , 21 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 11 , 22 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 12 , 23 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 12 , 24 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 13 , 25 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 13 , 26 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 14 , 27 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 14 , 28 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 15 , 29 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- CLIENTE - NOME.
INSERT INTO t_mc_end_cli
    ( nr_cliente , cd_logradouro_cli , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 15 , 30 , 777 , '' , TO_DATE ( '' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- PRODUTO.

-- PRODUTO 1 - PASTA PARA MODELAR.
INSERT INTO t_mc_produto
    ( cd_produto, cd_categoria, nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 1 , '789123123123' , 'PASTA PARA MODELAGEM' , 75 , '' , 'I' , 10 , 'incrivel pasta para modelagens!' );

-- PRODUTO 2 - ARGILA.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 1 , '789123123000' , 'ARGILA' , 37.00 , '' , 'I' , 10 , 'argila do egito, a melhor em artesanato!' );

-- PRODUTO 3 - FONE DE OUVIDO.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 2 , '789123003123' , 'FONE DE OUVIDO' , 25.00 , '' , 'A' , 10 , 'otimos fones para desfrutar de maxima qualidade!' );

-- PRODUTO 4 - JBL.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 2 , '789222123123' , 'JBL' , 1.000 , '' , 'A' , 10 , 'JBL a prova de agua e com som estereo perfeito!' );

-- PRODUTO 5 - CARRINHO DE CONTROLE.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 3 , '789177723123' , 'CARRINHO DE CONTROLE' , 5.000 , '' , 'A' , 10 , 'carrinho de controle remoto eletrico de ultima geração!' );

-- PRODUTO 6 - BONECA BARBIE.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 3 , '789123100023' , 'BONECA BARBIE' , 1.787 , '' , 'A' , 10 , 'boneca barbie com 300 PROFISSÕES' );

-- PRODUTO 7 - IPHONE 13.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 4 , '789123189893' , 'IPHONE 13' , 100.000 , '' , 'A' , 10 , 'Smartphone de ultima geração com otimo desempenho e bateria!' );

-- PRODUTO 8 - XIOMI MI 9.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 4 , '789123123123' , 'XIOMI MI 9' , 50.000 , '' , 'A' , 10 , 'Otimo Smartphone custo beneficio, possui carga e desempenho de ponta!' );

-- PRODUTO 9 - COLCHAO AZUL.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 5 , '789135723123' , 'COLCHAO AZUL' , 12.000 , '' , 'A' , 10 , 'colchao com neon rgb' );

-- PRODUTO 10 - COLCHAO ROSA.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 5 , '789121593123' , 'COLCHAO ROSA' , 1.700 , '' , 'A' , 10 , 'colchao que brilha no escuro! otimo para dormir.' );

-- PRODUTO 11 - BOLA DE FUTEBOL.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 6 , '784443123123' , 'BOLA DE FUTEBOL' , 71.000 , '' , 'A' , 10 , 'bola de futebol usada em campo na copa de 2002!' );

-- PRODUTO 12 - CAMISA DE TIME.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 6 , '789123468223' , 'CAMISA DO PSG' , 1.040 , '' , 'A' , 10 , 'CAMISA DO PSG autografada' );

-- PRODUTO 13 - FURADEIRA.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 7 , '789123193723' , 'FURADEIRA' , 1.700 , '' , 'A' , 10 , '110 volt fura qualquer superficie de aço!' );

-- PRODUTO 14 - CHAVE INGLESA.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 7 , '789123792123' , 'CHAVE INGLESA' , 71.000 , '' , 'A' , 10 , 'Chave inglesa inox com resistencia a acido!' );

-- PRODUTO 15 - FIFA 23.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 8 , '789179583123' , 'FIFA 23' , 1.220 , '' , 'A' , 10 , 'Jogo mais aclamado pelo publico!' );

-- PRODUTO 16 - GOD OF WAR.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 8 , '789123135783' , 'GOD OF WAR' , 1.077 , '' , 'A' , 10 , 'CLASSICO JOGO PARA CONSOLE' );

-- PRODUTO 17 - PLACA DE VIDEO.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 9 , '789121597123' , 'PLACA DE VIDEO RTX' , 91.000 , '' , 'A' , 10 , 'OTIMA PLACA PARA MINEIRA CRYPTO' );

-- PRODUTO 18 - PLAYSTATION 5.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 9 , '784593123123' , 'PLAYSTATION 5' , 11.000 , '' , 'A' , 10 , 'console de ultima geração' );

-- PRODUTO 19 - THR ROOTKITS ARSENAL.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 10 , '789123177123' , 'THR ROOTKITS ARSENAL' , 7.000 , '' , 'A' , 10 , 'livro sobre cybersec' );

-- PRODUTO 20 - CASINHA PARA PET.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 11 , '789100023123' , 'CASINHA PARA PET' , 2.500 , '' , 'A' , 10 , 'extremamente confortavel!' );

-- PRODUTO 21 - TV QLED 80 POLEGADAS.
INSERT INTO t_mc_produto
    ( cd_produto , cd_categoria , nr_cd_barras_prod, ds_produto, vl_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod )
VALUES
    ( SQ_MC_PRODUTO.NEXTVAL , 12 , '789100023123' , 'TV QLED 80 POLEGADAS' , 20.500 , '' , 'I' , 10 , 'definição de imagem e custo beneficio!' );

-- SAC.

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 1 , 1 , 1 , SQ_MC_SAC.NEXTVAL , 'Sorria! essa é o nosso teste de SAC.' , TO_DATE ( '01/01/2022' , 'DD/MM/YYYY') , 10 , TO_DATE ( '15/04/2022' , 'DD/MM/YYYY') , 14 , 15 , 'TESTE, TESTE, TESTE, TESTE, TESTE, TESTE, TESTE, EBAAAAAAA!' , 'S' , 'A' , 10 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 2 , 2 , 2 , SQ_MC_SAC.NEXTVAL , 'hello my friend, ta suave?' , TO_DATE ( '02/02/2022' , 'DD/MM/YYYY') , 11 , TO_DATE ( '03/02/2022' , 'DD/MM/YYYY') , 14 , 15 , 'OLÁ por favor, gostaria de sugerir o produto fosse mais barato.' , 'D' , 'A' , 10 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 3 , 3 , 3 , SQ_MC_SAC.NEXTVAL , 'Produto de qualidade surpreendente!' , TO_DATE ( '09/08/2022' , 'DD/MM/YYYY') , 20 , TO_DATE ( '10/08/2022' , 'DD/MM/YYYY') , 14 , 15 , 'BOM DIA! gostaria de agradecer pelo ótimo produto de extrema qualidade, garanto que irei comprar sempre.' , 'E' , 'A' , 10 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 4 , 4 , 3 , SQ_MC_SAC.NEXTVAL , 'Como usa?!' , TO_DATE ( '11/08/2022' , 'DD/MM/YYYY') , 12 , TO_DATE ( '12/08/2022' , 'DD/MM/YYYY') , 14 , 15 , 'Olá, recentemente adquiri o produto de vocês e estou encontrando certa dificuldade para usa-lo, poderia me dar instruções?' , 'D' , 'A' , 10 );
 
INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 5 , 6 , 3 , SQ_MC_SAC.NEXTVAL , 'Produto de boa qualidade, porém entrega extremamente lenta!' , TO_DATE ( '09/08/2022' , 'DD/MM/YYYY') , 17 , TO_DATE ( '10/08/2022' , 'DD/MM/YYYY') , 10 , 15 , 'Olá, esse produto é incrivel, mas sugiro que deem mais atenção para a entrega, pois demorou demais.' , 'S' , 'A' , 5 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 6 , 7 , 3 , SQ_MC_SAC.NEXTVAL , 'Produto de qualidade surpreendente!, chegou super rápido.' , TO_DATE ( '12/10/2022' , 'DD/MM/YYYY') , 20 , TO_DATE ( '13/10/2022' , 'DD/MM/YYYY') , 14 , 15 , 'O produto de vocês é incrivel, a entrega foi muito ràpida e o preço muito em conta! parabéns.' , 'E' , 'A' , 10 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 7 , 9 , 3 , SQ_MC_SAC.NEXTVAL , 'Escolhi a cor errada.' , TO_DATE ( '15/01/2022' , 'DD/MM/YYYY') , 13 , TO_DATE ( '16/01/2022' , 'DD/MM/YYYY') , 14 , 15 , 'Olá, comprei um colchão e chegou na cor azul, eu queria rosa. tem como trocar?.' , 'D' , 'A' , 10 );

INSERT INTO t_mc_sgv_sac
    ( nr_cliente , cd_produto , cd_funcionario , nr_sac, ds_detalhada_sac, dt_abertura_sac, hr_abertura_sac, dt_atendimento, hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, tp_sac, st_sac, nr_indice_satisfacao )
VALUES
    ( 8 , 8 , 3 , SQ_MC_SAC.NEXTVAL , 'Quero reembolso.' , TO_DATE ( '15/03/2022' , 'DD/MM/YYYY') , 13 , TO_DATE ( '16/03/2022' , 'DD/MM/YYYY') , 14 , 15 , 'Olá, meu produto chegou com defeito! quero instruções sobre como devo proceder para ter o estorno.' , 'D' , 'A' , 1 );


-- VISUALIZAÇÃO DE VIDEO.

INSERT INTO t_mc_sgv_visualizacao_video
    ( nr_cliente , cd_produto , cd_visualizacao_video, dt_visualizacao, nr_hora_visualizacao, nr_minuto_video, nr_segundo_video )
VALUES
    ( 10 , 21 , SQ_MC_VISUALIZACAO_VIDEO.NEXTVAL , TO_DATE ( '15/04/2022' , 'DD/MM/YYYY') , 10 , 30 , 10 );

INSERT INTO t_mc_sgv_visualizacao_video
    ( nr_cliente , cd_produto , cd_visualizacao_video, dt_visualizacao, nr_hora_visualizacao, nr_minuto_video, nr_segundo_video )
VALUES
    ( 10 , 21 , SQ_MC_VISUALIZACAO_VIDEO.NEXTVAL , TO_DATE ( '15/04/2022' , 'DD/MM/YYYY') , 10 , 30 , 10 );

-- PRODUTO VIDEO.

-- PRODUTO.
INSERT INTO t_mc_sgv_produto_video
    ( cd_produto , cd_categoria , nr_sequencia, vd_produto, tp_video_prod, ds_path_video_prod, st_video_prod )
VALUES
    ( 21 , 13 , 1 , NULL , ' TP VIDEO ' , 'https://www.youtube.com/watch?v=p3eBtIkeJlA' , 'A' );

-- PRODUTO.
INSERT INTO t_mc_sgv_produto_video
    ( cd_produto , cd_categoria , nr_sequencia, vd_produto, tp_video_prod, ds_path_video_prod, st_video_prod )
VALUES
    ( 3 , 14 , 1 , NULL , ' TP VIDEO ' , 'https://www.youtube.com/watch?v=9-4bjJ7TBf0' , 'A' );

-- PRODUTO.
INSERT INTO t_mc_sgv_produto_video
    ( cd_produto , cd_categoria , nr_sequencia, vd_produto, tp_video_prod, ds_path_video_prod, st_video_prod )
VALUES
    ( 12 , 15 , 1 , NULL , ' TP VIDEO ' , 'https://www.youtube.com/shorts/waHWgyrZrRg' , 'A' );

-- ENDEREÇO DO FUNCIONARIO.

-- FUNCIONARIO - CARLOS ROBERTO MANUEL.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 1 , 222 , 777 , '' , TO_DATE ( '01/01/2000' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - MANUEL CARLOS ANDRADE.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 2 , 45 , 777 , '' , TO_DATE ( '01/01/2001' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - ANNA PENNY AUSTIN.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 3 , 70 , 777 , '' , TO_DATE ( '01/01/2002' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - INCLIMILDA PINTO TAVARES.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 4 , 87 , 777 , '' , TO_DATE ( '01/01/2003' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - ROSALINA CRISTINA HUMANA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 5 , 105 , 777 , '' , TO_DATE ( '01/01/2004' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - EMMANUEL GET MORSE.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 6 , 130 , 777 , '' , TO_DATE ( '01/01/2005' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - RENGOKU FOGU DE HASHIRA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 7 , 150 , 777 , '' , TO_DATE ( '01/01/2006' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - YELLICE CASTRO PIRES DE LÓ.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 8 , 200 , 777 , '' , TO_DATE ( '01/01/2007' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - TANGIRO KAMADO.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 9 , 300 , 777 , '' , TO_DATE ( '01/01/2008' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - DOM GEPPETO DI PAULA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 10 , 400 , 777 , '' , TO_DATE ( '01/01/2009' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - HOLIDAY FALLS.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 11 , 500 , 777 , '' , TO_DATE ( '01/01/2010' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - KYLE GALEN.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 12 , 600 , 777 , '' , TO_DATE ( '01/01/2011' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - ERNESTO YOURNAMEISMINE DA SILVA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 13 , 700 , 777 , '' , TO_DATE ( '01/01/2012' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - LUCAS SILVEITRA DE OLINDA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 14 , 111 , 777 , '' , TO_DATE ( '01/01/2013' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - PAIN TIPOLIZ DE FRANCA ROCHA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 15 , 650 , 777 , '' , TO_DATE ( '01/01/2014' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - YASMIN DE MERCEDES COSTA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 16 , 435 , 777 , '' , TO_DATE ( '01/01/2015' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - CLODINALDO CLITORINO CATETO CLOVIS.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 17 , 336 , 777 , '' , TO_DATE ( '01/01/2016' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - MATILDA RAWRAW TUBARÃO DA SILVA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 18 , 237 , 777 , '' , TO_DATE ( '01/01/2017' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - NAOFUMI TATE ARAUJO.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 19 , 1 , 777 , '' , TO_DATE ( '01/01/2018' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - ANGEL WARRIOR.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 20 , 15 , 777 , '' , TO_DATE ( '01/01/2019' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );

-- FUNCIONARIO - OLIVIA ANDRADE REQUEST OLIVEIRA.

INSERT INTO t_mc_end_func
    ( cd_funcionario , cd_logradouro , nr_end, ds_complemento_end, dt_inicio, dt_termino, st_end )
VALUES
    ( 21 , 382 , 777 , '' , TO_DATE ( '01/01/2020' , 'DD/MM/YYYY') , TO_DATE ( '' , 'DD/MM/YYYY') , 'A' );


commit;
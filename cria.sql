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


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             44
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

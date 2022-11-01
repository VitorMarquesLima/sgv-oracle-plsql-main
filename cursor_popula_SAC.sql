SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE pcd_ocorrencia_sac IS
BEGIN   
    DECLARE
    /* declaração das variaveis da Tabela -> T_MC_SGV_OCORRENCIA_SAC */
    vnr_ocorrencia_sac              t_mc_sgv_ocorrencia_sac.nr_ocorrencia_sac%type;
    vdt_abertura_sac                t_mc_sgv_ocorrencia_sac.dt_abertura_sac%type;
    vhr_abertura_sac                t_mc_sgv_ocorrencia_sac.hr_abertura_sac%type;
    vds_tipo_classificacao_sac      t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac%type;
    vds_indice_satisfacao_atd_sac   t_mc_sgv_ocorrencia_sac.ds_indice_satisfacao_atd_sac%type;
    vcd_categoria_prod              t_mc_sgv_ocorrencia_sac.cd_categoria_prod%type;
    vnm_tipo_categoria_prod         t_mc_sgv_ocorrencia_sac.nm_tipo_categoria_prod%type;
    vds_categoria_prod              t_mc_sgv_ocorrencia_sac.ds_categoria_prod%type;
    vcd_produto                     t_mc_sgv_ocorrencia_sac.cd_produto%type;
    vds_produto                     t_mc_sgv_ocorrencia_sac.ds_produto%type;
    vtp_embalagem                   t_mc_sgv_ocorrencia_sac.tp_embalagem%type;
    vvl_unitario_produto            t_mc_sgv_ocorrencia_sac.vl_unitario_produto%type;
    vvl_perc_lucro                  t_mc_sgv_ocorrencia_sac.vl_perc_lucro%type;
    vvl_unitario_lucro_produto      t_mc_sgv_ocorrencia_sac.vl_unitario_lucro_produto%type;
    vsg_estado                      t_mc_sgv_ocorrencia_sac.sg_estado%type;
    vnm_estado                      t_mc_sgv_ocorrencia_sac.nm_estado%type;
    vnm_cidade                      t_mc_sgv_ocorrencia_sac.nm_cidade%type;
    vnm_bairro                      t_mc_sgv_ocorrencia_sac.nm_bairro%type;
    vnr_cliente                     t_mc_sgv_ocorrencia_sac.nr_cliente%type;
    vnm_cliente                     t_mc_sgv_ocorrencia_sac.nm_cliente%type;
    vqt_estrelas_cliente            t_mc_sgv_ocorrencia_sac.qt_estrelas_cliente%type;
    vvl_icms_produto                t_mc_sgv_ocorrencia_sac.vl_icms_produto%type;

    /* variavel de referência -> vl_unitario_lucro_produto */
    vvl_unitario_lucro_produto_ref t_mc_sgv_ocorrencia_sac.vl_unitario_lucro_produto%type;

    /* variavel para o indice de satisfação -> vnr_indice_satisfacao */
    vnr_indice_satisfacao NUMBER(2) := 9;

    /* Variaveis para o controle condicional -> tp_sac */
    vSugestao_compara CHAR(1) := 'S';
    vDuvida_compara   CHAR(1) := 'D';
    vElogio_compara   CHAR(1) := 'E';

    vSugestao t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac%type := 'SUGESTÃO';
    vDuvida   t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac%type := 'DÚVIDA';
    vElogio   t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac%type := 'ELOGIO';
    vInvalido t_mc_sgv_ocorrencia_sac.ds_tipo_classificacao_sac%type := 'CLASSIFICAÇÃO INVÁLIDA!';
    
    /* Variaveis para o controle condicional -> tp_categoria */
    vVideo_compara   CHAR(1) := 'V';
    vProduto_compara CHAR(1) := 'P';

    vVideo              t_mc_sgv_ocorrencia_sac.nm_tipo_categoria_prod%type := 'VIDEO';
    vProduto            t_mc_sgv_ocorrencia_sac.nm_tipo_categoria_prod%type := 'PRODUTO';
    vCategoria_invalida t_mc_sgv_ocorrencia_sac.nm_tipo_categoria_prod%type := 'CATEGORIA INVÁLIDA!';

    /* Criação do cursor -> cursor_ocorrencia_sac */
    CURSOR cursor_ocorrencia_sac IS
    SELECT DISTINCT(s.nr_sac) ,s.dt_abertura_sac ,s.hr_abertura_sac ,s.tp_sac ,s.nr_indice_satisfacao ,cat.cd_categoria ,
    cat.tp_categoria ,cat.ds_categoria ,p.cd_produto ,p.ds_produto ,p.tp_embalagem ,p.vl_unitario ,p.vl_perc_lucro ,
    e.sg_estado ,e.nm_estado ,c.nm_cidade ,b.nm_bairro ,cli.nr_cliente ,cli.nm_cliente ,cli.qt_estrelas
    FROM t_mc_sgv_sac s 
         INNER JOIN t_mc_produto p
         ON (s.cd_produto = p.cd_produto) 
         INNER JOIN t_mc_categoria_prod cat
         ON (p.cd_categoria = cat.cd_categoria)
         INNER JOIN t_mc_cliente cli
         ON (s.nr_cliente = cli.nr_cliente)
         INNER JOIN t_mc_end_cli endc
         ON (cli.nr_cliente = endc.nr_cliente)
         INNER JOIN t_mc_logradouro l
         ON (endc.cd_logradouro_cli = l.cd_logradouro)
         INNER JOIN t_mc_bairro b
         ON (l.cd_bairro = b.cd_bairro)
         INNER JOIN t_mc_cidade c
         ON (b.cd_cidade = c.cd_cidade)
         INNER JOIN t_mc_estado e 
         ON (c.sg_estado = e.sg_estado)
         WHERE (endc.nr_cliente, b.nm_bairro, c.nm_cidade, e.nm_estado, e.sg_estado) IN (SELECT  ec.nr_cliente,
                                                                                            MIN(b.nm_bairro), 
                                                                                            MIN(c.nm_cidade), 
                                                                                            MIN(e.nm_estado), 
                                                                                            MIN(e.sg_estado)
                                                                                            FROM t_mc_end_cli ec
                                                                                            INNER JOIN t_mc_logradouro l
                                                                                            ON (ec.cd_logradouro_cli = l.cd_logradouro)
                                                                                            INNER JOIN t_mc_bairro b
                                                                                            ON (l.cd_bairro = b.cd_bairro)
                                                                                            INNER JOIN t_mc_cidade c
                                                                                            ON (b.cd_cidade = c.cd_cidade)
                                                                                            INNER JOIN t_mc_estado e
                                                                                            ON (c.sg_estado = e.sg_estado)
                                                                                            GROUP BY ec.nr_cliente)
         ORDER BY s.nr_sac ASC;
    
    vCursor_ocorrencia  cursor_ocorrencia_sac%rowtype;
BEGIN
  OPEN cursor_ocorrencia_sac;
    LOOP
        FETCH cursor_ocorrencia_sac INTO vCursor_ocorrencia;
            EXIT WHEN cursor_ocorrencia_sac%notfound;
/* Abaixo as instruções que serão executadas a cada loop */

/* Condicional -> tp_sac */
IF    vCursor_ocorrencia.tp_sac = vSugestao_compara  THEN
    vds_tipo_classificacao_sac := vSugestao;
ELSIF vCursor_ocorrencia.tp_sac = vDuvida_compara THEN 
    vds_tipo_classificacao_sac := vDuvida;
ELSIF vCursor_ocorrencia.tp_sac = vElogio_compara THEN
    vds_tipo_classificacao_sac := vElogio;
ELSE
    vds_tipo_classificacao_sac := vInvalido;
END IF;

/* Condicional -> tp_categoria */
IF    vCursor_ocorrencia.tp_categoria = vVideo_compara THEN
    vnm_tipo_categoria_prod := vVideo;
ELSIF vCursor_ocorrencia.tp_categoria = vProduto_compara THEN
    vnm_tipo_categoria_prod := vProduto;
ELSE
    vnm_tipo_categoria_prod := vCategoria_invalida;
END IF;

/* vl_unitario_lucro_produto */
vvl_unitario_lucro_produto_ref := (vvl_perc_lucro / 100) * vvl_unitario_lucro_produto;

/* DS_INDICE_SATISFACAO_ATD_SAC */
pf0110.prc_mc_gera_indice_satisfacao_atd(vnr_indice_satisfacao, vds_indice_satisfacao_atd_sac);

/* VL_ICMS_PRODUTO */
vvl_icms_produto := pf0110.fun_mc_gera_aliquota_media_icms_estado (vsg_estado);
vvl_icms_produto := (vvl_icms_produto / 100) * vvl_unitario_produto;

/* Atribuição das variaveis */
vnr_ocorrencia_sac              := vCursor_ocorrencia.nr_sac;
vdt_abertura_sac                := vCursor_ocorrencia.dt_abertura_sac;
vhr_abertura_sac                := vCursor_ocorrencia.hr_abertura_sac;
/*vds_tipo_classificacao_sac    -> já está sendo atribuida. */
/*vds_indice_satisfacao_atd_sac -> já está sendo atribuida. */
vcd_categoria_prod              := vCursor_ocorrencia.cd_categoria;
/*vnm_tipo_categoria_prod       -> já está sendo atribuida. */
vds_categoria_prod              := vCursor_ocorrencia.ds_categoria;
vcd_produto                     := vCursor_ocorrencia.cd_produto;
vds_produto                     := vCursor_ocorrencia.ds_produto;
vtp_embalagem                   := vCursor_ocorrencia.tp_embalagem;
vvl_unitario_produto            := vCursor_ocorrencia.vl_unitario;
vvl_perc_lucro                  := vCursor_ocorrencia.vl_perc_lucro;
/*vvl_unitario_lucro_produto    -> já está sendo atribuida. */
vsg_estado                      := vCursor_ocorrencia.sg_estado;
vnm_estado                      := vCursor_ocorrencia.nm_estado;
vnm_cidade                      := vCursor_ocorrencia.nm_cidade;
vnm_bairro                      := vCursor_ocorrencia.nm_bairro;
vnr_cliente                     := vCursor_ocorrencia.nr_cliente;
vnm_cliente                     := vCursor_ocorrencia.nm_cliente;
vqt_estrelas_cliente            := vCursor_ocorrencia.qt_estrelas;
/*vvl_icms_produto              -> já está sendo atribuida. */

/* Retorna os resultados no console cocatenado em uma linha DBMS */
DBMS_OUTPUT.PUT_LINE(
    'Numero da ocorrencia do SAC: '             || to_char(vnr_ocorrencia_sac)              || ' , ' || 
    'Data de abertura do SAC: '                 || to_char(vdt_abertura_sac)                || ' , ' || 
    'Hora de abertura do SAC: '                 || to_char(vhr_abertura_sac)                || ' , ' || 
    'Tipo do SAC: '                             || to_char(vds_tipo_classificacao_sac)      || ' , ' || 
    'Numero do indice de satisfação do SAC: '   || to_char(vds_indice_satisfacao_atd_sac)   || ' , ' || 
    'Codigo de categoria do produto: '          || to_char(vcd_categoria_prod)              || ' , ' || 
    'Tipo da categoria do produto: '            || to_char(vnm_tipo_categoria_prod)         || ' , ' || 
    'Descrição da categoria do produto: '       || to_char(vds_categoria_prod)              || ' , ' || 
    'Código do produto: '                       || to_char(vcd_produto)                     || ' , ' || 
    'Nome do produto: '                         || to_char(vds_produto)                     || ' , ' || 
    'Embalagem do produto: '                    || to_char(vtp_embalagem)                   || ' , ' || 
    'Valor unitário de venda do produto: '      || to_char(vvl_unitario_produto)            || ' , ' || 
    'Percentual do lucro unitário do produto: ' || to_char(vvl_unitario_lucro_produto_ref)  || ' , ' || 
    'Sigla do estado: '                         || to_char(vsg_estado)                      || ' , ' || 
    'Nome do estado: '                          || to_char(vnm_estado)                      || ' , ' || 
    'Nome da cidade: '                          || to_char(vnm_cidade)                      || ' , ' || 
    'Nome do bairro: '                          || to_char(vnm_bairro)                      || ' , ' ||
    'Número do cliente: '                       || to_char(vnr_cliente)                     || ' , ' || 
    'Nome do cliente: '                         || to_char(vnm_cliente)                     || ' , ' || 
    'Quantidade de estrelas do Cliente: '       || to_char(vqt_estrelas_cliente));

/* Inserção dos dados na tabela -> t_mc_sgv_ocorrencia_sac */
INSERT INTO t_mc_sgv_ocorrencia_sac (  
    nr_ocorrencia_sac, dt_abertura_sac, hr_abertura_sac, ds_tipo_classificacao_sac, ds_indice_satisfacao_atd_sac, cd_categoria_prod,
    nm_tipo_categoria_prod, ds_categoria_prod, cd_produto, ds_produto, tp_embalagem, vl_unitario_produto, vl_perc_lucro, 
    vl_unitario_lucro_produto, sg_estado, nm_estado, nm_cidade, nm_bairro, nr_cliente, nm_cliente, qt_estrelas_cliente, vl_icms_produto )
VALUES (    
    vnr_ocorrencia_sac, vdt_abertura_sac, vhr_abertura_sac, vds_tipo_classificacao_sac, vds_indice_satisfacao_atd_sac, vcd_categoria_prod,           
    vnm_tipo_categoria_prod, vds_categoria_prod, vcd_produto, vds_produto, vtp_embalagem, vvl_unitario_produto, vvl_perc_lucro, 
    vvl_unitario_lucro_produto, vsg_estado, vnm_estado, vnm_cidade, vnm_bairro, vnr_cliente, vnm_cliente, vqt_estrelas_cliente, vvl_icms_produto );

/* Fechamento do loop */
    END LOOP;

/* Fechamento do cursor -> cursor_ocorrencia_sac */
    CLOSE cursor_ocorrencia_sac;

/* Tratamento das exceções */
EXCEPTION 
WHEN CURSOR_ALREADY_OPEN THEN
    CLOSE cursor_ocorrencia_sac;
WHEN INVALID_CURSOR THEN 
    raise_application_error(-20004 ,'CURSOR INVALIDO!');
WHEN PROGRAM_ERROR THEN
    raise_application_error(-20005 ,'PROBLEMA INTERNO NO BLOCO PL/SQL!');
WHEN ROWTYPE_MISMATCH THEN
    raise_application_error(-20006 ,'TIPOS DE RETORNO INCOMPATIVEIS!');
WHEN OTHERS THEN RAISE;

/* Efetivação das transações */
        COMMIT;
    END;
END;
/

EXECUTE PCD_OCORRENCIA_SAC;

-- SELECT * FROM T_MC_SGV_OCORRENCIA_SAC;

# sgv_oracle_plsql
## Sistema gerenciador de vendas em PLSQL.

Esse é uma atividade proposta pela faculdade FIAP no primeiro semestre em que o objetivo era criar e popular um Banco de dados Oracle para gerenciamento de uma empresa de vendas, desde a modelagem do schema até a implementação de triggers e stored procedures para realizar a validação do CPF dos clientes.

## SCHEMA
<div align="center">
<img src="https://user-images.githubusercontent.com/55064565/185525538-7b416b35-8ebb-4977-a0ff-5348ea5ba3a9.png" width="700px" />
</div>

## Conteúdo

* apaga.sql - vai realizar drop de todas as tabelas e sequences.

* cria.sql - vai criar todas as tabelas e sequences.

* cria_popula.sql - scrip Que vai realizar drop de todas as tabelas e sequences, depois vai criar todas as tabelas e sequences e por fim vai fazer a população de todas as tabelas.

* cursor_popula_SAC.sql - é um cursor Que realiza a população da tabela SAC ocorrência.

* procedure_valida_CPF.sql - é uma stored procedure Que realiza a validação de um CPF quando ela é chamada.

* script_popula_tabelas.sql - é um script contendo dados para realizar a população das tabelas.

* trigger_valida_CPF.sql - é uma trigger for each row Que é acionada sempre que uma tentativa de insert ou update de cpf é realizada, a trigger chama a procedure de validação de cpf.

* modelo_fisico.pdf - Modelagem fisica do banco de dados.

# Criando um projeto com DBT

### Tutoriais pra seguir:
- Instalando a CLI: https://docs.getdbt.com/dbt-cli/installation
- Criando um projeto e dando os primeiros steps: 
  https://docs.getdbt.com/tutorial/create-a-project-dbt-cli
- Pra criar o arquivo `~/.dbt/profiles.yml` com base no Redshift: 
  https://docs.getdbt.com/reference/warehouse-profiles/redshift-profile
    - Se existir mais de uma pasta de projeto no computador, basta criar um
  novo profile dentro do arquivo `~/.dbt/profiles.yml`, mudando os params
  para o novo projeto
  
### Observacoes
- O arquivo `profiles.yml` fica na pasta `~/.dbt`. Faz sentido deixar ele no repositorio, e criar um script
.sh pra mover ele pra home (ou dockerizar essa parte também)
- Ainda nesse arquivo, nos campos opcionais, caso eles não forem usados, eles precisam
ser comentados para não serem usados.
- O DB em que o dbt vai se conectar precisa estar online para se realizar qualquer
operação no dbt (`dbt docs generate`/`dbt run` e outros exemplos)
- A grande quantidade de arquivos/pastas que ficam dentro de um projeto 
na verdade foi criada de forma automatizada, na execução de comandos do dbt
  
### Vantagens
- Ao termos uma pasta para os modelos, conseguimos modularizar criações de tabelas
por partes, por exemplo, uma tabela que é criada por meio de 2 CTEs, teríamos 3 models:
  - Um para o 1o CTE, outro para o 2o, e um para a tabela final
  - Isso permite os dois primeiros CTEs serem usados em outras tabelas/consolidaçoes
  - **Ou seja, modularizamos as regras de negócio**, e depois só agregamos elas em tabelas, 
    apenas referenciando os modelos anteriores
    - E como posso escolher se crio tabelas ou views, posso fazer esses CTEs modularizados
    com as regras de negócio, como views, e as tabelas que agregam eles, como tabelas.
- Possibiliadde de criar documentação do projeto, com o comando `dbt docs generate`,
super abstrata e prática
- Uso de uma templating language (jinja) fazendo com que você consiga definir,
por exemplo, a origem das tabelas em um .yml e depois só referenciar nos outros lugares,
simplificando na manutenção do código e também na hora de gerar a documentaçã
- Ainda sobre templates, permite a criação de Macros, como se fossem métodos em Python,
e também possui diversos pacotes já prontos, para Macros e Models.
  - Particularmente, o pacote `dbt_utils` abstrai lógicas de SQL super úteis
- Possui uma logica dedicada a questao de Deploy, permitindo que se planeje qualquer job
do dbt, como `dbt run`. Talvez só dê pra fazer essa parte no DBT Cloud, 
mas ainda sim é muito prático. Dá até pra fazer um full load dali, e talvez um partial
- O DBT Cloud já se integra ao github, o que facilita bastante na hora da criacao de PRs
- Já tem lógica criada para tabelas incrementais sem delete, apenas com insert
  - E pra tabelas que ocorrem deletes, é possível também criar lógica pra capturar as
  diferenças de delete/inset e fazer esse incremental

## Projetos desse repo
- `projeto-inicial-tuio`: 
  - Projeto em que exploro os recursos iniciais do DBT, já me conectando a um cluster redshift, usando
  tabelas padroes do dbt
- `projeto-incremental-load`:
  - Projeto onde testo incremental models, para analisar a viabilidade
  da solução para tabelas do ContaAzul que possuem DELETES/UPDATES/INSERT.
Nesse projeto foram usados CSVs do Kaggle.
    

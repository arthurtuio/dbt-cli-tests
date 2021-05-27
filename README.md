# Criando um projeto com DBT

### Tutoriais pra seguir:
- Instalando a CLI: https://docs.getdbt.com/dbt-cli/installation
- Criando um projeto e dando os primeiros steps: https://docs.getdbt.com/tutorial/create-a-project-dbt-cli
- Pra criar o arquivo `~/.dbt/profiles.yml` com base no Redshift: 
  https://docs.getdbt.com/reference/warehouse-profiles/redshift-profile
  
### Observacoes
- O arquivo `profiles.yml` fica na pasta `~/.dbt`. Faz sentido deixar ele no repositorio, e criar um script
.sh pra mover ele pra home (ou dockerizar essa parte também)
- Ainda nesse arquivo, nos campos opcionais, caso eles não forem usados, eles precisam
ser comentados para não serem usados.
  
### Vantagens
- Ao termos uma pasta para os modelos, conseguimos modularizar criações de tabelas
por partes, por exemplo, uma tabela que é criada por meio de 2 CTEs, teríamos 3 models:
  - Um para o 1o CTE, outro para o 2o, e um para a tabela final
  - Isso permite os dois primeiros CTEs serem usados em outras tabelas/consolidaçoes
  - **Ou seja, modularizamos as regras de negócio**, e depois só agregamos elas em tabelas, 
    apenas referenciando os modelos anteriores
    - E como posso escolher se crio tabelas ou views, posso fazer esses CTEs modularizados
    com as regras de negócio, como views, e as tabelas que agregam eles, como tabelas.
- Possibiliadde de criar documentação do projeto, com o comando `dbt docs`,
super abstrata e prática

## Projetos desse repo
- `projeto-inicial-tuio`: 
    - Projeto em que exploro os recursos iniciais do DBT, já me conectando a um cluster redshift, 
      e também a um banco local postgres
# Projeto Adventure Works - Modelagem Dimensional e Previsão de Demanda

Este projeto visa implementar uma infraestrutura moderna de dados para a Adventure Works, uma indústria de bicicletas em expansão. O objetivo principal é analisar as vendas e prever a demanda de produtos para os próximos 3 meses, com o suporte de um data warehouse e visualizações avançadas.

## Sumário

- [Visão Geral](#visão-geral)
- [Objetivos](#objetivos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação e Configuração](#instalação-e-configuração)
- [Uso](#uso)
- [Contribuição](#contribuição)

## Visão Geral

Este projeto busca transformar os dados de vendas da Adventure Works em informações valiosas através da modelagem de dados, análise de vendas e previsão de demanda. Utilizamos o Snowflake para configuração do data warehouse, dbt para transformação de dados e Power BI para visualização. Além disso, modelos preditivos são aplicados para estimar a demanda futura de produtos.

## Objetivos

1. **Modelagem do Data Warehouse**: Implementar um data warehouse utilizando Snowflake, com modelagem dimensional e criação de tabelas de fatos e dimensões.
2. **Transformação de Dados**: Utilizar dbt para limpar, transformar e preparar os dados, criando camadas de staging, marts e aggregates.
3. **Visualização e Análise**: Desenvolver dashboards e relatórios em Power BI para análise de vendas e identificação de tendências.
4. **Previsão de Demanda**: Aplicar técnicas de séries temporais hierárquicas e modelos preditivos (AutoARIMA e Naive) para prever a demanda dos próximos 3 meses.

## Estrutura do Projeto

- **Data Warehouse**: Scripts e configuração para a modelagem dimensional no Snowflake.
- **Transformação de Dados**: Modelos dbt para as camadas de staging, marts e aggregates.
- **Visualização**: Relatório detalhado, diagrama conceitual e dashboards desenvolvidos no Power BI (consultar pasta `docs`).
- **Previsão**: Scripts Python para análise preditiva e avaliação de modelos.

## Instalação e Configuração

### Pré-requisitos

- Conta no Snowflake
- dbt Cloud ou dbt CLI
- Power BI Desktop
- Python | Google Colab | Jupyter Notebook

### Passos

1. **Configuração do Data Warehouse**: Configure seu ambiente Snowflake e carregue os scripts de modelagem.
2. **Transformação de Dados**: Configure dbt e execute os modelos para preparar os dados.
3. **Visualização**: Importe os dados transformados para o Power BI e crie os dashboards.
4. **Previsão**: Execute os scripts Python para prever a demanda e analisar a sazonalidade.

## Uso

Para executar as análises e previsões, siga os passos descritos na documentação de cada parte do projeto. Certifique-se de ter todos os pré-requisitos instalados e configurados corretamente.

### Executando Análises

1. **Importar Dados**: Use os scripts para conectar e importar dados do Snowflake.
2. **Transformar Dados**: Execute os modelos dbt para preparar os dados.
3. **Visualizar Dados**: Abra os arquivos do Power BI e visualize os dashboards.
4. **Prever Demanda**: Execute os scripts Python para calcular previsões e analisar a sazonalidade.

## Contribuição

Contribuições são bem-vindas! Se você deseja contribuir para o projeto, por favor, siga as etapas abaixo:

1. Faça um fork deste repositório.
2. Crie uma nova branch (`git checkout -b feature/nova-funcionalidade`).
3. Faça suas alterações e adicione testes.
4. Envie um pull request com uma descrição clara das alterações.

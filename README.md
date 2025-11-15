# 🛒 Projeto de Análise de Dados Completo — Comportamento do Cliente e Tendências de Compras

**Python • SQL • Looker Studio • Data Cleaning • EDA • Dashboard**

Este projeto é um exemplo completo de um fluxo de trabalho real de análise de dados — exatamente como ocorre em empresas. Ele cobre todas as etapas essenciais: desde a exploração e preparação de dados, passando por consultas SQL para análises profundas, até a criação de um dashboard interativo para visualização de insights de negócio. 

Foi utilizado um dataset de 3.900 compras contendo informações detalhadas sobre clientes, produtos, comportamento de compra, recorrência, assinaturas e preferências de consumo. O objetivo foi transformar dados brutos em um conjunto robusto de insights estratégicos, organizados de forma clara e visual.

## 🎯 O que foi feito neste projeto

Este é um projeto end-to-end completo, pensado e alinhado ao que empresas esperam de um analista de dados.

### ✅ 1. Definição do Problema de Negócio

Antes da análise, foi definido um cenário empresarial focado em entender padrões de compras, retenção de clientes, tendências por categoria e oportunidades de otimização em um e-commerce fictício.

### ✅ 2. Exploração e Limpeza dos Dados (Python)

No ambiente Python foram realizados:

- → Carregamento e inspeção inicial do dataset
- → Tratamento de nulos
- → Padronização de colunas
- → Conversão de tipos
- → Criação de novas variáveis (segmentos, faixa etária, frequência de compra, etc.)
- → Análises exploratórias (EDA) com Plotly

Essas etapas garantiram que o dataset estivesse limpo, estruturado e pronto para análises avançadas.

### ✅ 3. Criação de Consultas SQL para Análises de Negócio

O Looker Studio não permite conectar bancos locais, então precisei hospedar o MySQL no Railway para permitir acesso remoto e visualização do dashboard e com isso foram desenvolvidas consultas SQL para resolver perguntas-chave, como:

- → Quais categorias geram mais receita?
- → Como os clientes podem ser segmentados (Novos, Retornantes e Leais)?
- → Qual o ticket médio por demografia e tipo de produto?
- → Descontos aumentam vendas ou reduzem margem?
- → Assinantes compram mais vezes?

Essas consultas formaram a base analítica para o dashboard.

### ✅ 4. Construção de Dashboard (Looker Studio)

Os principais insights do projeto foram transformados em visualizações profissionais, incluindo:

- → Tendências de compras
- → Receita por categoria
- → Comportamento de clientes recorrentes
- → Impacto de descontos
- → Distribuição demográfica
- → Ratings e métricas de satisfação

O dashboard permite navegação interativa, filtros e análise dinâmica.

### ✅ 5. Documentação Completa do Projeto

Todo o processo foi documentado de forma clara e organizada, simulando um relatório corporativo:

- → Objetivo do projeto
- → Dados utilizados
- → Métodos de análise
- → Resultados e conclusões
- → Possíveis ações estratégicas

## 📦 Sobre o Dataset

O dataset possui 3.900 linhas e 18 colunas, incluindo:

- ID do cliente, idade, gênero
- Categoria, item, cor, tamanho, estação
- Valor da compra, método de pagamento
- Status de assinatura
- Desconto aplicado
- Compras anteriores
- Frequência média de compra
- Faixa etária calculada
- Avaliação do cliente

Essa variedade permite análises profundas de comportamento do consumidor, preferências e padrões de compra.

## 🎲 Sobre o Projeto.

Este projeto retrada como os analistas de dados realmente trabalham.

- análise exploratória,
- raciocínio de negócio,
- SQL avançado,
- visualização estratégica,
- comunicação de insights,
- e organização de portfólio.

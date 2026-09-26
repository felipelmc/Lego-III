#==============================================================================#
# IESP/UERJ, 2025.I
# LEGO 3 - LISTA 01
# Nome:  <<< preencha seu nome aqui  >>>
# Email: <<< preencha seu email aqui >>>
# Data:  <<< preencha a data aqui    >>>
#==============================================================================#

# +++ INSTRUCOES +++ ===========================================================

# 1. Preencha seu nome, email e data no cabecalho acima

# 2. Edite a secao ``pasta de trabalho`` para indicar a pasta no seu computador 
# onde estao os arquivos necessarios para a lista (este script e os dois arquivos 
# em csv)

# 3. Edite a secao ``pacotes`` para instalar (se necessario) e carregar os scripts
# necessarios para a execucao de TODA a lista

# 4. Acrescente sua resposta aos itens 

# 5. Salve o script com o nome ``SEUNOME-lego3-lista01.r`` e envie para:
# - pedrosouza@iesp.uerj.br
# - rogerio.barbosa@iesp.uerj.br
# - carloscr@iesp.uerj.br

# Somente serao aceitas respostas que usem este script como modelo.


# +++ PASTA DE TRABALHO +++ ====================================================

# Altere o objeto ``pasta_local`` para indicar a pasta contendo os arquivos csv e
# este script. Use barras, e nao contra-barras (por ex: 'c:/iesp/lego3/')

# Pasta local
pasta_local <- '<insira a pasta aqui>'

# Comando para o R usar como referencia a pasta local
setwd(pasta_local)


# +++ PACOTES +++ ==============================================================

# Inclua nesta secao os comandos para carregar todos os pacotes desejados.
# Por ex: library(tidyverse); library(feols) etc.

...


# +++ 4. VARIAVEIS ALEATORIAS CONTINUAS +++ ====================================

# 4.1. Valor esperado de variavel uniforme -------------------------------------

...

# 4.2. Probabilidade acumulada de variavel uniforme ----------------------------

...

# 4.3. Probabilidade acumulada de variavel normal ------------------------------

...

# 4.4. Probabilidade acumulada de variavel logistica padrao --------------------

...

# 4.5. Funcao logit ------------------------------------------------------------

...

# +++ 6. CASOS EXTRACONJUGAIS +++ ==============================================

# 6.2. Implicacoes testaveis do DAG --------------------------------------------

...

# 6.3. Estimando o modelo de probabilidade linear ------------------------------

...

# 6.5. Calculo de valores preditos no LPM --------------------------------------

...

# 6.6. Estimando o modelo logit ------------------------------------------------

...

# 6.8. Calculo de valores preditos no logit ------------------------------------

...

# +++ 7. SELECAO EM OBSERVAVEIS +++ ============================================

# 7.1. Analise descritiva ------------------------------------------------------

...

# 7.2. ATT no experimento ------------------------------------------------------

...

# 7.3. ATT ingenuo nos dados nao experimentais ---------------------------------

...

# 7.4. Estimacao do propensity score -------------------------------------------

...

# 7.5. Propensity score matching com vizinho mais proximo ----------------------

# Propensity score matching com o matchit
M <-
  matchit(formula = treat ~ age + agesq + agecube + education + educationsq +
            black + hispanic + married + re74 + re74sq + re75 + re75sq + 
            u74 + u75,          # formula que usamos para o logit
          data = cps,           # data frame com os dados (edite caso necessario)
          distance = cps$ps,    # propensity scores estimados (idem)
          estimand = 'ATT',     # estimando vai ser o ATT
          method = 'nearest',   # pareamento por proximidade
          ratio = 1,            # com apenas 1 vizinho
          discard = 'treated',  # restricao de suporte comum
          replace = FALSE)      # sem reposicao

# Equilibrio das covariadas antes e depois do pareamento
summary(M)

# data frame so com casos pareados
M_df <- match_data(M)

# Calculo do ATT para re78 
lm(re78 ~ treat, data = M_df)

# 7.6. Inverse probability weighting -------------------------------------------

...

# 7.7. Regressao ---------------------------------------------------------------

...


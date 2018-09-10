library(tidyverse) 
# Não pode dar só require(stringr), porque abaixo é usada a função tibble 
# que é de outro pacote

# str_c - concatena strings
rio <- "Rio de Janeiro"
str_c("O", rio, "é lindo", sep = " ") 

pessoas <- c("Godofredo", "Josefa")
lugares <- c("Minas Gerais", "São Paulo")
str_c(pessoas, " nasceu em ", lugares, ".")

# str_count - conta o número de ocorrências de determinado caracter(es) na string
frutas <- c("maçã", "pêra", "banana", "abacaxi")
str_count(frutas, "a")

# str_detect - detecta a localizacao da string desejada, TRUE se existir, FALSE caco contrário
str_detect(frutas, "pêra")

# str_replace - modifica a primeira ocorrência
str_replace(frutas, "a", "/")

# str_replace_all - modifica todas as ocorrências
str_replace_all(frutas, "a", "/")

## Perceba a diferença de str_replace para str_replace_all nas palavras 'banana' e 'abacaxi'
# Esse comentário poderia ser só na narração

# str_replace_na - substitui 'NA'
df1 <- tibble(key = c(1,2,3,4), frutas = frutas)
df2 <- tibble(key = c(1,2,5,6), numeros = c(1, 2, 4, 6))
df <- full_join(df1, df2, by = "key")
df

## Caso queiramos a troca num vetor:
str_replace_na(df$frutas, "-")
str_replace_na(df$numeros, "999")

# ## mas imagina que você tem uma base de dados com muitas colunas, o map deixa isso bem mais prático
# df %>% map_df(~ .x %>% str_replace_na("-"))
# Ao invés de usar o map (que é do purrr), que nunca foi apresentado, seria
# melhor usar o (já conhecido) dplyr

df %>% 
  mutate(frutas = str_replace_na(frutas, "-"),
         numeros = str_replace_na(numeros, "-"))

# Caso queiram usar outra função, baseada no mutate, mas com sintaxe parecida com o map:
df %>% 
  mutate_all(str_replace_na, "-")
# mutate_all = modificar todas as colunas

# str_length - conta o número de caracter das strings
str_length(frutas)

# str_sort - ordem alfabética crescrente e decrescente
str_sort(frutas)
str_sort(frutas, decreasing = TRUE)

# str_sub - extrai partes da string
str_sub("Godofredo", start = 4)  # extrair a partir do 4º caracter
str_sub("Godofredo", end = 6)    # extrair até o 6º caracter
str_sub("Godofredo", start = 4, end = 6) # extrair a partir do 4º caracter até o 6º

# str_to_title - coloca a primeira letra de cada palavra em maiúsculo
str_to_title("são paulo")

# str_to_upper - coloca todas as letras em maiúsculo
str_to_upper("uff")

# str_to_lower - coloca todas as letras em minúsculo
str_to_lower("STRINGR")

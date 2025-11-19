
# Testes de Hipóteses em R
# Exemplo prático: comparação de vendas entre dois grupos e ANOVA

set.seed(123)
# Simulando dados de vendas para dois grupos
vendas_grupo_a <- rnorm(50, mean=200, sd=20)
vendas_grupo_b <- rnorm(50, mean=210, sd=22)

# t-teste para comparar médias
resultado_t <- t.test(vendas_grupo_a, vendas_grupo_b)
print("Resultado do t-teste entre Grupo A e Grupo B:")
print(resultado_t)

# Simulando dados para ANOVA
grupo <- rep(c("A", "B", "C"), each=40)
tempo <- rep(1:40, 3)
vendas <- c(rnorm(40, 200, 20), rnorm(40, 210, 22), rnorm(40, 220, 25))
df <- data.frame(vendas, grupo, tempo)

# ANOVA: efeito do grupo e do tempo
anova_result <- aov(vendas ~ grupo + tempo, data=df)
print("Resultado da ANOVA:")
summary(anova_result)

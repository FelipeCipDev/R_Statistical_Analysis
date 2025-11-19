
# Análise de Séries Temporais em R

set.seed(42)
# Simulando dados mensais de vendas (4 anos)
vendas <- 200 + 10 * (1:48) + 30 * sin(2 * pi * (1:48)/12) + rnorm(48, 0, 15)
ts_data <- ts(vendas, frequency=12, start=c(2020,1))

# Plotando a série temporal
plot(ts_data, main="Série Temporal de Vendas", ylab="Vendas", xlab="Ano")

# Decomposição da série
decompose_result <- decompose(ts_data)
plot(decompose_result)

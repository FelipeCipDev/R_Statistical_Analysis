
# Regressão Avançada e Machine Learning Estatístico

set.seed(123)
# Simulando dados de clientes
n <- 200
idade <- round(runif(n, 18, 70))
valor_contrato <- round(rnorm(n, 300, 80))
# Probabilidade de churn aumenta com idade e diminui com valor do contrato
prob_churn <- plogis(-5 + 0.05*idade - 0.01*valor_contrato)
churn <- rbinom(n, 1, prob_churn)
clientes <- data.frame(idade, valor_contrato, churn)

# Ajustando modelo GLM (logístico)
glm_model <- glm(churn ~ idade + valor_contrato, family=binomial, data=clientes)
summary(glm_model)

# Previsão e matriz de confusão
clientes$prob_pred <- predict(glm_model, type="response")
clientes$churn_pred <- ifelse(clientes$prob_pred > 0.5, 1, 0)
table(Predito=clientes$churn_pred, Real=clientes$churn)

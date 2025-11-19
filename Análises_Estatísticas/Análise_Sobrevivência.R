
# Análise de Sobrevivência em R

# Instale o pacote survival se necessário:
# install.packages("survival")
library(survival)
set.seed(42)
# Simulando dados de tempo até evento para dois grupos
n <- 100
grupo <- rep(c("A", "B"), each=n/2)
tempo <- c(rexp(n/2, rate=0.1), rexp(n/2, rate=0.07))
evento <- rbinom(n, 1, 0.8) # 80% dos casos observados
df <- data.frame(tempo, evento, grupo)

# Objeto de sobrevivência
surv_object <- Surv(df$tempo, df$evento)
# Ajuste de Kaplan-Meier
km_fit <- survfit(surv_object ~ grupo, data=df)
print(km_fit)
plot(km_fit, col=c("blue","red"), lwd=2, xlab="Tempo", ylab="Probabilidade de Sobrevivência", main="Curvas de Sobrevivência Kaplan-Meier")
legend("topright", legend=levels(factor(df$grupo)), col=c("blue","red"), lwd=2)

#################################################
# simulate data for varying intercepts regression
#################################################

# simulate data for multiple groups ------------------------------------------------

#set seed for reproducing results
set.seed(3)
#number of data points per group
PGN <- 30
#number of groups
J <- 5
#number of data points
N <- PGN * J
#group ids
gid <- rep(1:J, each = 30)
#simulate predictors (standardized)
food_std <- rnorm(N, 0, 1)
#generating intercept and slope values
mu_alpha <- 40
sigma_alpha <- 6
beta <- 3
#simulate different alpha params
alpha <- rnorm(J, mu_alpha, sigma_alpha)
#simulate linear predictor
mu <- rep(NA, length = N)
counter <- 1
for (i in 1:J)
{
  #i <- 1
  idx <- counter:(counter + PGN - 1)
  mu[idx] <- alpha[i] + beta * food_std[idx]
  counter <- counter + PGN
}
#process error (wrt relationship between food and bird weight)
sigma <- 3
#simulate y values
bird_weight <- rnorm(N, mu, sigma)

df <- data.frame(bird_weight, food_std, gid)


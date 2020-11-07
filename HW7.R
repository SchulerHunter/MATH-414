# Write outputs to file
sink('HW7.txt')

# Declare number of observations (910350550)
Nsim = 91035

# Generate Nsim obserations of norm(100, sqrt(255)) distribution
normData = rnorm(Nsim, 100, sqrt(255))

# Calculate exact values
# For P(X => 112)
ex1 = 1-pnorm(111, 100, sqrt(255)); ex1
# For P(X => 105 | X < 135) = P(X => 105 & X < 135) / P(X < 135) = (P(X < 135) - P(X < 105)) / P(X < 135)
ex2 = (pnorm(134, 100, sqrt(255)) - pnorm(104, 100, sqrt(255)))/pnorm(134, 100, sqrt(255)); ex2
# For score seperating x_6 from x_94
ex3 = qnorm(.94, 100, sqrt(255)) - qnorm(.06, 100, sqrt(255)); ex3
# For the percentile of this score
ex4 = pnorm(ex3, 100, sqrt(255))*100; ex4
# For the x_a name for this percentile
ex5 = 100 - ex4; ex5

# Calculate estimated values
# For P(X >= 112)
es1 = sum(normData >= 112)/Nsim; es1
# For P(X => 105 | X < 135) = P(X > 104 & X < 135) / P(X < 135) = (P(X < 135) - P(X < 105)) / P(X < 135)
es2 = sum(normData >= 105 & normData < 135)/sum(normData < 135); es2

# Calculate errors
abs(ex1-es1)/ex1
abs(ex2-es2)/ex2

# Generate Nsim observations of unif(0, 30) distribution
unifData = runif(Nsim, 0, 30)

# Calculate exact values
# For wait is less than four minutes (arrives between 7:11-7:15 and 7:26-7:30)
# Which becomes P(X <= 15) - P(X <= 10) + P(X <= 30) - P(X <= 25)
ex1 = punif(15, 0, 30) - punif(10, 0, 30) + punif(30, 0, 30) - punif(25, 0, 30); ex1
# For wait is more than nine minutes (arrives between 7:01-7:06 and 7:16-7:21)
# Which becomes P(X <= 5) - P(X <= 0) + P(X <= 20) - P(X <= 15)
ex2 = punif(5, 0, 30) - punif(0, 0, 30) + punif(20, 0, 30) - punif(15, 0, 30); ex2

# Calculate estimated values
# For wait is less than four minutes (arrives between 7:11-7:15 and 7:26-7:30)
# Which becomes P(X <= 15) - P(X < 11) + P(X <= 30) - P(X < 26)
es1 = (sum(unifData <= 15 & unifData > 10) + sum(unifData <= 30 & unifData > 25))/Nsim; es1
# For wait is more than nine minutes (arrives between 7:01-7:06 and 7:16-7:21)
# Which becomes P(X < 6) - P(X < 1) + P(X < 21) - P(X < 16)
es2 = (sum(unifData < 6 & unifData >= 1) + sum(unifData < 21 & unifData >= 16))/Nsim; es2

# Calculate errors
abs(ex1-es1)/ex1
abs(ex2-es2)/ex2

# Calculate exact values
# For no messages arrive in the next five minutes
# 15/60 = lambda/5 => lambda = 1.25
ex1 = ppois(0, 1.25); ex1
# For no messages arrive in the next four minutes given no messages in the previous five
# Since each message arrives independently, it becomes no messages arriving in four minutes
ex2 = ppois(0, .25); ex2

# Calculate estimated values
# For no messages arrive in the next five minutes
# 15/60 = lambda/5 => lambda = 1.25
# Generate data with this lambda
poisData1 = rpois(Nsim, 1.25)
# Estimate the value
es1 = sum(poisData1 == 0)/Nsim; es1
# For no messages arrive in the next four minutes given no messages in the previous five
# Since each message arrives independently, it becomes no messages arriving in four minutes
# Generate data with original lambda
poisData2 = rpois(Nsim, .25)
# Estimate the value
es2 = sum(poisData2 == 0)/Nsim; es2

# Calculate errors
abs(ex1-es1)/ex1
abs(ex2-es2)/ex2

sink()
q()
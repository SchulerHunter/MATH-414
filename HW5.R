# Write outputs to file
sink('HW5.txt')

# Declare number of observations (910350550)
Nsim = 91035

# Generate Nsim observations for binom(16, .58) distribution
binomData = rbinom(Nsim, 16, .58)

# Calculate exact values
ex1 = dbinom(9, 16, .58); ex1 # For X = 9
ex2 = pbinom(9, 16, .58); ex2 # For X <= 9
ex3 = 1-pbinom(9, 16, .58); ex3 # For X > 9
ex4 = pbinom(8, 16, .58); ex4 # For X < 9
ex5 = pbinom(12, 16, .58)-pbinom(6, 16, .58); ex5 # For 7 <= X < 13

# Calculate estimated values
es1 = sum(binomData == 9)/Nsim; es1 # For X = 9
es2 = sum(binomData <= 9)/Nsim; es2 # For X <= 9
es3 = sum(binomData > 9)/Nsim; es3 # For X > 9
es4 = sum(binomData < 9)/Nsim; es4 # For X < 9
es5 = sum(binomData >= 7 & binomData < 13)/Nsim; es5 # For 7 <= X < 13

# Calculate errors
abs(ex1-es1)/ex1
abs(ex2-es2)/ex2
abs(ex3-es3)/ex3
abs(ex4-es4)/ex4
abs(ex5-es5)/ex5

# Create histogram of data
hist(binomData)

# Generate Nsim observations for pois(6.4) distribution
poisData = rpois(Nsim, 6.4)

# Calculate exact values
ex1 = ppois(6, 6.4); ex1 # For X < 7
ex2 = dpois(7, 6.4); ex2 # For X = 7
ex3 = ppois(10, 6.4) - ppois(5, 6.4); ex3 # For 6 <= X < 11

# Calculate estimated values
es1 = sum(poisData < 7)/Nsim; es1 # For X < 7
es2 = sum(poisData == 7)/Nsim; es2 # For X = 7
es3 = sum(poisData >= 6 & poisData < 11)/Nsim; es3 # For 6 <= X < 11

# Calculate errors
abs(ex1-es1)/ex1
abs(ex2-es2)/ex2
abs(ex3-es3)/ex3

# Create a histogram of data
hist(poisData)
sink()
q()
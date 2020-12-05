Nsim = 91035 # 910350550
xvals = array(0,Nsim) # Generate array of Nsim items to store sums of each poisson distribution
for(i in 1:Nsim) { # Iterate over Nsim items
    xvals[i] = sum(rpois(33, 1)) # Add sum of each poisson distribution to xvals array
}
sum(xvals >= 27) / Nsim # Estimate the probability that a sum will be at least 27

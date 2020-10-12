Nsim = 91035
    # This specifiesthe number of simulated phones

factory = sample( c('F1','F2','F3','F4'), size = Nsim, replace = TRUE, prob = c(0.26, 0.34, 0.25, .15)) 
    # Generate variable called factory through sampling from possible values F1, F2, F3, F4
    # with the corresponding probabilities 0.26, 0.34, 0.25, and 0.15

defective = rep(NA, Nsim) 
    # Create a dummy variable which will be filled with 
    # Yes (defective) or No (non-defective) with appropriate probabilities

for (i in 1:Nsim) { # Forloop in R to go over all Nsim simulated phones
    if (factory[i] == 'F1')  defective[i] = sample(c('Yes','No'), size = 1, prob=c(0.015,0.985))
        # ifstatement in R allows to introduce conditioning on a phone being produced in factory 1,
        # then it is assigned to be defective or not with respective probabilities 0.015 and 0.985

        # Similarly below is the conditioning on being produced in factories 2, 3, and 4
    if (factory[i] == 'F2')  defective[i] = sample(c('Yes','No'), size = 1, prob=c(0.01,0.99))
    if (factory[i] == 'F3')  defective[i] = sample(c('Yes','No'), size = 1, prob=c(0.02,0.98))
    if (factory[i] == 'F4')  defective[i] = sample(c('Yes','No'), size = 1, prob=c(0.014,0.986))
}

sum(defective=='Yes') / Nsim 
    # Compute the proportion of phones that are defective (out of all phones), i.e. 𝑃(𝐷)

sum(factory=='F3' & defective=='Yes') / sum(defective=='Yes')
    # Compute the proportion of factory 3 phones out of those that are defective, i.e. 𝑃(𝐹3|𝐷).
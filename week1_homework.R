' ' '
1. Suppose the globe tossing data (Chp. 2) had turned out to be 4 water and 11 land.
Construct the posterior distribution, using grid approximation. Use the same flat
prior as in the book.
'''

p_grid <- seq(from=0, to=1, length.out=1000)
prior <- rep(1, 1000)
likelihood <- dbinom(4, size=15, prob=p_grid)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
plot(p_grid, posterior, type="l",
     xlab="probability of water", ylab="posterior probability")
mtext("1000 points")

' ' '
2. Now suppose the data are 4 water and 2 land. Compute the posterior again,
but this time use a prior that is zero below p = 0.5 and a constat
above p = 0.5. This corresponds to prior information that a majority
of the Earths surface is water.
'''
p_grid <- seq(from=0, to=1, length.out=1000)
prior <- c(rep(0,500), rep (2,500))
likelihood <- dbinom(4, size=6, prob=p_grid)
unstd.posterior <- likelihood * prior
posterior <- unstd.posterior / sum(unstd.posterior)
set.seed(100)
samples2 <- sample(p_grid, prob=posterior, size=1e4, replace=TRUE)
plot(p_grid, posterior, type="l",
     xlab="probability of water", ylab="posterior probability")
mtext("1000 points")

'''
3. For the posterior distribution from 2, compute 89% percentile and
HPDI intervals. Compare teh widths of these intervals. Which is widerr?
Why? If you had only hte information in the interval, what might you
understand about the shape of the posterior distribution?
'''


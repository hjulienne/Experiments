library(mvnorm)
library(FactoMineR)
#Let's see if measuring correlated variable on few sample enables to better estimate their causal factor

N = 5

# Causal factor:

Inflammation = rnorm(N)


# Observable variables:

p = 100
O = matrix(rep(0, N*p), ncol=p)

for(i in 1:p)
{
  c = runif(n = 1, 0.5,0.7)
  o = c * Inflammation + 0.6 * rnorm(N)
  print(cor(o, Inflammation))
  O[,i] = o
}


# Apply a PCA on correlated variables:


pca1 = PCA(O)

cor(Inflammation, pca1$ind$coord[,1])

  

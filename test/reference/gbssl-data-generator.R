library(lsa)
library(MASS)
X = rbind(
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4),
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4), 
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4), 
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4),
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4),
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4), 
  c(2,5,6,0,0,0,0,0),
  c(0,0,3,2,8,0,0,0),
  c(0,0,0,0,1,4,4,4)
)
Y = round(cosine(t(X)), digits=3)
write.matrix(Y, "y.csv", sep=",")
# Then a little Vim magic to add parents.  A copy of this is in test/data/gbssl_X.txt

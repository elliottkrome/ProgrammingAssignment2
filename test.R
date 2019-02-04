source("cachematrix.R")

m <- makeCacheMatrix(toeplitz(c(3:-1)))

cacheSolve(m)  # does the solving (first time the inverse has been requested)
cacheSolve(m)  # "getting cached message" (no need to solve now)

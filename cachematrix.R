# Over the course of running this-or-that algorithm on some data, the
#  algorithm might repeatedly call for the inverse of a matrix (in a
#  manner which might not be predictable at the outset).
# Because matrix inversion can become very expensive for large
#  matrices, it would be nice to only do the matrix inversion the first
#  time it is requested, and cache the result for later use.
# # The following two functions allow for this.

# `makeCacheMatrix' is the constructor function for a "cachedMatrix". 
# It is manipulated by the `cacheSolve' function
# It groups the following 4 set / get methods to store values
#  as needed in a semi-protected way.
# - set:    set the value of the matrix
# - get:    get the value of the matrix
# - setinv: set the value of the inverse
# - getinv: the value of the inverse
makeCacheMatrix <- function(x = numeric()) {
  inv_ <- NULL
  set <- function(y) {
    x <<- y
    inv_ <<- NULL
  }
  get <- function() x 
  setinv <- function(inv) inv_ <<- inv
  getinv <- function() inv_
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

# `cacheSolve' manipulates "cacheMatrix" objects (lists of functions)
# If the matrix has already been inverted, it simply fetches that data.
#  Otherwise, it calls the function `solve' to do the inversion.
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}

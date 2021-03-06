## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
  # initially nothing is cached so set it to NULL
  cache <- NULL
  # store a matrix
  setMatrix <- function(newValue) {
    x <<- newValue
    # since the matrix is assigned a new value, flush the cache
    cache <<- NULL
  }
  # returns the stored matrix
  getMatrix <- function() {
    x
  }
  # cache the given argument 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  # get the cached value
  getInverse <- function() {
    cache
  }
  # return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
  
}
## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  inverse
}
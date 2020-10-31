## This function creates a special "matrix" object that can cache its inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

##

makeCacheMatrix <- function(x = matrix()) {             ## define the argument with default mode of "matrix"
  a <- NULL                                             ## initialize inv as NULL; will hold value of matrix inverse
  set <- function(y){                                   ## define the set function to assign new
  x <<- y                                               ## value of matrix in parent environment
  a <<- NULL                                            ## if there is a new matrix, reset inv to NULL
  }
  get <- function()x                                    ## define the get fucntion - returns value of the matrix argument
  setInverse <- function(inverse) a <<- inverse         ## assigns value of inv in parent environment
  getInverse <- function() a                            ## gets the value of inv where called
  list(set = set, get = get,                            ## you need this in order to refer
  setInverse = setInverse,                              ## to the functions with the $ operator
  getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(a)){
  message("getting cached data")
  return(a)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(a)
  a
}

## This file contains below 2 functions 
## 1.makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## 2.cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix in point 1. 
##              If the inverse has already been calculated (and the matrix has not changed),then the cachesolve will
##              retrieve the inverse from the cache.

## Function makeCacheMatrix will take variable x as matrix and will do the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
 ##"Setter":Set Function definiation along with variable assignment
        set <- function(new_mat) {
                x <<- new_mat
                inv <<- NULL
        }
 ##"Getter":Getting the value of the Vector
        get <- function() x
 ##"Setter":Assigning Inverse to setInverse
        setInverse <- function(inverse) inv <<- inverse
 ##"Getter":Variable to get Inverse when called
        getInverse <- function() inv
 ##Setter/Getter for accessing the variables using $
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix defined above.
## Takes Matrix x as first input allowing multiple parameters as input.
cacheSolve <- function(x, ...) { 
  
  ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
  ##Checking if matrix is existing for avoiding re-calculation and returning the inverse
    if(!is.null(inv)) {
        message("Inverse already aviliable, Reading from Cache")
        return(inv)
    }
  ##Assigning matrix x to a variable
    var_mat <- x$get()
  ##Solving for inverse
    inv <- solve(var_mat, ...)
  ##passing inverse of the matrix to setter
    x$setinverse(inv)
    inv
}

## These two functions create a matrix that can cache its inverse. The second function 
## returns the inverse of the matrix created by the first function

## This function creates a special "matrix" object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
   set <- function(y){
       x<<- y
       inv<- NULL
 }
 get<- function() x
 setInverse<- function(solveMatrix) inv<<- solveMatrix
 getInverse<- function() inv
 list(set=set, get= get, setInverse= setInverse, getInverse= getInverse)
 
}



## This function returns a matrix wich is the inverse of 'x'

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  return(inv)      
}


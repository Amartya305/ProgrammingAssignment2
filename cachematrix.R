##The following functions are used to create an 
##object that stores a matrix and caches its inverse


## makeCacheMatrix creates a matrix, 
##which is really a list containing a function to:
##1.set the value of the matrix
##2.get the value of the matrix
##3.set the value of the inverse
##4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    	inv <- NULL
  	set <- function(y) {
          			x <<- y
          			inv <<- NULL
  				}
  	get <- function() x
  	setinverse <- function(inverse) inv <<- inverse
  	getinverse <- function() inv
  	list(set = set,get = get,setinverse = setinverse,getinverse = getinverse)
	}


##cacheSolve computes the inverse of the matrix 
##returned by makeCacheMatrix . If the inverse has 
##already been calculated (and the matrix has not changed), 
##then it retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  	inv <- x$getinverse()
  	if (!is.null(inv)) {
          	message("getting cached inverse matrix")
          	return(inv)
  		}
  	data <- x$get()
  	inv <- solve(data, ...)
  	x$setinverse(inv)
  	inv
	}
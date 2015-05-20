## The functions below help us to cache the inverse of a matrix rather than compute it repeatedly. 


## The function "makeCacheMatrix" spits out a special matrix, namely a list of functions, which then allow us to get and set matrices. 
## in an analogous fashion as the makecachevector for the example "Caching the Mean of a Vector"

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  
  setinverse <- function(solve) m <<- solve
  
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## The function "cacheSolve" checks first whether the inverse matrix of x was already computed. If it was it spits 
## out the cached value, otherwise it computes it and sets  

cacheSolve <- function(x, ...) {
        
  m <- x$getinverse( )
  if(!is.null( m )) {
    message("getting cached data")
    return(m)
  }
  data <- x$get( )
  m <- solve(data, ...)
  x$setinverse( m )
  m
  
  
}
  


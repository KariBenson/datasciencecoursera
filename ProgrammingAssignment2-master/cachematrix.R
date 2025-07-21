
## These functions work in concert to check whether there is a cached inverse matrix stored, and, if not, to store one for the matrix "x"

makeCacheMatrix <- function(x = matrix()) {

# set value of matrix
  invMat <- NULL
 
# get value of matrix
 set <- function(n) {
    # make sure invMat starts empty
    x <<- n
    invMat <<- NULL 
      }
 
# get matrix inverse
  get <- function () x
  setinvMat <- function(solve) invMat <<- solve

# store matrix inverse
  getinvMat <- function () invMat
  list(set = set, get = get, setinvMat = setinvMat, getinvMat = getinvMat)

 
}

#
# 

cacheSolve <- function(x, ...) {

# check cache 
  n <- x$getinvMat()
  if(!is.null(n)){
    message("getting cached data")
    return(n)
  }
# calculate if not cached  
  data <- x$get()
  n <- solve(data,...)
  x$setinvMat(n)
  n
  
}

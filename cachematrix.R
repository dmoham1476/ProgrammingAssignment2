## Put comments here that give an overall description of what your
## functions do

#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

#The makecahcematrix function will take advantage of the scoping rules of the R language

makeCacheMatrix <- function(X = matrix()) { 
 inverse <- NULL 
 set <- function(Y){ 
 	X <<- Y 
 	inverse <<- NULL 
 	} 
 get <- function() X 
 setinverse <- function(Inverse) inverse <<- Inverse 
 getinverse <- function() inverse 
 list(set=set,get=get,setinverse=setinverse,getinverse=getinverse) 
 } 




## Write a short comment describing this function
## calculate inverse of a matrix if it doesnt exist in the cache.

cacheSolve <- function(X, ...) {
        ## Return a matrix that is the inverse of 'x'

##We need corpor library for pseudoinverse function
if(require("corpcor")){ 
 	print("corpcor is loaded correctly") 
 	} else { 
 		print("trying to install corpcor") 
 		install.packages("corpcor") 
 		if(require(corpcor)){ 
 			print("corpcor installed and loaded") 
 			} else { 
 			stop("could not install corpcor") 
 			} 
 		} 

inverse <- X$getinverse() 
 if(!is.null(inverse)){ 
 	message("matrix is in memory") 
 	return(inverse) 
 	} 
 message("inverse is not in memory so the inverse (if exist) is gonna be computed") 
 data <- X$get() 
 inverse <- pseudoinverse(data, ...) 
 X$setinverse(inverse) 
 inverse 


}

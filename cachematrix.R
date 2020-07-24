#Caching the Inverse of a Matrix using the functions makeCacheMatrix and cacheSolve

#first function makeCacheMatrix it creates a special
# matrix to set and get the value of matrix and inverse
# Basically to cache matrix's inverse

 makeCacheMatrix<- function( x = matrix()){
      j<-NULL
	set<-function(y){
	x<<-y       #operator "<<-" assigns the value of this object to a different environment
	j<<-NULL
	}
get<- function()x
setInverse<-function(inverse)j<<-inverse
getInverse<-function()j
list(set=set,get=get,
setInverse=setInverse,
getInverse=getInverse)
}

#second function cacheSolve
#computes the inverse of the special matrix returned by the above function
#decides to either calculate or retrive the cache 

cacheSolve <- function(x,...){
## Return a matrix that is the inverse of 'x'
	j<-x$getInverse()
	if(!is.null(j)){
	message("getting cache data")
	return(j)
	}
mat<-x$get()
j<-solve(mat,...)
x$setInverse(j)
j
}

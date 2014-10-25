
## This function creates a special "matrix" object that can cache the inverse of an inputted matrix.

makeCacheMatrix <- function(x = matrix()) {

m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


cacheSolve <- function(x, ...) {

m <- x$getinverse()

if(is.null(m)){

matrix <- x$get()

print("calculating inverse matrix")

m <- solve(matrix)

x$setinverse(m)

return(m)

} else {

print("getting cached data")

return(m)

}


}

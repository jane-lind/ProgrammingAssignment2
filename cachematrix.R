## This code is divided into two depended functions:
## The first function creates a list of functions that are generated based on the input matrix, where values can be cached,
## used or altered in the second function. These two functions inverse the input matrix.


## Inspired from the code in the assignment:

## makeCacheMatrix creates a list of functions that are generated based on the input matrix.
## The function is explained in 6 steps.
## 1. The inverse variable "i" is set to NULL in the environment of the main function. 
## 2. The "set" (reset) function is created, and if called in cacheSolve, the input will overwrite the parent (the main function) environment's "x" variable and reset "i" to NULL.
## 3. The "get" function stores the input matrix.
## 4. The "setsolve" assigns a value to the "i" variable (if called in "cacheSolve").
## 5. The "getsolve" will output the value stored in "i" (either NULL or an assigned value if "setsolve" is run).
## 6. Finally, the list containing the functions is created and outputted.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) i <<- solve
    getsolve <- function() i
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## cacheSolve catches the variables from the list generated from makeCacheMatrix and generates an inverse matrix if it hasn't be done already.
## The function is explained in 6 steps.
## 1. The inverse variable "i" is assigned the value cached from the "getsolve" function.
## 2. If the "i" variable is not empty (NULL) the cacheSolve function returns a message and the value in "i".
## 3. If the "i" variable IS empty, the matrix inputted in "makeCacheMatrix" is retrieved from the "get" function and assigned to the "data" variable.
## 4. The inverse of the matrix is then calculated using solve function and stored in the "i" variable.
## 5. "i" is then assigned to the input function list (generated in makeCacheMatrix) by using the "setsolve" function.
## 6. Finally, the inverse matrix is outputted.

cacheSolve <- function(x, ...) {
    i <- x$getsolve()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setsolve(i)tion
    i
}

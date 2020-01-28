# Scheme - Part 2

## Tail Call Recursion
As opposed to normal recursion, tail call recursion requires the recursive call to be in the tail position.

```scheme

```

Scheme requires tail calls to be implemented as jumps, i.e. that no frames are wasted.

## Higher Order Functions
Higher order functions are functions of order 2 or above, meaning they take parameters of order 1 or above.
In other words, higher order functions can take and return functions.

### Map
Map takes a list, applies a function to each element and returns a list of the same length.

### Filter
Filter takes a list and a predicate, returning a second list with only the elements where the predicate returns true.

### Reduce
Reduce takes a list and a reduce function, folding the list until only a single element remains.

### Zip
Zip takes two lists and a function, and uses the function to merge the two lists into a single list, which it returns.
The lists have to have the same length.


## Currying
The idea behind currying is that each function only takes a single parameter.
Instead of the following:
```scheme
(λ (a b c) (+ a b c))
```
A function would be implemented as a cascade of functions, such that:
```scheme
(λ (a)
    (λ (b) 
        (λ (c) 
        (+ a b c))))
```

By then calling the function with less than 3 parameters, we receive a new function, which takes the rest of the parameters.
This allows us to compose functions more lazily, and is known as currying, after Haskell Curry.
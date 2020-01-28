# Haskell - Part 2
Haskell uses lazy evaluation by default.

## Lazy Evaluation
Due to the default of Haskell being lazy evaluation, it has some nice properties:
- It is natural to define infinite structures
- It is natural to utilize infinite structures in functions

The stream of ones in Haskell is defined as:
```haskell
ones = 1 : ones
```

### Map
```haskell
map :: (a -> b) -> [a] -> [b]
```
### Filter
```haskell
filter :: (a -> Bool) -> [a] -> [a]
```
### Foldl
```haskell
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
```
### Foldr
```haskell
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
```

## Recursive Functions and Datatypes
```haskell
type String = [Char]
```

In the following snippet, `True` and `False` are called term constructors.
*Constructors are functions.*
Term constructors always start with a capital letter.
```haskell
data Boolean = True | False
```

A binary tree might be represented like so:

```haskell
data Tree = Leaf Int | Branch Tree Tree
    deriving Show
```

In the above snippet, the Tree is recursively defined in terms of itself, or leaves.


### Term and Type Constructors
Consider the snippet below:

```haskell
data Tree a = Leaf a | Branch (Tree a, Tree a)
```

`Tree` in this case is a type constructor, as it can be used to construct a tree type with a variable type a, such as `Tree Int`, where each leaf will contain an integer.
`Leaf` and `Branch`, however, are term constructors.


### Functions on Recursive Structures
Essentially, recursive structures are naturally parsed via recursive functions and pattern matching.
The `Tree` example could be expanded to include a function which counts the number of nodes, for example.

```haskell
count_nodes :: Tree -> Int
count_nodes (Leaf a) = 1
count_nodes (Branch (a, b)) = (count_nodes a) + (count_nodes b)
```

## List Comprehensions and Ranges
List Comprehensions make it easy to express Set Expressions.
```haskell
evens = [2*i | i <- [1..]]
```
Such a simple list comprehension has two parts:
1. The function
2. The generator

Basically, this works like a map function.
Given a list (created by the generator), we apply the function to each element and return the result.

In the case of the `evens` function, the generator is the range of all integers starting with one.
The function applied to this list is `i*2`, which neatly creates all even numbers.

Optionally, you may also use a guard, which is a predicate function for filtering the results of the list comprehension.
Consider the following snippet:

```haskell
evensevens = [2*i | i <- [1..], i `mod` 7 == 0]
```
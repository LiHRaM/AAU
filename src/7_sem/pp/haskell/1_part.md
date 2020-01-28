# Haskell - Part 1

## Types
- Type class: A family of types who shares a property defined by the type class.
    - Show: Class of types whose values can be displayed
    - Eq: Class of types whose values can be compared wrt `=`
    - Num: Class of number types.
    - Ord: Class of types whose values can be ordered wrt `<`

### Simple Types
> Types that are not composed of other types

- Bool
- Int

#### Numerals
- Int
- Integer
- Float
- Double





### Composite Types
> Types that are built with simpler types

- `(Bool, Int)`
- `[Char]`




### Simple Terms

### Composite Terms


## Functions
A lambda function is defined as follows:

```haskell
\x -> x + 1
```

All functions in Haskell accept only one parameter, but they can be curried.
```haskell
f a = a + 1

f = \a -> a + 1

f a b = a + b

f = \a -> \b -> a + b
```

All curried functions are higher order functions, as they accept in their body a function as a parameter.

### Pattern Matching
Instead of using convoluted if expressions, we may use pattern matching.
Consider the following snippet:

```haskell
f lst = if list == [] then 0 else (+ 1) . length $ tail lst

f [] = 0
f (x:xs) = ...
```


### Local Declarations
Functions may be simplified by creating intermediate steps using let declarations

#### Where
```haskell
f a b = a `plus` b
    where
        plus = (+)
```
#### Let
```haskell
f a b = let plus = (+) in a `plus` b
```
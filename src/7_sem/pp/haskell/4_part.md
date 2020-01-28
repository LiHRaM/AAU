# Haskell - Part 4

## Type Inference, or the W Algorithm
> There exists an algorithm that will take any expression `e` and attempt to compute the type of `e`.
- Moreover: The algorithm finds a type for `e` <=> `e` has a type.
- The type that the algorithm finds is the principal type of `e`.

In other words, we consider parametric polymorphism.

The W algorithm takes an environment and an expression, returning a type.
```
W(E, e) = t
```

W stands for *well-typed*.
The algorithm is recursive.

If the algorithm succeeds, it returns a type substitution.
Example:
```
δ = [a ↦ Int, b ↦ (Bool -> Bool)]
```

### Unification
Sometimes the W algorithm will have to solve an equation over types.

Consider the following type equation:
```haskell
a -> Int = Bool -> b
```
For this equation, the unifier could be:
```
δ = [a ↦ Bool, b ↦ Int]
```
Resulting in:
```haskell
Bool -> Int
```

The Unification algorithm takes two type expressions and returns a δ, iff t_1δ = t_2δ

### W Algorithm
Takes EXPTIME, that's all you need to know, innit?
Usually this is not so bad, however.

## Type Classes in the Type System
> Types are sets of values. Type classes are sets of types.

## I/O in Haskell
Input/Output in Haskell is enabled by IO actions.
A function which gets a line from input, for example, could be implemented like so:
```haskell
getLine' = do
  w <- getChar
  case w of
    '\n' -> return []
    _    -> do
      ws <- getLine'
      return (w:ws)
```

A dialog could be programmed as follows:
```haskell
main = do
    w <- getLine
    putStrLn $ "You wrote " ++ w
```

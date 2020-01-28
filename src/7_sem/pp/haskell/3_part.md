# Haskell - Part 3

## Parametric and Ad Hoc Polymorphism
There are two kinds of Polymorphism in Haskell.
Parametric polymorphism is supported by the type system, and typified by the following snippet:
```haskell
func :: a -> a
```

Ad hoc polymorphism is supported by type classes, and is shown in the following snippet:

```haskell
func :: Num a => a -> a
```

## Type Classes in Haskell
> Type Class = Family of Types
A type class in Haskell is an interface, rather than an implementation.

```haskell
class Eq a where
    (==) :: a -> a -> Bool
```

Implementing an instance of a type class is done as follows:

```haskell
instance Eq Integer where
    x == y = x `integerEq` y
```

Showing a dependency between type classes is done as follows:
```haskell
instance (Eq a) => (Ord a) where
    (<), (<=), (>=), (>) :: a -> a -> Bool
    max, min :: a -> a -> a
```

## Specialization, Generalization and Principal Types
Consider the following Lambda Calculus snippet:
Specialization is "implementing" a general type, i.e.
```haskell
-- General type
f :: Num a => a -> a

-- Specialized type
f :: Int -> Int
```

A principal type is the most general type for an expression.

## Hindley-Milner Type System
The HM type system contains two specialized rules: `project` and `close`, where `project` finds the specialized case, and `close` finds the general case.
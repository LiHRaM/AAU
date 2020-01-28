# Scheme - Part 1

## Literature
- [The Scheme Programming Language](https://www.scheme.com/tspl4/)
- [An Introduction to Functional Programming Through Lambda Calculus](https://people.cs.aau.dk/~normark/pp-*/gjm.lambook88-3.pdf)

## Learning Goals
Establish an overall understanding of functional programming to understand the basic characteristics of Lisp.

* Expressions
    * Symbolic Expressions
    * Lambda Expressions
* Data Types
    * Lists
* Functions
* Name Bindings

## Notes
```scheme
;; This is a comment
(+ 1 1)
;; => 2
```

Defining a function using `define`.

```scheme
;;; Define a function `plus`, which returns the sum of `param1` and `param2`.
(define (plus param1 param2) (+ param1 param2))
```

Alternatively:

```scheme
> (define plus (λ (param1 param2) (+ param1 param2)))
> 
```

Using an arbitrary number of parameters, `x` is bound to the first, and `y` is bound to the rest.
```scheme
> (define (func x . y)
        y)
> (func 1 2 3 4)
'(2 3 4)
```


## Symbolic Expression
A Symbolic Expression, or an S-Expression, is one of two things:
1. An atom, or
2. a pair `(a . b)` where both `a` and `b` are S-expressions.

## Lambda Expression
The Lambda Expression is a procedure which returns a procedure.

```scheme
(λ (param) ; The body begins once the parameter parens is closed.
    param) ; Here we just return the parameter.
```

## Name Binding

There are three types of name binding: `let`, `let*` and `letrec`.

```scheme
;;; Let binding syntax
(let ((n1 m1)
     ...
     (nk mk))
     (body))

;;; Let binding example
(let ((a 1)
      (b 2))
    (+ a b))
```

`let` bindings are syntactic sugar for lambda expressions, which provide the name bindings.
The above program is therefore rewritten as:
```scheme
;;; Let syntax transformed to lambda
((λ (n1 .. nk) (body)) m1 .. mk)

;;; Let binding example transformed to lambda
((λ (a b) (+ a b)) 1 2)
```

Note that `letrec` is ***impure***.
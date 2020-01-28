# Scheme - Part 4

## Evaluation Order

Consider the following snippet:
```scheme
(define (infinite-calculation)
    (infinite-calculation))
    
((λ (x) 1) (infinite-calculation))
```
What is the result of evaluating the fourth line?
Well, due to the evaluation order of Scheme, evaluation will loop forever, as the parameter is evaluated eagerly, i.e. before it is passed to the function.

### Rewrite Rules
> The rewrite rules define semantic preserving transformations of expressions

#### Alpha Rule
Formal parameters of a lambda expression can be substituted with other names which are not used as free names in the body.

#### Beta Rule
An application of a function can be substituted by the function body, in which the formal parameters are substituted by the corresponding actual parameters.
For example, consider the following snippet:
```scheme
((λ (x) (+ x 1) 1) ; <=> (+ 1 1)
```

#### Eta Rule
A function `f`, which only passes its parameters on to another function `e`, can be substituted by `e`.
For example, consider the following snippet:

```scheme
(λ (x) (e x)) ; <=> e
              ; where e is an other function
```

#### Normal Form
An expression is in *normal form* if it cannot be reduced further by beta and eta rewrites.
A normal form represents our intuition of the value of an expression.

### Order of Reductions
Using the rewrite rules can be done in several ways, which is why the order of reductions has been standardized.

In order to demonstrate the difference between the two, consider the following snippet:
```scheme
((λ (x y) (+ (* x x) (* y y)))
    (fak 5)
    (fib 10))
```

#### Normal Order
The first reduction to perform is the one at the outer level of the expression, i.e. evaluation by need.

1. Beta rewrite lambda expression
```scheme
(+ (* (fak 5) (fak 5) (* (fib 10) (fib 10))))
```
2. Attempt to evaluate the plus function, notice that inner values need evaluation first.
3. Attempt to evaluate `(* (fak 5) (fak 5))`, again, the two inner values need evaluation first.
4. Evaluate `(fak 5)`, then again, then evaluate the result squared.
5. Etc.

#### Applicative Order
The first reduction to perform is the inner leftmost reduction, i.e. eager evaluation, which sometimes must be controlled explicitly.

1. Attempt to evaluate `(fak 5)`.
2. Attempt to evaluate `(fib 10)`.
3. Evaluate the function object, i.e:
```scheme
> (function-object 120 55)

;;; Resulting in
(+ (* 120 120) (* 55 55))
```
4. Attempt to evaluate `(* 120 120)`.
5. Etc.

## Delayed Evaluation and Streams
Scheme is implemented with applicative-order evaluation.

### Delayed Evaluation
We introduce two new primitives:
- Delay, and
- Force.

The following snippet describes the semantics of these primitives:
```
(delay expr) => promise
(force promise) => value
```

In fact, these are easy to implement in Scheme:
```scheme
(define (delay expr)
    (λ () expr))

(define (force promise)
    (promise))
```
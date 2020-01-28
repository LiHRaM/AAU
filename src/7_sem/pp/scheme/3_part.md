# Scheme - Part 3

## Continuations
> A continuation of an expression `E` in a surrounding context `C` represents the future of the computation, which waits for, and depends on the value of `E`.
A contiuation is materialized as a function which takes a single parameter.

Consider the snippet below, where the expression `(* 4 3)` is inside the context `(+ 5 E)`.
The continuation of `E` is *adding five to...*.
```scheme
(+ 5 (* 4 3))
```

In other words:
```scheme
(λ (E) (+ 5 E))
```

Explicitly capturing the expression `E` in the context `C`:
```scheme
(+ 5 (call/cc (λ (cc) (* 4 3))))
```

Using the context `C` within the expression `E`:
```scheme
> (+ 5 (call/cc (λ (cc) (* 4 (cc 4)))))
9
```

***Note***: In the above snippet, the only part which is actually evaluated is `(cc 4)`, where `cc` is the continuation `(+ 5 E)`, i.e. the expression is evaluated as `(+ 5 4)`.
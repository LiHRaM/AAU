## Fundamentals

### Exceptions

### Pointers

### Const

### Structs

### Unions

### Enums

### Range-For Statements

### Lifetimes and Const References

#### Lvalues
An `lvalue` is an expression with an identity, i.e. which can be referenced by address.
```cpp
*(myArray + 2)
myArray
myArray[1]

// etc...
```

#### Rvalues
An `rvalue` is an expression with no identity, i.e. it cannot be referenced by address.
```cpp
3.15
4
"char"
[] { return 0; }

// etc
```

### Implicit Type Conversion

### New and Delete

### Lists

### Explicit Type Conversions

### Functions
## Introduction
The goal is to learn C++ at an advanced level.

### Literature
- The C++ Programming Language, 4th Edition by Bjarne Stroustrup
- Effective Modern C++ by Scott Meyers
- C++17, The Complete Guide by Nicolai M. Josuttis

### Design of C++

Bjarne Stroustrup says that C++ is designed to provide:
- Constructs which map directly to the hardware, i.e. cheap and efficient low-level operators
- Cheap and elegant abstractions which allows user defined types to be used with the same ease as built-in types

This is ironic, consider e.g. [C Is Not A Low-Level Language](https://queue.acm.org/detail.cfm?id=3212479)

Other considerations:
- There should be no room for a lower-level language beneath C++
- Don't pay for things you don't use

> defining a new general-purpose or application-specific type is the most fundamental programming activity in C++

### The Basics

C++ is a statically typed, compiled language.
It is portable, in the sense that source code is portable, but compiled artifacts are not.

#### Minimal C++ Program
```cpp
int main() { } // the minimal C++ program
```

#### Hello, World!
```cpp
#include <iostream> // include the << operator

int main()
{
    std::cout << "Hello, World!\n";
}
```

Note: The `<<`, or "Put to" operator writes its second operand onto its first.

#### Square
```cpp
#include <iostream>
using namespace std; // use std without std::

double square(double x)
{
    return x*x;
}

void print_square(double x)
{
    cout << "the square of " << x << " is " << square(x) << "\n";
}

int main()
{
    print_square(1.22);
}
```

#### Immutability
There are to types of immutability in C++: `const` and `constexpr`.
The two differ in the sense that `const` is a variable modifier, i.e. it promises that a variable is immutable, whereas `constexpr` is a keyword used to denote expressions which are to be evaluated at compile time.

Examples from Bjarne:

```cpp
const int dmv = 17;                         // dmv is a named constant
int var = 17;                               // var is not a constant
constexpr double max1 = 1.4*square(dmv);    // OK if square(17) is a constant expression
constexpr double max2 = 1.4*square(var);    // error : var is not a constant expression
const double max3 = 1.4*square(var);        // OK, may be evaluated at run time

double sum(const vector<double>&);          // sum will not modify its argument (§2.2.5)
vector<double> v {1.2, 3.4, 4.5};           // v is not a constant
const double s1 = sum(v);                   // OK: evaluated at run time
constexpr double s2 = sum(v);               // error : sum(v) not constant expression
```

### Templates

### Fundamental Types

### Declarations, Objects & Values and Type Aliases

### Pointers, References and Ownership
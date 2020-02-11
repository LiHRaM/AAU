# Verification

## Model Checking: UPPAAL 1
> The reliability of (Information and Communication Technology) ICT systems is a key issue in the system design process.



## Scalability & Model Checking: UPPAAL 2

## TAPAAL and Timed Arc Petri Nets

## Static Analysis

## Bounded Model Checking

### Amazon
> Engineers use TLA+ to prevent serious but subtle bugs from reaching production

The engineers use two languages for verification:
- _TLA+_: The mathematical modelling language which can be used to verify properties of a model.
- _PlusCal_: A programming language which can be transpiled to TLA+.
    Is not as expressive as TLA+, but can be more friendly for beginners.

Typical process:
1. Implement happy path
2. Implement error handling for common errors

TLA+ process:
1. Define system properties
2. Write TLA+/PlusCal code
3. Verify properties

"What needs to go right" vs. "what could go wrong".

This approach also allows engineers to test new optimizations on the model before releasing them into production.
The model becomes a testing ground for "what-if" features.

They complain that they do not know of a formal method for preventing _sustained emergent performance degradation_, where cascading events cause the server to become effectively unavailable.

Key benefits of formal methods:
- _Get the design right_: Formal tools can verify high-level designs.
- _Gain better understanding_: Formal tools help engineers understand the design in a more intuitive fashion.
- _Write better code_: Formal tools teach engineers to write self-diagnosing code.

### Facebook
> integrating a verification tool based on static analysis into the software development cycle

The Facebook engineers brought a formal static analyzer tool, [Infer](https://fbinfer.com/) from Monoidics, which applies separation logics on program artifacts.

For example, it's possible to detect resource leaks, etc via the following command:
```
$ infer -- javac Program.java
```

The focus of the Facebook engineers is to provide fully automatic feedback on certain soundness bugs, such as memory safety and data races.
As opposed to Amazon, this approach does not require engineers to be trained in formal methods, simply that they respond to the feedback of the tool.
The tool works by inferring specification from the code, and ensuring that the program conforms with the inferred specification.

It does not require whole-program analysis, which allows it to be very fast, and to operate on diffs.

## Quantitative Model Checking
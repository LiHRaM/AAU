# Scheme - Miniproject
The Scheme miniproject is based on one of the exercises from the course.
The core concepts of the project are ***student***, ***group*** and ***grouping***.

> Program various ways to make project groups, in the context of PBL group work at AAU.

## Student
The structure of a student object is described in the following table.

| Property    | Description                          |
| ----------- | ------------------------------------ |
| Student-id  | A unique identifier for the student. |
| Name        | The full name of the student.        |
| Sex         | The gender, i.e. "male" or "female". |
| Nationality | E.g. "Danish", "Icelandic".          |

## Group

A group ties students together with a group id. The conceptual structure is described by the following table.

| Property | Description                         |
| -------- | ----------------------------------- |
| Group-id | A unique identifier for the group.  |
| Students | A list of students, or student-ids. |

## Grouping

A grouping is a collection of groups. A high-level abstraction could be described by the following table.

| Property | Description                                                 |
| -------- | ----------------------------------------------------------- |
| Groups   | A collection of groups, each containing a list of students. |

The problem with this structure, however, is that it cannot be sorted by students - only by groups. An alternative solution would be to create an association list, such as the following code snippet.

```scheme
;; Association list. The first element is the group id,
;; the second is the student id.
((1 . a) (1 . e) (2 . b) (1 . c) (2 . d))

;; In other words
((1 (a e c)) (2 (b d)))
```



## The Assignment

There exists a sample population of 200 students. For this population, write the following functions:

* A function that returns a given group from a grouping.
  * A function that returns the number of groups in a grouping
  * A function that returns the maximum group size in a grouping
  * A function that returns the minimum group size in a grouping
* A constructor, predicate, and selection functions for a single student.
* A constructor, and predicate for a single group.
* A selection function which returns the students in a group.
* A selection function that returns the group id.
* A predicate for a grouping.
* Constructors for groupings.
  * **Random grouping**: Given a list of students `sl` and a list of desired group sizes `gsl`, program a grouping function that forms `(length gsl)` groups, of the sizes prescribed in `gsl`. 
    * Assert that `gls` is a list of positive integers, whose sum is equal to `(length sl)`.
    * Should be recursive.
  * **Grouping by counting**: Given a list of students `sl` and a single group size `k`, iteratively assign a single group number to each student in increasing order, resetting at `k`. 
  * **Balanced grouping by counting**: Using the same parameters as the previous function, return a grouping such that there is an equal distribution of sex and ethnicity.
  * **Random grouping with group predicate**: Using the same parameters as the random grouping function plus a predicate and a retry value, try applying the predicate on each randomly generated grouping. If the predicate fails, then reject the group, and form another random group. Each successful application of the predicate results in the group being added to the grouping. The retry value determines how many times random groups are created before the program stops.

## Requirements

- ***Language***: The program must be written in Scheme
- ***Quality***: The functional program must be well-written, well-structured and well-explained.
- ***Modularity***: Large functions, solving large problems, must be decomposed appropriately.
- ***Purity***: Use only pure functions, with the exception of print, file IO and random.
- ***Higher-Order Functions***: Use them!
- ***Abstraction***: `car` and `cdr` should be abstracted away into accessor functions for your datatypes.
- ***Comments***: Use them to document the program.
- ***Plagiarism***: Not allowed.

The program should be unique and written alone.
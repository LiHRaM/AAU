# Tests

Literature: Software Testing - Rob Patton

## Testing Concepts

- **Product Specification**: An agreement among the software development team. It defines the product they are creating, detailing what it will be, how it will act, what it will do, and what it won't do. This agreement can range in form from a simple verbal understanding, an email, or a scribble on a napkin, to a highly detailed, formalized written document.
- **Bug**: A _software bug_ occurs when one or more of the following five rules is true:
    1. The software doesn't do something that the product specification says it should do.
    2. The software does something that the product specification says it shouldn't do.
    3. The software does something that the product specification doesn't mention.
    4. The software doesn't do something that the product speciication doesn't mention but should.
    5. The software is difficult to understand, hard to use, slow, or - in the software tester's eyes - will be viewed by the end user as just plain not right.

- *Unit Testing*: A single unit is tested.
- *Integration Testing*: The interaction of two or more units is tested.
- *System Testing*: The system as a whole, or a large part, is tested.
- *Black Box Testing*: The tester does not know how the code works.
- *White Box Testing*: The tester is aware of the internals of the code.
- *Static Testing*: The test is performed without running code.
- *Dynamic Testing*: The test is performed by running code.
- *Configuration Testing*: The code is tested with hardware configurations.
- *Compatibility Testing*: The code is tested for compatibility with other software.
- *Model-Based Testing*: The activity of modeling a system/environment to derive test cases for the system.

## Black-Box Techniques
### High-Level Specification Review
Specification review is a type of *static black-box* testing.
Techniques include:
- Pretend to be the customer.
- Research existing standards and guidelines.
- Review and test similar software.

### Low-Level Specification Review
- Specification attributes checklist
    - Complete
    - Accurate
    - Precise, Unambiguous, and Clear
    - Consistent
    - Relevant
    - Feasible
    - Code-free
    - Testable
- Specification terminology checklist
    - Always, Every, All, None, Never
    - Certainly, Therefore, Clearly, Obviously, Evidently
    - Some, Sometimes, Often, Usually, Ordinarily, Customarily, Most, Mostly
    - Etc., And So Forth, And So On, Such As
    - Good, Fast, Cheap, Efficient, Small, Stable
    - Handled, Processed, Rejected, Skipped, Eliminated
    - If...Then...(Missing Else)

### Test-to-Pass and Test-to-Fail
_Test-to-pass_ tests have the purpose of making sure that simple, typical cases function correctly.
All testing efforts should begin with _test-to-pass_ tests, as they cover the minimal functionality of the program.
_Test-to-fail_ tests follow up on the previous tests, where the tester tries everything he can think of to break the program, and force errors.

**NB**:
The _spec_ typically covers when the program should show errors.
This kind of testing is a little of both _test-to-fail_ and _test-to-pass_.

### Equivalence Partitioning
_Equivalence partitioning_ is a method for selecting test cases.

> An equivalence class or partition is a set of test cases that tests the same thing or reveals the same bug.

This method reduces the set of test cases by considering the grouping of three things:
- Similar inputs,
- Similar outputs, and
- Similar operation of the software.

### Data Testing
Data testing is where you test the program by inputting data via the available channels, such as text input, buttons, &c.

#### Boundary Analysis
> Boundary conditions are those situations at the edge of the planned operational limits of the software.

- Common Boundary Types:
    - Numeric,
    - Character,
    - Position,
    - Quantity,
    - Speed,
    - Location,
    - Size.
- Common Type Characteristics:
    - First/Last,
    - Start/Finish,
    - Min/Max,
    - Over/Under,
    - Empty/Full,
    - Slowest/Fastest,
    - Largest/Smallest,
    - Next-To/Farthest-From,
    - Shortest/Longest,
    - Soonest/Latest,
    - Highest/Lowest.


#### Sub-Boundary Conditions
Sub-Boundary conditions are less obvious boundary conditions.
Boundary conditions are stated in the _spec_, e.g. by saying how many characters a text box allows.
Sub-boundary conditions are more specific to the implementation of the software, and two popular ones are Powers-of-Two and the ASCII table.

#### Testing the Boundary
1. Create two equivalence partitions.
2. Select values on the inner edge of the boundary for the first, and
3. Select values on the outer edge of the boundary for the second.

#### Default, Empty, Blank, Null, Zero, and None
Always check that programs can handle these values.

#### Invalid, Wrong, Incorrect and Garbage Data
Always check that programs can handle these values as well.

### State Testing
> Testing the states and their transitions.

There are five approaches:
1. Visit each state at least once
2. Test hot paths
3. Test least common paths
4. Test all error states and recovering from errors
5. Test random states.

When testing a state, you'll want to consider:

1. The state itself,
    - Variables,
    - Conditions, and
    - Functionality.
2. Race Conditions, Bad Timing, and
3. Repetition, Stress, and Load.
    - _Repetition testing_ reveals memory leaks by repeatedly performing a task
    - _Stress testing_ is running the system with limited resources, reveals external dependencies and hardware requirements
    - _Load testing_ is feeding the system as large inputs as possible.

### &c.
- Behave like an idiot
- Look for bugs where you've already found them
- Think like a hacker
- Follow experience, intuition, and hunches

## White-Box Techniques
### Design and Code
### Formal Reviews
All formal reviews should contain the following four elements:
1. Look for problems during the review and preparation
2. Set clear rules for the review and follow them
3. Prepare for the review by looking through the code
4. Write a report afterwards, detailing the results of the review

#### Peer Reviews
The programmer and one or more reviewers look through the code together.

#### Walkthroughs
The programmer walks through the code with five or so reviewers.

#### Inspections
Composed of a presenter, and inspectors.
Requires formal training for each participant.
The presenter is not the programmer who wrote the code.

### Coding Standards and Guidelines
Following Standards and Guidelines has the following benefits:
1. **Reliability**
2. **Readability/Maintainability**
3. **Portability**

### Generic Code Review Checklist
- Data Reference Errors
- Data Declaration Errors
- Computation Errors
- Comparison Errors

### Unit and Integration Testing
_Unit tests_ are written for each module created.
They test the smallest _unit_ of code, hence the name.
_Unit testing_ is also called _module testing_.

_Integration tests_ test groups of modules, and their interactions.
There are two approaches to this:
1. **Bottom-up integration testing**: Test drivers simulate higher modules by calling the code in bottom modules.
2. **Top-down integration testing**: Bottom modules are replaced by _stubs_.

In both cases, the replacements implement the interface of the module they replace.

**NB**: _System testing_ is where you test the whole system, or large parts of it.

### Code Coverage
Metrics for deciding how well your code is covered by tests.
- **Line Coverage**: Each line is covered.
- **Branch Coverage**: Each branch is covered.
- **Condition Coverage**: Each condition of a branch is covered.

## Planning, Writing and Tracking Test Cases
> Ch. 8, 9, 17, 18, 19

### Configuration Testing
> Making sure your software works with as many different hardware combinations as possible.

1. Use equivalence partitioning to select the hardware to obtain
2. Identify a subset of the tests which are relevant to each piece of hardware
3. Determine if the error is a software or a hardware error, _nb_: you'll probably have to fix it either way
4. $$$

### Compatibility Testing
> Making sure your software interacts correctly with other software.

This includes software such as an operating system, device driver, and similar software, such as LibreOffice being compatible with MS Office.

This is especially important for software which produces output of a format defined in an official specification, such as `.pdf`, or a written document type, such as `.docx`.

### Test Planning
> The test plan is a by-product of the detailed planning process that's undertaken to create it.
> It's the planning process that matters, not the resulting document.

***Test Planning Topics***:
- High-Level Expectations
- People, Places and Things
- Definitions
- Inter-Group Responsibilities
- What to Test
- Test Phases
- Test Strategy
- Resource Requirements
- Tester Assignments
- Test Schedule
- Test Cases
- Bug Reporting
- Metrics and Statistics
- Risks and Issues

The main purpose of testing is to bring everyone on the product team together.

### Test Writing and Tracking
There are four reasons for carefully planning your test cases:
1. Organization
2. Repeatability
3. Tracking
4. Proof of testing

#### Planning Overview
The test plan results in three types of artifacts:

1. Test Design: A high level description of testable items and which testers are responsible for them.
2. Test Case: Actual values for input along with expected output.
3. Test Procedure: The steps required to operate the system and exercise the specified test cases.

#### Organization and Tracking

Store the test cases in the following places:
1. In your head: Nope
2. Paper/documents: Very old school
3. Spreadsheet: If you're over 40
4. Database: Yes baby!

### Test Reporting
Many bugs don't get fixed, e.g. for the following reasons:
1. There's not enough time
2. It's really not a bug
3. It's too risky to fix
4. It's just not worth it
5. Ineffective bug reporting

#### Effective Bug Reporting
- Report Bugs ASAP: the earlier you discover it, the more time there is in the schedule to fix it.
- Effectively Describe the Bugs
    - Minimal
    - Singular
    - Obvious and general
    - Reproducible
- Be nonjudgmental in bug reports
- Follow up on bug reports

#### Isolating and Reproducing Bugs
Do your best to list the exact recipe for reproducing the bug, and try to make it as simple as possible to follow.
If the bug is hard to reproduce, it might be due to all sorts of conditions in the context, such as the previous states, the available resources,
timing problems, or memory leaks, etc.
Try to exhaust each category of potential problems as you try to isolate the bug.
But in the end, the most important thing is that you report the results, so that the programmer may try to debug the program.

## Model-Based Testing
> _Model-based testing_ is a variant of testing that relies on explicit behaviour models that encode the intended behaviours of an SUT and/or the behaviour of its environment. Test cases are generated from one of these models or their combination, and then executed on the SUT.

Generic MBT Process:
1. A _test model_ of the SUT is constructed from the _informal requirements_ or the _spec_. 
    This model should be seperate from a development model, if one is created, so as to not propagate errors from the development model into the tests.
    This model should also be simpler than the SUT, as it would otherwise take just as long to validate the model as the SUT.
2. Test selection criteria are chosen to guide the test generation process.
3. Test selection criteria are then transformed into _test case specifications_.
4. A set of test cases are generated from the model and the test case specifications, with the aim of satisfying all the test case specifications. If this set is empty, the _test case spec_ is said to be unsatisfiable.
5. The generated test cases are run once the test suite has been generated.


## Mutation Testing

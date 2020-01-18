# Topic 4: Distributed Mutual Exclusion

* What is DME and what are the requirements to a DME algorithm?
* What are the criteria to evaluate DME algorithms?
* Explain the centralized, token ring, and Ricart and Agrawala’s algorithms, and compare them. What are their advantages/disadvantages?

Material: DS book: 5ed Sections 15.1 and 15.2, slides on distributed mutual exclusion (lecture 7)

## DME & Requirements
DME is where distributed process wish to exclusively access a shared resource.

### Requirements
- **Safety**: one at a time
- **Liveness**: requests always succeed
- **Ordering**: requests are handled in the same order they are received

## Criteria for Evaluation
- **Fault tolerance**
- **Performance**
    - *Bandwidth*: Number of messages required for entry and exit.
    - *Client delay*: The delay caused by each entry and exit.
    - *Throughput*: Synchronization delay, delay between one process exiting and the next entering.

## Central Server Algorithm
Simplest method. A central server queues requests and grants an access token to the oldest request. 

It delays other requests, and delivers tokens if 
1. there are no requests in queue when a request is received, or
2. when it receives a release token from the process with current access.

## Token Ring Algorithm
Simplest method without an additional process.
Arrange N processes into a logical ring.
Each process has a communication channel to the next process in the ring.
Exclusion is obtained from the previous process, and sent to the next process once done.

## Multicast and Logical Clock Algorithm
Processes that require entry multicast a request message, and can enter it only when all the other processes have replied to the message.
Each process has a unique identifier and a Lamport clock, which satisfies LC1 and LC2 from DS 14.4. (Note, a Lamport clock is a logical clock, which increments the timestamp every time a message is sent. It sends the timestamp along with the event. When it receives events, it sets the logical clock to be the max of it's internal clock vs the one received.)
When a process is in the RELEASED state, it responds immediately to other processes requesting access.
When a process is in the HELD state, it does not respond until it is done.
When two or more processes request access at the same time, they are sorted first by the message timestamp, and then by their identifier.
A process defers responding to other processes once it has sent its request and recorded the timestamp.

## Property Comparison
| Algorithm | Central Server | Token Ring | R&A |
|:-:|:-:|:-:|:-:|
| ME1: Safety | <br>Yes | Yes | Yes |
| ME2: Liveness | Yes | Yes | Yes |
| ME3: Ordering | No | No, ordering is based on ring topology | Yes |
| Bandwidth | Enter: 2<br/>Exit: 1 | Enter: 0..N<br/>Exit: 1 | Enter: 2(N-1) without multicast<br/>Exit: 0 |
| Client delay | Enter: Length of queue<br/>Exit: None. | 0..N | Entry: Round-trip |
| Synch Delay | Round-trip | 1..N | 1, but with N points of failure |
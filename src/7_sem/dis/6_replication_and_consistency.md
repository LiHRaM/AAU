# Topic 6: Replication and Consistency

* Why do you need replication?
* Explain the challenges resulting from replication
* What consistency models exist?
* Explain the consistency model and compare them
* Present an execution which is sequentially consistent but not linearizable

Material: slides on the above topics,  and DS book: Chapter on Replication. 

* [DS 4ed] Sections 15.1-15.3 (replication)
* [DS 4ed] Section 15.4.1 (the gossip architecture)
* [DS 4ed] Section 14.1-14.3 (Distributed Transactions)

* [DS 5ed] Sections 18.1-18.3 (replication)
* [DS 5ed] Section 18.4.1 (the gossip architecture)
* [DS 5ed] Section 17.1-17.3 (Distributed Transactions)


## Why is replication needed
* ** Replication is a way to ensure that a system can tolerate node failures, meaning that to the user, it appears as if the system is a single node, so that if there is a failure, the end-user is not impacted.
* ** Thus:
  * Fault-tolerance
  * High Availability, continue to deliver a service, despite failures
    * Possibly inaccurate/ weakly consistent service
  * Performance
    * Single node cannot cope with millions of requests per second, replication used to distribute load.
    * Done with a load-balancer, which distributes clients to the different available servers
      * Can be done as round-robin, based on current load.
    * Caching client-side is also replication, but introduces the problem of ensuring consistency for the client

## The challenges resulting from replication

### CAP Theorem:
* ** Consistency
* ** Availabilty
* ** Partition Tolerance.
* It is impossible for a distributed computer system to simultaneously provide Consistency, Availability and Partition Tolerance.
  * ** A distributed system can satisfy any two at the same time, but not all three.

* ** Means a choice must be made if and when there is a partition
  * Either become less available, or allow the data seen by multiple clients to be inconsistent
  * This depends on the exact application
    * Web stores are likely to prefer Availability, while Safety critical systems prefer Consistency.
## What consistency models exist
* ** Strong Consistency:
  * After an update of Process A completes, any subsequent access (by any process) will return the updated value
* ** Weak consistency:
  * System does not guarantee that subsequent access will return the updated value.

* ** Consistency from the clients view:
  * ** Meaning, if I, as the client, write something I want to see that result to show on subsequent reads.
  * ** If I make two read operations, the second read should be the same or newer as the first read.
## Compare and explain consistency models
* ** There are many different consistency models.

Linearizability is more strict,
* Depends on time at the client

* Problems
* If a client is slow, it can throw messages later than other clients, but with an earlier timestamp
    * ** No synchronized clock among clients
    * ** Clients can fake their time

### Passive-(primary backup) model
* ** Works by:
    1. Request: Front end sends request
    2. Coordination: The primary takes the request atomically
    3. Execution: The primary executes
    4. Agreement: The primary sends the result to all the backups and receives an ACK
    5. Repsonse: Reply to the front end.

* ** Easy to implement
* ** Replicas need to be deterministic "state-machines"
* ** Survives n-1 crashes (but) not byzantine failures
* ** Is linearizable

### Active replication
* ** Different from passive, as it replicates the data directly to all replicas, straight from the front--end.
* ** Doesnt require agreement
1. Request: The front-end RTO multicasts to all replicas
2. Coordination: all Replica managers take the request in FIFO order
3. Execution: Every Replica managers executes the requested operation
4. Agreement: No agreement needed
5. Response: Each replies to front end

Is more expensive (RTO-multicast)
    * ** RTO multicast is only guaranteed for synchronous system
* Can cope with (n/2-1) byzantine failures, frontend waits for n/2+1 responses, which is the majority.


## An execution which is sequentially consistent, but not linearizable

* ** A service is linerabily if:
  * ** The interleaved sequence of operations meets the specification of a (single) correct copy of the objects
  * ** The order of operations in the interleaving is the same as the real times at which the operations occurred in the actual execution.

* ** A service is sequentially consistent if:
  * ** The interleaved sequence of operations meets the specification of a (single) correct copy of the objects
  * ** The order of operations in the interleaveing is consistent with the program order in which each individual client executed them.

* **The example given in the slides of a service that is sequentially consistent but not linearizable:
  
| Client1               | Client 2          |
| -------------         |   :-------------: |
| SetBalanced(x,1)      |                   |
|                       | GetBalance(y) = 0 |
|                       | GetBalance(x) = 0 |
| SetBalanced(y,2)      |                   |

* ** As the Real-time order is violated as (getBalance(x)=0) must have been executed before setBalance(x,1).
* ** Satisfies sequential consistency, an interleaving exists that could have given that result:
  * getBalance(y)=0;getBalance(x)=0;setBalance(x,1); setBalance(y,2)

# R_RTOS #

R_RTOS is a scalable distributed real-time operating system for ARM Cortex M processor architectures that is optimized for size, performance and interoperability.

Documentation can be found at: 
http://neverknewthename.github.io/R_RTOS/

Otherwise a doxyfile to build the documentation is included in the documentation folder.


## Features ##
* Lightweight Design
  * Re-usable data structures
  * Modified Best Buddy memory allocator
  * Memory Pools
* Open Design 
  * Flexible task control block
  * Grouped mailboxes and unified synchronization objects
* Distributed Design
  * Message based design
* Preemptive Priority Based Multidimensional Scheduler
  * Deterministic behavior regardless of the number of task at inserting or deleting task
  * Task array and priority container array comprise the active task list
* Advanced Synchronization
  * Mutexes
  * Binary and Counting Semaphores
  * Monitors
  * Event Groups
  * Lightweight Critical Sections
* Messaging 
  * Inter-task communication
  * Pub/Sub Message Queuing
  * System Messages

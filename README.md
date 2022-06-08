# Dlang. Stack & Queue

Simple and light library realize data structure **stack** and **queue**.
Based on single-linked list. Not from `std.container`.

----

directory `source` have:

1. `node.d` - element of single-linked list without function.
2. `queue.d`
3. `satck.d`

----

## Node

Its private module. Used in queue and stack.

**Not for using in your project**

----

## Queue

`Queue!T` T is your type

Constructor:

+ Default
+ For many values. Parameter: slice `T[]`

Public member functions:

+ `first` getter. Return payload from 1st element. O(1)
+ `last` getter. Return payload from last element. O(1)
+ `empty` bool. Return true if queue is empty. O(1)
+ `size` size_t. O(n)
+ `opIndex` `[]`. Return slice with all payloads. O(n)
+ `push` void. Parameter `T value`. Add element to end. O(1)
+ `pop` T. Return payload from 1st element and delete him. O(1)


----

## Stack

`Stack!T` T is your type

Constructor:

+ Default
+ For many values. Parameter: slice `T[]`

Public member functions:

+ `top` getter. Return payload from top. O(1)
+ `empty` bool. Return true if stack is empty. O(1)
+ `size` size_t. O(n)
+ `push` void. Parameter `T value`. Add element to top. O(1)
+ `pop` T. Return payload from top element and delete him. O(1)
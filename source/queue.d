module queue;

import node;

/++
Struct `Queue` FIFO

Adapter single-linked list.
Dont used `std.container.slist`
+/
struct Queue (T)
{
    private Node!T* _first;
    private Node!T* _last;

    /++
    Getter value first element
    
    Returns: type of struct
    Date: June 07, 2022
    +/
    T first () pure nothrow @safe
    {
        return _first.payload;
    }

    /++
    Getter value last element
    
    Returns: type of struct
    Date: June 07, 2022
    +/
    T last () pure nothrow @safe
    {
        return _last.payload;
    }

    /++
    Property

    Returns: true if queue is empty
    Date: June 07, 2022
    +/
    bool empty () pure nothrow @safe
    {
        return _first == null ? 1 : 0;
    }

    /++
    Property
    
    Returns: size of queue
    Date: June 08, 2022
    +/
    size_t size () pure nothrow @safe
    {
        size_t count;
        Node!T* node = _first;
        
        while (node != null)
        {
            node = node.node;
            ++count;
        }

        return count;
    }


    import std.traits : isImplicitlyConvertible;
    /++
    Constructer
    Parametrs: slice
        
    Date: June 08, 2022
    +/
    this (U) (U[] values...)
    if (isImplicitlyConvertible!(U, T))
    {
        foreach (value; values)
        {
            push(value);
        }
    }

    /++
    opSlice `queue[]`
    
    Returns: slice values from elements
    Date: June 08, 2022
    +/
    T[] opIndex()
    {
        T[] slice;
        slice.reserve(this.size);
        Node!T* node = _first;
        while (node != null)
        {
            slice ~= node.payload;
            node = node.node;
        }
        return slice;
    }


    /++
    Add element to queue
    Parametrs:
        `T value` type of struct
    Returns: void
    Date: June 07, 2022
    +/
    void push (T value) pure nothrow @safe
    {
        Node!T* node = new Node!T(value);
        if (_last != null) _last.node = node;
        else _first = node;
        _last = node;
    }
    ///Ditto
    auto opOpAssign(string op : "~")(T value)
    {
        push(value);
        return this;
    }


    /++
    Remove elemet from queue
    
    Returns: type struct. Value of first element
    Date: June 07, 2022
    +/
    T pop () pure nothrow @safe
    {
        scope(exit) 
        {
            if (_first == _last) _last = null;
            _first = _first.node;
        }
        return _first.payload; 
    }


    unittest
    {
        Queue!string queue;
        queue.push("one");
        assert(queue.first == "one");
        assert(queue.size  == 1);
        assert(queue[] == ["one"]);
        
        queue.push("two");
        assert(queue.size  == 2);
        assert(queue.first == "one");
        assert(queue.last  == "two");
        assert(queue[] == ["one", "two"]);

        auto element = queue.pop();
        assert(queue.size == 1);
        assert(element == "one");
        assert(queue.first == "two");
        assert(queue.last  == "two");
        assert(queue[] == ["two"]);
        
        element = queue.pop();
        assert(queue.size == 0);
        assert(element == "two");
        assert(queue.empty);
        assert(queue[] == []);

        queue ~= "tree";
        queue ~= "four";
        assert(queue[] == ["tree", "four"]);
        assert(queue.size == 2);
    }
}
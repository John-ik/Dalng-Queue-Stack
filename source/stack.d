module stack;

import node;

/++
Struct `Stack` LIFO

Adapter single-linked list.
Dont used `std.container.slist`

Date: June 6, 2022
+/
struct Stack (T)
{
    private Node!T* _top;


    /++
    Getter top

    Returns: top element of stack

    Date: June 6, 2022
    +/
    T top () pure nothrow @safe
    in (this._top != null, "Stack is empty")
    {
        return this._top.payload;
    }


    import std.traits : isImplicitlyConvertible;
    ///Constructror for a lot of values
    this (U) (U[] values...) pure nothrow @safe
    if (isImplicitlyConvertible!(U, T))
    {
        foreach (value; values)
        {
            push(value);
        }
    }

    /++
    isEmpty

    Returns: true if stack is empty

    Date: June 6, 2022
    +/
    bool empty () pure nothrow @safe
    {
        return _top == null ? true : false;
    }


    /++
    size property

    Returns: size of stack

    Date: june 6, 2022
    +/
    size_t size () pure nothrow @safe
    {
        size_t count;
        auto element = _top;
        while (element != null)
        {
            ++count;
            element = element.node;
        }
        return count;
    }

    /++
    Push element to top of stack

    Parametrs:
        T value

    Date: June 6, 2022
    +/
    void push (T value) pure @safe nothrow
    {
        Node!T* node = new Node!T(value, _top);
        _top = node;
    }

    //TODO: opBinary ("~") as push



    /++ 
    Pull element from top of stack

    Returns: Payload from top

    Date: June 6, 2022
    +/
    T pop () pure @safe nothrow
    {
        scope(exit) _top = _top.node;
        return this.top;
    }



    
    unittest
    {
        Stack!string stack;

        // stack.pop();

        stack.push("one");
        assert(stack._top.payload == "one");
        assert(stack._top.payload == stack.top);
        assert(!stack.empty);
        assert(stack.size == 1);
        auto buf = stack.pop();
        assert(buf == "one");
        assert(stack.empty);
        assert(stack.size == 0);
    }

    unittest
    {
        import std.array : array;
        import std.range : iota;

        int[] arr = array(iota(0, 1000));
        auto stack = Stack!int(arr);
        assert(stack.top == arr[$-1]);
    }
}
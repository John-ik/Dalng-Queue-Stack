module example;

void main ()
{
    import std.stdio : writeln;
    import stack;

    writeln("--------------------------------\nStack");
    auto stck = Stack!string(["one", "two", "three"]);
    writeln("top: ", stck.top);
    writeln("size: ", stck.size);

    stck.pop();
    stck.push("four");
    writeln("Change");

    writeln("top: ", stck.top);
    writeln("empty: ", stck.empty);

    while (!stck.empty)
    {
        writeln("Remove it: ", stck.pop());
    }


    import queue;

    writeln("--------------------------------\nQueue");

    auto q = Queue!string(["one", "two", "three"]);
    writeln("slice: ", q[]);
    writeln("first: ", q.first);
    writeln("last: ", q.last);
    writeln("size: ", q.size);

    q.pop();
    q.push("four");
    writeln("Change");

    writeln("slice: ", q[]);
    writeln("first: ", q.first);
    writeln("last: ", q.last);
    writeln("size: ", q.size);

    while (!q.empty)
    {
        writeln("Remove it: ", q.pop());
    }
}
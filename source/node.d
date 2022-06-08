module node;

/++
Struct `Node`

This is elementary part of single-list

Date: June 6, 2022
+/
struct Node(T)
{
    T payload;
    Node* node;
}
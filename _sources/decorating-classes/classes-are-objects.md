# Classes can be decorated

Classes can be decorated in the same way as functions.
The underlying pattern for decorating is the assignment to the same name after going through a decorator:

```py
fn = decorator(fn)
```

Classes are also objects, so they can be passed around in a similar fashion:

```py
Cls = decorator(Cls)
```

As it turns out, the at sign `@` syntax for decorators is also support by class definitions, so classes can be decorated when defined:

```py
@decorator
class Cls:
    ...
```

This is equivalent to

```py
class Cls:
    ...

Cls = decorator(Cls)
```

Now you know that it is _possible_ to decorate a class...
But should you do it?
There are good use-cases for decorators for classes, but there is one thing that you must understand about decorated classes first.

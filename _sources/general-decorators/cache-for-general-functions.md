# Cache for general functions

Another way of looking at `*args` is to say that it represents a general function signature, in the sense that it represents all functions that accept positional arguments.
For the function `fibonacci`, `*args` boils down to a single value; and for the function `combinations_len`, `*args` will represent the two arguments required.

So, to fix the decorator `cached_factory`, the inner function `cached_f` must accept a variable number of arguments with `*args`:

```py
def cached_factory(f):
    cache = {}
    def cached_f(*args):
        ...  # The rest of the code goes here...
```

Now, `args` is a tuple, so you can use it as the key to your dictionary `cache`:

```py
def cached_factory(f):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            cache[args] = f(...)  # ?!
        return cache[args]

    return cached_f
```

But how do you take the tuple `args` and pass it to the original function `f`?
The function `f` may accept one argument, or two, or twenty, but right now we have all of its arguments in a tuple called `args`...
However, the syntax that Python uses to collect a variable number of arguments into a tuple, `*args`, can also be used to unpack a tuple of arguments into the distinct arguments of a function.

Putting everything together, the improved version of the decorator `cached_factory` looks like this:

```py
def cached_factory(f):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            cache[args] = f(*args)  # ?!
        return cache[args]

    return cached_f
```

This decorator can be used in functions that take no arguments, a single argument, two arguments, and more!

```py
from itertools import combinations

@cached_factory
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

@cached_factory
def combinations_len(n, r):
    return len(list(combinations(range(n), r)))

print(fibonacci(40))  # 102334155
print(combinations_len(30, 6))  # 593775
```

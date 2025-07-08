# Factory of caches

Instead of writing a cached function for each function you want to cache, you can take the code from the functions `cached_factorial` and `cached_fibonacci`, which are essentially the same, and you can use it to write a factory of cached functions.

Your factory of cached functions will accept a function as input (the function you want to add a cache to) and it returns the new cached function _without modifying the original function_:

```py
def cached_factory(f):
    # Build the cache:
    cache = {}
    # Build the cached function:
    def cached_f(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]

    # Return the new function from the factory:
    return cached_f
```

With this new factory of cached functions you can create the functions `cached_factorial` and `cached_fibonacci` much more easily.
First, make sure you have access to the core functions:

```py
from math import factorial

def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

Then, make sure the factory of cached functions is defined:

```py
def cached_factory(f):
    cache = {}
    def cached_f(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]

    return cached_f
```

Finally, call the factory of cached functions on the functions `factorial` and `fibonacci`:

```py
cached_factorial = cached_factory(factorial)
cached_fibonacci = cached_factory(fibonacci)
```

Now, you can check that the values are being cached by checking how much faster it is to call the function a second time, when the cache kicks in:

```py
# ...

import time

t0 = time.perf_counter()
cached_factorial(1_000_000)
t1 = time.perf_counter()
cached_factorial(1_000_000)
t2 = time.perf_counter()

print(f"1st run took {t1 - t0:.3f}s and 2nd took {t2 - t1:.3f}s.")
# 1st run took 7.828s and 2nd took 0.000s.
```

This shows the function `cached_factorial` is definitely being cached.
A similar snippet of code shows that `cached_fibonacci` is also caching its values:

```py
t0 = time.perf_counter()
cached_fibonacci(40)
t1 = time.perf_counter()
cached_fibonacci(40)
t2 = time.perf_counter()

print(f"1st run took {t1 - t0:.3f}s and 2nd took {t2 - t1:.3f}s.")
# 1st run took 9.989s and 2nd took 0.000s.
```

```{note}
The times shown were computed on my machine.
Your computer may be much faster or much slower.
If it looks like the code is running “forever”, interrupt the execution and try it with smaller arguments.
```

Now, there's a fun thing here at play.
Look at the code for the function `cached_factory`.
The outer function `cached_factory` accepts an argument `f` and then defines a dictionary `cache`.
The inner function `cached_f` accesses both `f` and the dictionary `cache`...
But when the outer function `cached_factory` returns the inner function `cached_f`, don't the variables `f` and `cache` go away, since they're local variables to the function?

How is it that the inner function that is returned still works if it's accessing variables that no longer exist..?

The inner function works thanks to a language feature called a [closure](https://mathspp.com/blog/pydonts/functions-a-complete-reference#closures), and that's what you'll learn next.

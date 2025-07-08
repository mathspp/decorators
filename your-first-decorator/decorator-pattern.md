# Decorator pattern

If you went through the previous section carefully and solved the exercises, you already wrote three decorators...
But how?!

To understand you already wrote three decorators, you must understand what a decorator is.
And to understand what a decorator is, you must understand what is the “decorator pattern”.

In the decorator pattern, you implement a factory that accepts a function as input and wraps that function with some extra functionality, like caching or profiling.
Then, the factory returns that wrapper function and that's what you use, instead of the original function.
Throughout this process, the original function is never modified directly.

You call it a “decorator” because you are “decorating” the original function with other useful functionality.
In case it helps you, remember that the word “decorate” means “make (something) look more attractive by adding extra items or images to it”, and that is what your Python decorators do.
They “make a function more useful by adding extra behaviour to it”.

Now, decorators are so useful and common enough that Python has a special syntax for you to use them.
To see that syntax, recall the `cached_factory` decorator:

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

When you are defining a function that you want to add a cache to, you can use the at sign `@` to _decorate_ that function with the caching functionality.
For example, if you were to define the function `fibonacci` again, you could add a cache to it by putting `@cached_factory` on top of the function definition:

```py
# Apply the decorator `cached_factory` to the function `fibonacci`:
@cached_factory
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

Now, if you use it, you'll see the function has a cache baked into it:

```py
print(fibonacci(40))  # The first call is “slow”.
print(fibonacci(40))  # The second call is instantaneous.
```

When using this syntax, the cached function is assigned to the same name as the original function.
So, the syntax with the at sign `@` does not magically create another function with another name.
Instead, it saves the decorated function to the same name.

Before, you created a distinction between the cached function and the original function, because you did something like

```py
cached_fibonacci = cached_factory(fibonacci)
```

But when you were using your function `cached_factory` manually, you could've reassigned the result to the same variable name:

```py
fibonacci = cached_factory(fibonacci)
# ^^^^^^^                  ^^^^^^^^^
```

This way, it's as if you're replacing the uncached function with the cached function.
That's what the at sign `@` does automatically.

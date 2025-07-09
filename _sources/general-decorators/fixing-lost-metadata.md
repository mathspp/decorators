# Fixing lost metadata

As it turns out, function metadata like its name and its docstring can be accessed through certain attributes:

```py
def my_function():
    """This is the docstring of a function."""
    ...

print(my_function.__name__)  # my_function
print(my_function.__doc__)  # This is the docstring of a function.
```

Therefore, to make it so that a decorator produces a wrapper that _looks_ like the original function, all you have to do is patch up these attributes `__name__`, `__doc__`, and others, and the wrapper function will _look_ like the original function!

You could do this by hand in all of your decorators before returning the wrapper:

```py
import time

def timed_factory(f):
    def timed_f(*args, **kwargs):
        start_time = time.perf_counter()
        result = f(*args, **kwargs)
        end_time = time.perf_counter()
        return result, end_time - start_time

    # Patch some metadata:
    timed_f.__name__ = f.__name__
    timed_f.__doc__ = f.__doc__
    return timed_f
```

And this is a start, indeed.
Try applying this version of the decorator `timed_factory` to the function `fibonacci` as shown below:

```py
@timed_factory
def fibonacci(n):
    """Computes the recurrence relation F(n) = F(n - 1) + F(n - 2)."""
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

Now, running `help(fibonacci)` shows a _better_ help screen than before, although it isn't perfect yet:

```
Help on function fibonacci in module __main__:

fibonacci(*args, **kwargs)
    Computes the recurrence relation F(n) = F(n - 1) + F(n - 2).
 Help on timed_factory.<locals>.timed_f line 1/4 (END) (press h for help or q to quit)
```

Note how the signature of `fibonacci` is shown to be `(*args, **kwargs)` and how the final line still says you are getting help regarding the function `timed_factory.<locals>.timed_f`.

The best way to patch all of the metadata is by using _another decorator_ called `functools.wraps`!
This decorator from the standard library must be used _inside_ your decorator, around the wrapper function, and it accepts the original function as an argument, like so:

```py
import functools
import time

def timed_factory(f):
    @functools.wraps(f)  # <--
    def timed_f(*args, **kwargs):
        start_time = time.perf_counter()
        result = f(*args, **kwargs)
        end_time = time.perf_counter()
        return result, end_time - start_time

    return timed_f
```

The line `@functools.wraps(f)` says “the function `timed_f` will replace the function `f`, so transfer `f`'s metadata to `timed_f`”.
And this was the last ingredient you needed!
Now, you have all the tools you might require to write any decorators you might need.

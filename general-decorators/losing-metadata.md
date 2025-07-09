# Losing metadata

Python is a dynamic language that has some pretty neat introspective powers.
For example, if you define a function with a docstring, that docstring is shown if you use the built-in `help` on your function:

```py
def fibonacci(n):
    """Computes the recurrence relation F(n) = F(n - 1) + F(n - 2)."""
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

If you paste this code in the REPL and then type `help(fibonacci)`, you should see something like the following:

```
Help on function fibonacci in module __main__:

fibonacci(n)
    Computes the recurrence relation F(n) = F(n - 1) + F(n - 2).
 Help on fibonacci line 1/4 (END) (press h for help or q to quit)
```

(Press `q` to close that help page.)

Note how the help message shows you the name of the function, the signature, and the docstring!

Now, [go back and fetch the decorator `timed_factory`](./general-signatures.md) to apply it to your function `fibonacci`:

```py
import time

def timed_factory(f):
    def timed_f(*args, **kwargs):
        start_time = time.perf_counter()
        result = f(*args, **kwargs)
        end_time = time.perf_counter()
        return result, end_time - start_time

    return timed_f


@timed_factory
def fibonacci(n):
    """Computes the recurrence relation F(n) = F(n - 1) + F(n - 2)."""
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

If you paste this code in the REPL and then type `help(fibonacci)`, you will notice that you no longer get a nice help screen:

```
Help on function timed_f in module __main__:

timed_f(*args, **kwargs)
 Help on timed_factory.<locals>.timed_f line 1/3 (END) (press h for help or q to quit)
```

The problem is that the original function `fibonacci` was replaced by the wrapper `timed_f` from the decorator `timed_factory`, so `help` is now displaying help information about that...
Which is technically correct, but not very helpful!
Thankfully, there is a simple way of fixing this.

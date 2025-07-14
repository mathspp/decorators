# Exercises

Believe it or not, you already wrote a decorator.
Maybe you didn't notice it, but you have...
And in the next section, I'll show you what I mean.

For now, I have a couple of exercises for you to solve.
These exercises were designed to test your understanding of the concepts you've seen so far, and being able to complete these exercises is a key pre-requisite for being able to progress into the next section.


## A factory of cached functions

You've been working with the functions `factorial` and `fibonacci`, and their cached versions, for a minute now...
But could you rewrite the function `cached_factory` if required?

Make sure you open a new file or notebook and then tackle this exercise.

Write a function `cached_factory` that accepts an argument function like `factorial` or `fibonacci`.
Then, `cached_factory` should return another function that uses a dictionary to cache the arguments passed to the function and the results produced.
Once the function `cached_factory` is implemented properly, the code below should work:

```py
from math import factorial

def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

def cached_factory(f):
    ...  # Your code goes here...


cached_factorial = cached_factory(factorial)
_ = cached_factorial(999_999)  # First one should be “slow”.
_ = cached_factorial(999_999)  # Second one should be instantaneous.

cached_fibonacci = cached_factory(fibonacci)
_ = cached_fibonacci(40)  # First one should be “slow”.
_ = cached_fibonacci(40)  # Second one should be instantaneous.
```

```{note}
Timings depend a lot on your computer.
The arguments used above might be too large, so it feels like the first execution goes on forever...
Or the arguments used above might be too small, so all four calls to `print` run almost instantaneously.
```

## A factory of timed functions

You've [built a factory of cached functions](./factory-of-caches.md) before.
Then, to check that your cached functions were working, you timed them.
To time the functions `cached_factorial` and `cached_fibonacci` you probably wrote similar code, so your first exercise is to write a factory of timed functions.

Write a function `timed_factory` that accepts a function like `cached_factorial` or `cached_fibonacci`.
Then, `timed_factory` should return another function that still accepts a number as input but then returns two results:

 1. the result of the original function; and
 2. the time the function took to execute.

Once the function `timed_factory` is implemented properly, the code below should work:

```py
# This requires the functions `cached_factorial`
# and `cached_fibonacci` from before.

import time

def timed_factory(f):
    ...  # Your code goes here...

timed_factorial = timed_factory(cached_factorial)
timed_fibonacci = timed_factory(cached_fibonacci)

_, t1 = timed_factorial(999_999)
_, t2 = timed_factorial(999_999)
print(f"1st took {t1:.3f}s and 2nd took {t2:.3f}s.")
# 1st took 7.826s and 2nd took 0.000s.

_, t1 = timed_fibonacci(41)
_, t2 = timed_fibonacci(41)
print(f"1st took {t1:.3f}s and 2nd took {t2:.3f}s.")
# 1st took 16.133s and 2nd took 0.000s.
```

<!--
```py
import time

def timed_factory(f):
    def timed_function(n):
        # Measure time right before running f.
        start_time = time.perf_counter()
        # Compute the result.
        result = f(n)
        # Measure time right after running f.
        end_time = time.perf_counter()
        # Return the original result and the timing.
        return result, end_time - start_time

    return timed_function
```
-->


## A factory of logged functions

Write a function `logged_factory` that accepts a function like `factorial` or `fibonacci`.
Then, `logged_factory` should return another function that behaves in this way:

 - it accepts a single number argument;
 - when it's called, it prints a message saying the function was called and shows its argument;
 - it calls the original function to get the result;
 - when the original function is done, it prints a message saying the function was done and shows its result; and
 - it returns the value produced by the original function.

Once the function `logged_factory` is implemented properly, the code below should work:

```py
from math import cos, factorial

def logged_factory(f):
    ...  # Your code goes here...

logged_factorial = logged_factory(factorial)
logged_cos = logged_factory(cos)

logged_factorial(5)
logged_factorial(10)
logged_cos(0)
```

<!--
```py
def logged_factory(f):
    def logger(n):
        print(f"Called {f.__name__} with {n = }.")
        result = f(n)
        print(f"Result of {f.__name__} is {result}.")
        return result

    return logger
```
-->

Running the code above, assuming `logged_factory` is working, should produce this output:

```
Called factorial with n = 5.
Result of factorial is 120.
Called factorial with n = 10.
Result of factorial is 3628800.
Called cos with n = 0.
Result of cos is 1.0.
```

```{tip}
If `f` is a function, then `f.__name__` is the name of the function.
```

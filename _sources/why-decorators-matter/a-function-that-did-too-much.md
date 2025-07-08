# A function that did too much

To help understand why decorators matter, start by taking a look at the function `factorial` below, which is how you might implement the mathematical operation “factorial”:

```py
# In modern Python: from math import factorial

def factorial(n):
    result = 1
    while n > 1:
        result *= n
        n -= 1
    return result
```

If you are calling this function a lot with a few large integers as arguments, you may want to cache the results you compute to save yourself some time.

A simple caching system can be implemented as a dictionary.
The dictionary keys are the argument values for `n` and the dictionary values are the outputs of the function `factorial`.
When someone calls your function, you check if the argument `n` has already been computed or not:

 - if it has, you return the value from the dictionary directly; and
 - if it hasn't, you compute the value and then store it in the cache dictionary.

The implementation of the cache dictionary idea could look something like this:

```py
_factorial_cache = {}

def factorial(n):
    if n not in _factorial_cache:
        _n = n
        result = 1
        while _n > 1:
            result *= _n
            _n -= 1
        _factorial_cache[n] = result

    return _factorial_cache[n]
```

The caching works and will save you a lot of time if you compute the function with repeated arguments...
But this solution is far from ideal!

The solution is far from ideal because you introduced a cache that is only loosely coupled to the function it's relevant to, while also introducing code in the function that is not really relevant for the original objective of the function.

In other words:

 - the cache dictionary, `_factorial_cache`, lives outside of the function and isn't explicitly tied to the function in any meaningful way; and
 - the function `factorial` is supposed to compute the factorial, but is now polluted with more lines of code that do other things.

Instead of baking caching into the function, which is a poor one-time solution for something you might want to do with other functions, you can write a higher-order function that adds caching to any function I want.
In some sense, you can write a “cache factory” that accepts a function without a cache and produces an improved version of your function that contains a cache.

Let us see how you can do this.

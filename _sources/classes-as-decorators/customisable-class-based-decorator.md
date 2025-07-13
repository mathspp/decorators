# Customisable class-based decorators

To close off this section, the only thing missing is taking a look at the implementation pattern that the decorator `lru_cache` uses, since `lru_cache` itself is a function but, once applied to a function, you get an instance of another class that is not a function:

```python
from functools import lru_cache

print(type(lru_cache))  # <class 'function'>

@lru_cache
def f():
    pass

print(type(f))  # <class 'functools._lru_cache_wrapper'>
```

The decorator `lru_cache` accepts arguments, and in a class-based decorator, the most reasonable way of accepting arguments is as arguments to `__init__`; after all, that's the way you're supposed to customise classes...

So, tentatively, you could add a parameter `maxsize` to your class-based decorator `cache`:

```python
class cache:
    def __init__(self, fn, maxsize):
        self.fn = fn
        self.maxsize = maxsize
        # ...
    # ...
```

However, just like when you were figuring out how to add arguments to decorators, this breaks the ability to use `cache` as a decorator directly:

```python
@cache
def f():
    ...
# Exception raised:
Traceback (most recent call last):
  File "<python-input-8>", line 1, in <module>
    @cache
     ^^^^^
TypeError: cache.__init__() missing 1 required positional argument: 'maxsize'
```

Instead of putting the class `cache` inside of a function, as we did before, the standard library opts for giving it another name and leaving it in the global scope while creating another function that acts as the decorator:

```python
class cache_wrapper:
    def __init__(self, fn, maxsize):
        self.fn = fn
        self.maxsize = maxsize
        # ...
    # ...

def cache(maxsize_or_fn=None):
    if callable(maxsize_or_fn):  # (1)
        fn = maxsize_or_fn
        return cache_wrapper(fn, None)
    else:  # (2)
        maxsize = maxsize_or_fn
        def decorating_function(fn):
            return cache_wrapper(fn, maxsize)
        return decorating_function
```

The decorator `cache` is prepared to be used as `@cache`, `@cache()`, and `@cache(1000)`:

 1. If it's used as `@cache`, then the argument `maxsize_or_fn` is a function and the conditional statement in `(1)` is entered.
 You can return an instance of the class `cache_wrapper` with the function given and the default value for the other argument(s) of the decorator.
 2. If it's used as `@cache()` or `@cache(1000)`, then the argument `maxsize_or_fn` is supposed to be interpreted as the maximum size of the cache, in which case you enter the `else` in `(2)` and you create a decorating function that will be immediately applied to the function to be decorated, which in turn returns an instace of `cache_wrapper`.

Now that you have all the tools to create class-based decorators, you will put your understanding to the test.

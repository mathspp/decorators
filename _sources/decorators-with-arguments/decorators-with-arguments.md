# Decorators with arguments

The general principle can be derived from the work you did on the decorator `cache` and the decorator factory `cache_factory`.
If you want a decorator that is customisable, you need to add one level of nesting as far as functions go, so that the outer function returns a decorator.

```python
def cache_factory(maxsize):
    """This function accepts parameters and returns a cache decorator.
    It's a decorator factory."""

    def cache(f):
        """This is a “regular” decorator, although it's defined inside
        another function.
        It's a function factory.
        """
        cache = {}
        def cached_f(*args):
            """This is the wrapper that is going to replace the function
            `f` once the decorator `cache` is used.
            This is a regular function.
            """
            if args not in cache:
                if len(cache) >= maxsize:
                    cache.popitem()
                cache[args] = f(*args)
            return cache[args]

        # The decorator `cache` must return the function `cached_f` that
        # will replace the function `f`.
        return cached_f

    # The function `cache_factory` must return the decorator `cache` that
    # will be applied to some function.
    return cache
```

If functions inside functions inside functions is confusing to you, one way to get there is by [making your decorator depend on global variables](./global-cache-size.md).
Then, indent all your code to put it inside a decorator factory whose arguments are all the global variables that your decorator depends on.
Finally, make sure your decorator factory returns your decorator.

---

TODO: snappify diagram here showing the transition from

```python
MAXSIZE = 1000

def cache(f):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            if len(cache) >= MAXSIZE:
                cache.popitem()
            cache[args] = f(*args)
        return cache[args]

    return cached_f
```

to

```python
def cache_factory(maxsize):
    def cache(f):
        cache = {}
        def cached_f(*args):
            if args not in cache:
                if len(cache) >= maxsize:
                    cache.popitem()
                cache[args] = f(*args)
            return cache[args]

        return cached_f

    return cache
```

---

It is “just” that, and now it's time for you to put this knowledge to practice.

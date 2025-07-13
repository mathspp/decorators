# Decorator factory

Recall the version of the decorator `cache` that relied on a global variable:

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

Now, instead of using `MAXSIZE` as a global variable, indent the whole code and put it inside a function called `cache_factory`:

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
```

The function `cache_factory` accepts an integer for the maximum cache size and then creates a _working_ decorator `cache` as you've seen before.
Now, for the function `cache_factory` to be fully working, it must return the decorator `cache` that it built:

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

Now, the function `cache_factory` can be used to build caches with different maximum sizes.
If you want to decorate `fn1` with a cache of maximum size 1,000 and `fn2` with a cache of maximum size 2,000, you can do so:

```python
cache1000 = cache_factory(1000)
cache2000 = cache_factory(2000)

@cache1000
def fn1(...):
    ...

@cache2000
def fn2(...):
    ...
```

Since `cache_factory` is a cache factory, you can use it to create two different cache decorators (`cache1000` and `cache2000`) and then you can apply those.
This works!

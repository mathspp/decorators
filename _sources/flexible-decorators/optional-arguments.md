# Optional arguments

They key to writing a decorator like `lru_cache`, that can be used as `@lru_cache()` or as `@lru_cache(1000)` is remembering that decorators are still Python functions.
A Python function can accept _optional_ arguments if the parameters are given a default value, which is what you must do when writing a decorator like this.

As far as the caching example goes, you could set `1000` as the default value of `maxsize`:

```python
def cache_factory(maxsize=1000):
    ...
```

By doing this, you allow `cache_factory` to be used as `@cache_factory()`, in which case the cache will have a default maximum size of 1,000 items.

Alternatively, you could set the default value to `None` and then tweak the decorator so that `@cache_factory()` means the cache will have no maximum size:

```python
def cache_factory(maxsize=None):
    def cache(f):
        cache = {}
        def cached_f(*args):
            if args not in cache:
                #  vvvvvvvvvvv
                if maxsize is not None and len(cache) >= maxsize:
                    cache.popitem()
                cache[args] = f(*args)
            return cache[args]

        return cached_f

    return cache
```

The new conditional statement `if maxsize and len(cache) >= maxsize` only checks the size of the cache if `maxsize` is not the default value `None`.
If `maxsize` is the default value `None`, then the cache can grow unbounded.

You can now use `cache_factory` as `@cache_factory()` or as `@cache_factory(1000)`, but how do you make it so that the decorator works without any parentheses..?

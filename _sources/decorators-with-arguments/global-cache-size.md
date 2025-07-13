# Global cache size

The end goal now is to create a cache decorator for which you can specify the maximum cache size (if any), instead of hardcoding it into the decorator.
To get there, a good first step is refactoring the decorator with the hardcoded cache size into a decorator that reads the cache size from a global variable:

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

At this point, the decorator still works in the exact same way:

 - caches can't grow past 1,000 items; and
 - all caches created with the decorator `cache` have the same maximum size.

However, the maximum size is now a global variable that has a proper name and that lives outside of the decorator.
This makes it easier to tweak the maximum cache size.

The full solution is similar to this, but you want to find a way to “isolate” the value of `MAXSIZE` to each application of the decorator...

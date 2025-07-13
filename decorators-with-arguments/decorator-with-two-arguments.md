# Decorator with two arguments

Now that the maximum size is isolated as a variable, it becomes clear that the maximum size is a good candidate to become an argument to the caching decorator; something like

```python
def cache(f, maxsize):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            if len(cache) >= MAXSIZE:
                cache.popitem()
            cache[args] = f(*args)
        return cache[args]

    return cached_f
```

By writing the decorator like this, the maximum size can now be customised _per application of the decorator_ instead of being a global that is shared across all applications...

But how do you apply the decorator `cache` seen above?
If `fn` is the function to decorate, you can apply the decorator like this:

```python
fn = cache(fn, 1000)
```

This adds a cache to the function `fn` with a maximum size of 1,000 items.
If, later on, you have a second function `fn2` to add a cache to, you could decorate it with

```python
fn2 = cache(fn2, 2000)
```

This adds a cache to `fn2` with a maximum size of 2,000 that is _independent_ of the cache of `fn`!
This is progress, already.
But the decorator `cache` with two arguments has a problem...

The decorator `cache` with two arguments can't be applied with the at sign `@` syntax.
Think about it...
How would you do it?
And swapping the order of the arguments doesn't work, either...

To use the at sign `@` syntax, you'd want to do something like this:

```python
cache(1000)
def fn(...):
    ...
```

But for this to be possible, `cache(1000)` must be a decorator, which can only happen if:

 1. `cache` expects a single argument, the cache size; and
 2. `cache(maxsize)` returns a decorator.

So, that is what you have to do!
You have to write `cache` as a factory of decorators.
`cache` must be a function that returns decorators!

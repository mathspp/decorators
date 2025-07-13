# Inline factory usage

Consider the function `cache_factory` you built just now:

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

You can also apply it directly with the at sign `@` syntax, without having to create intermediate cache decorators:

```python
@cache_factory(1000)
def fn1(*args):
    ...

@cache_factory(2000)
def fn2(*args):
    ...
```

This works because the at sign `@` expects a decorator, and the expression `decorator_factory(...)` returns a decorator, so you can use it directly in front of the at sign `@`.
If you remember that the at sign `@` is just syntactic sugar, you can unroll the operation that is happening.

So,

```python
@cache_factory(1000)
def fn1(*args):
    ...
```

is the same as

```python
def fn1(*args):
    ...

fn1 = cache_factory(1000)(fn1)
```

The line `cache_factory(1000)(fn1)` might look odd, but function application evaluates from left to right, so `cache_factory(1000)` first evaluates to a cache decorator with a maximum size of 1,000 items.
Suppose it is called `cache1000`.
So, `cache_factory(1000)(fn1)` evaluates to `cache1000(fn1)`, which is the regular decorator application you are used to.

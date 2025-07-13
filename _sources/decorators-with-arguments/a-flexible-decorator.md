# A flexible decorator

The decorator factory `cache_factory` is inspired by the decorator `lru_cache` from the module `functools`.
But `lru_cache` is an interesting decorator, because it can be used in three key different ways, from a syntactical point of view:

```python
@lru_cache        # 1
@lru_cache()      # 2
@lru_cache(1000)  # 3
```

 1. You can use the decorator directly, without parametrising it.
 2. You can call the decorator with no arguments.
 3. You can customise the decorator to specify the maximum size.

From the point of view of the behaviour of the cache, 1. and 2. are the same, and create caches with no maximum size.
But from the point of view of the syntax and the things that Python does behind the scenes, the three alternatives are fairly different.
If you unroll the syntactic sugar of the at sign `@`, this is what you get:

```python
fn = lru_cache(fn)        # 1
fn = lru_cache()(fn)      # 2
fn = lru_cache(1000)(fn)  # 3
```

How do you write a decorator that can behave both like a decorator factory (as in 1.) and like a decorator (as in 2. and 3.)?

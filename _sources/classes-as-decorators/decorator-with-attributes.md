# Decorator with attributes

Since the class-based decorator replaces the function with an instance of the decorator class, this class might also implement attributes that include useful information.
This makes decorators even more useful, since they can greatly extend the functionality of the original function.

For example, the caching decorator might want to keep track of how many times the cache is successfully used (how many times the cache is hit) and how many times the cache doesn't have the value that is required (how many times there is a cache miss).
Using a class-based decorator, this is straightforward to implement:

```python
class cache:
    def __init__(self, fn):
        self.fn = fn
        self.cache = {}
        self.hits = self.misses = 0  # <--

    def __call__(self, *args):
        if args not in self.cache:
            self.misses += 1  # <--
            self.cache[args] = self.fn(*args)
        else:  # <--
            self.hits += 1
        return self.cache[args]

    def clear_cache(self):
        self.cache = {}
        self.hits = self.misses = 0
```

This improved version contains attributes that let the user evaluate the usefulness of the cache during runtime and it also provides a method to clear the cache (it could easily provide other methods to manipulate the cache).

Here is an example of this decorator being used:

```python
@cache
def add(a, b):
    return a + b

# miss
add(1, 2)
# hit      hit        hit
add(1, 2); add(1, 2); add(1, 2)

print(add.hits, add.misses)  # 3 1
```

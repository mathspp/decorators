# Decorator with methods

The usage of attributes to keep track of state within the decorator might be a compelling-enough reason to use a class-based decorator instead of a function for some, but the benefits heavily outweigh the costs once you think about adding methods to your class-based decorators.

For instance, suppose you need a method `clear_cache` that resets the cache.
This can be achieved easily in a class-based decorator; all it takes is to write the method that you need:

```python
class cache:
    def __init__(self, fn):
        self.fn = fn
        self.cache = {}

    def __call__(self, *args):
        if args not in self.cache:
            self.cache[args] = self.fn(*args)
        return self.cache[args]

    def clear_cache(self):
        self.cache = {}
```

Since the instances of the class `cache` will replace the decorated functions, the method `clear_cache` is immediately accessible whenever the decorator is used:

```python
@cache
def add(a, b):
    return a + b

add(1, 2)
add(1, 3)
print(add.cache)  # {(1, 2): 3, (1, 3): 4}
add.clear_cache()
print(add.cache)  # {}
```

How would you implement this functionality if you were restricted to using function-based decorators?

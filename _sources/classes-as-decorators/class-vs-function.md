# Class vs example

As an example of what a useful decorator might look like when implemented as a class, consider the decorator `cache` implemented below:

```python
class cache:
    def __init__(self, fn):
        self.fn = fn
        self.cache = {}

    def __call__(self, *args):
        if args not in self.cache:
            self.cache[args] = self.fn(*args)
        return self.cache[args]
```

This implementation of the decorator `cache` mimics the caching decorator that you developed earlier in this course:

 - both accept the function “at the top”:
   - the function decorator accepts it as its argument; and
   - the class-based decorator accept it as the argument in `__init__`.
 - the class-based decorator uses attributes to save the information that the function decorator saves implicitly in its closure:
   - the function argument must be saved as an attribute; and
   - all other variables created inside the closure and that are accessed by the wrapper must be turned into attributes.
 - the wrapper function becomes the dunder method `__call__` of the class-based decorator; and
 - the function decorator needs to return the wrapper so it replaces the original function and to make it accessible but the class-based decorator doesn't return anything because the instance will automatically be available to the user.

The diagram below represents these relationships:

![Diagram showing the similarities in structure between a function decorator and a decorator written as a class.](class_vs_function.png)


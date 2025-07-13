# Making the instance callable

You already have a class `D` that can be used with the at sign `@` syntax of a decorator:

```python
class D:
    def __init__(self, fn):
        self.fn = fn

@D
def greet(who):
    print(f"Hello, {who}!")
```

However, the class `D` isn't a great decorator yet, because it doesn't even let you use the function!
Since the function `greet` is supposed to greet someone, you'd expect to be able to use it after it being decorated.
But you get an exception if you try to use your “function”:

```python
greet("world")
# Exception raised:
Traceback (most recent call last):
  File "<python-input-9>", line 1, in <module>
    greet("world")
    ~~~~~^^^^^^^^^
TypeError: 'D' object is not callable
```

The problem is that the original function `greet` was replaced by an instance of `D` and this instance of `D` doesn't look enough like the original function, since you can't use the instance as a function yet.

To fix this, you must implement [the dunder method](https://mathspp.com/blog/pydonts/dunder-methods) `__call__`!
If a class implements `__call__`, its instances will be callable.
In this case, you have to forward the arguments given to the instance to the underlying function that was decorated:

```python
class D:
    def __init__(self, fn):
        self.fn = fn

    def __call__(self, *args, **kwargs):
        return self.fn(*args, **kwargs)
```

With this implementation of `D.__call__`, the class `D` is now a suitable do-nothing decorator:

```python
@D
def greet(who):
    print(f"Hello, {who}!")


greet("world")  # Hello, world!
```

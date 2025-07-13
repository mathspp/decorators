# The class arguments

If a class `D` is supposed to be a decorator, then `D` will be used like so:

```python
@D
def fn(*args, **kwargs):
    ...
```

That will be translated to

```python
def fn(*args, **kwargs):
    ...

fn = D(fn)
```

This shows two things:

 1. the function is the argument that the class `D` must accept when it is instantiated; and
 2. the function that is decorated is replaced by the instance of the class.

To comply with the first point, `D` must be implemented like so:

```python
class D:
    def __init__(self, fn):
        self.fn = fn
```

If you define `D` as seen above, you can already use it as a decorator:

```python
@D
def fn():
    pass
```

The code runs and you can see that `fn` is now an instance of `D`:

```python
print(fn)  # <__main__.D object at 0x102b31a90>
```

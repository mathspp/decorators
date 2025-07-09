# Exercises

These exercises focus on writing decorators (that might be functions or classes, you decide) that are then applied to classes.


## `auto_repr`

Write a decorator `auto_repr` that automatically adds a pretty `__repr__` to a class.
You can use the built-in `vars` to inspect the attributes of an object, and assume that's good enough.

If you're successful, the snippet below should work:

```py
@auto_repr
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(1, 2)
print(p)  # Point(x=1, y=2)
```


## `ordering`

Write a decorator `ordering` that automatically adds the comparison dunder methods to a class.
The decorator `ordering` is applied to classes that have the methods `__eq__` and `__lt__`, and from that you're supposed to add the methods `__le__`, `__gt__`, and `__ge__`, so that the class can be used in all types of comparisons.

If you're successful, the snippet below should work:

```py
@ordering
class MyInt:
    def __init__(self, value):
        self.value = value

    def __eq__(self, other):
        return self.value == other.value

    def __lt__(self, other):
        return self.value < other.value

print(MyInt(3) <= MyInt(5))  # True
print(MyInt(3) > MyInt(4))  # False
print(MyInt(3) >= MyInt(3))  # True
```

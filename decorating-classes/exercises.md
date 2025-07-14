# Exercises

These exercises focus on writing decorators (that might be functions or classes, you decide) that are then applied to classes.


## `sane_equals`

Rewrite the decorator `sane_equals` that provides a saner default implementation for the [dunder method](https://mathspp.com/blog/pydonts) `__eq__`.
The saner equality should determine that two instances are equal if their attributes are the same and have the same values.

If you're successful, your decorator should be usable in this situation:

```py
@sane_equals
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

assert Point(0, 0) == Point(0, 0)
```

For bonus points, can you find a way to handle comparison across different types (with the same attributes) better?

If you're successful doing the bonus task, your decorator should be usable in this situation:

```py
class SomethingElse:
    def __init__(self, x, y):
        self.x = x
        self.y = y

assert not Point(0, 0) == SomethingElse(0, 0)
```

## `register`

Write a decorator `register(name)` that doesn't modify the classes it decorates, but instead stores them in a register for later look-up.
The decorator accepts an optional string that determines whether the class is saved in the default registry, or if it's saved in a specific registry with the given name.
There should be a way to retrieve all classes registered in the default registry or under the default name.

If you're successful, your decorator should be usable more or less like this:

```python
@register
class A:
    pass

@register("consonants")
class B:
    pass

@register("consonants")
class C:
    pass

print(register.get_registered())  # [<class 'A'>]
print(register.get_registered("consonants"))  # [<class 'B'>, <class 'C'>]
```

## `auto_repr`

Write a decorator `auto_repr` that automatically adds a pretty `__repr__` to a class.
You can use the built-in `vars` to inspect the attributes of an object, and assume that's good enough.

If you're successful, the snippet below should work:

```python
@auto_repr
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(1, 2)
print(p)  # Point(x=1, y=2)
```

This is a small subset of what the decorator `dataclasses.dataclass` from the standard library does.


## `ordering`

Write a decorator `ordering` that automatically adds the comparison dunder methods to a class.
The decorator `ordering` is applied to classes that have the methods `__eq__` and `__lt__`, and from that you're supposed to add the methods `__le__`, `__gt__`, and `__ge__`, so that the class can be used in all types of comparisons.

If you're successful, the snippet below should work:

```python
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

This is a simplification of the decorator `functools.total_ordering` from the standard library.

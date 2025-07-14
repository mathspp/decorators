# A decorator for a class

Take the class `Point` defined below:

```py
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
```

By default, instances of custom classes can be compared for equality, but the default behaviour is to check if the two objects are the same.
Thus, checking if an instance is equal to itself returns `True`:

```py
p = Point(0, 0)
print(p == p)  # True
```

However, if you compare two instances that have attributes with the same values, the two instances are not considered equal:

```py
print(Point(0, 0) == Point(0, 0))  # False
```

This is the default behaviour, which often isn't the desired one.

Instead of implementing the [dunder method](https://mathspp.com/blog/pydonts/dunder-methods) `__eq__` for every single class you implement, you can write a generator to do that for you.
This might just work, since in most cases, the behaviour you want is “two instances are equal if their attributes have the same values”, which is something you can generalise.

To do this, you can write the decorator `sane_equals` shown below:

```py
def sane_equals(cls):
    def __eq__(self, other):  # (1)
        return vars(self) == vars(other)
    cls.__eq__ = __eq__  # (2)
    return cls  # (3)
```

The decorator is fairly short but does a lot:

 1. First, it defines the function `__eq__` as we'd like it to be, comparing the attributes of the two instances.
 2. Secondly, we plug that function into `cls` so it becomes a method of the class.
 3. Finally, we return the original class so that the assignment works.

You can give it a go, now:

```py
@sane_equals
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

print(Point(0, 0) == Point(0, 0))  # True
```

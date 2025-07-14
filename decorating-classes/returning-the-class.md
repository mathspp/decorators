# Returning the class

Remember the decorator `sane_equals` that you defined:

```py
def sane_equals(cls):
    def __eq__(self, other):
        return vars(self) == vars(other)
    cls.__eq__ = __eq__
    return cls  # ?!
```

Why do you need to return the class if the assignment `cls.__eq__ = __eq__` modifies the class in place?
You know the answer...

The return statement is very important because decorator syntax is _just syntactic sugar_ for a reassignment into the same name!
So, even though plugging the method `__eq__` modifies the class in place, if you don't return it, you'll overwrite the class with the useless value `None`:

```py
def class_decorator(cls):
    pass  # Do nothing, but return nothing

@class_decorator
class C:
    pass

print(C)  # None
```

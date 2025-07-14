# Patching methods

One thing to understand about decorators for classes is how to define “methods” outside classes and then how to plug them so everything works together.

To _fully_ understand how methods work, [you'll want to learn about descriptors](https://mathspp.com/blog/pydonts/descriptors).
But you don't have to learn about descriptors to learn the gist of it.

Methods are “just” functions that are tied to classes, and “tied to” doesn't mean they're defined _inside_ the class when the class is defined.
“Tied to” just means they're accessed as if they're attributes from the class:

```py
class Cls:
    def fn(self):
        pass

print(Cls.fn)  # <function Cls.fn at 0x103505430>
print(type(Cls.fn))  # <class 'function'>
```

This is exactly the same as if you define the class `Cls` and the function `fn` separately, and then assign the function `fn` to `Cls.fn`:

```py
class Cls:
    pass

def fn(self):
    pass

Cls.fn = fn
print(Cls.fn)  # <function Cls.fn at 0x103505430>
print(type(Cls.fn))  # <class 'function'>
```

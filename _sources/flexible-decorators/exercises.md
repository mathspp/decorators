# Exercises

If you want to get some practice writing very flexible decorators that work with and without arguments, take a look at [the exercises from the section on decorators with arguments](../decorators-with-arguments/exercises.md).
Redo all of them, and for each exercise make sure your decorator can be used in all three ways:

```python
@dec
@dec()
@dec(arg1, arg2, ...)
```

Note that this means you will also have to come up with some reasonable default values for each decorator.

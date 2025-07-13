# Classes are callable

What is the output of running the code below?

```python
print(int("3"))  # ??
```

If you guessed “3”, then you are obviously correct.
The built-in `int` turns strings into integers, when such a conversion is reasonable, and you can read about its behaviour in the documentation page called “Built-in functions”.
However, the built-in `int` is not, strictly speaking, a function...

The built-in `print` is a function:

```python
print(type(print))  # <class 'builtin_function_or_method'>
```

However, the built-in `int` produces a different output:

```python
print(type(int))  # <class 'type'>
```

The output says that `int` is a type, which means that `int` is a class!
It's a built-in class, but a class.
All this to say that classes can also be called with parenthesis `()` after their name...

And the decorator syntax with the at sign `@` doesn't _really_ require a function...
Since the at sign syntax `@decorator` around a function `fn` translates into the call `decorator(fn)`, classes can also be used as decorators!
But is that useful?

# Accepting a variable number of keyword arguments

One of the limitations of the decorator `cached_factory` that you developed so far is that it only works with functions that accept positional arguments, but not with functions that accept keyword arguments.

Just like Python has the syntax `*args` to accept a variable number of positional arguments, the syntax `**kwargs` accepts a variable number of keyword arguments.
Again, the important part of the syntax is the double asterisk, `**`.
It is common in Python to talk about `**kwargs`, but the name of the variable does _not_ have to be `kwargs`.

When you use `**kwargs`, Python will collect all keyword arguments into a dictionary:

```py
def print_kwargs(**kwargs):
    print(kwargs)

print_kwargs()
# {}
print_kwargs(a=1, b=2)
# {'a': 1, 'b': 2}
print_kwargs(bananas=True, colour="yellow")
# {'bananas': True, 'colour': 'yellow'}
```

`**kwargs` can also come after some other arguments:

```py
def print_kwargs_after(a, b, **kwargs):
    print(a, b, kwargs)

print_kwargs_after(1, 2)
# 1 2 {}
print_kwargs_after(1, 2, bananas=True)
# 1 2 {'bananas': True}
print_kwargs_after(1, 2, bananas=True, colour="yellow")
# 1 2 {'bananas': True, 'colour': 'yellow'}
```

`*args` and `**kwargs` can be combined, too, but before you see that in action, I have a quick challenge to make sure you're comfortable with `**kwargs`.

Write a function `update_dictionary` that accepts a dictionary as a positional argument and then accepts an arbitrary number of keyword arguments.
The dictionary must be updated to include all the key/value pairs specified as positional arguments.
If you do it correctly, the snippet below should work:

```py
my_dict = {}

update_dictionary(my_dict)  # No kwargs used.
print(my_dict)  # {}

update_dictionary(my_dict, name="Rodrigo")
print(my_dict)  # {'name': 'Rodrigo'}

update_dictionary(my_dict, name="John", surname="Smith")
print(my_dict)  # {'name': 'John', 'surname': 'Smith'}
```

<!--
```py

def update_dictionary(d, **kwargs):
    d |= kwargs
```
-->

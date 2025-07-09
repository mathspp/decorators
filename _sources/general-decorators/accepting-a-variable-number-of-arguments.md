# Accepting a variable number of arguments

The built-in function `max` can accept an arbitrary number of arguments:

```py
print(max(1))  # 1
print(max(1, 2))  # 2
print(max(1, 2, 3))  # 3
print(max(1, 2, 3, 4))  # 4
...
```

There are other built-ins that do that...
But you can also write functions that behave in this way.

In Python, for a function to accept a number of arbitrary arguments, you just add an asterisk `*` to the left of the parameter that represents the “arbitrary number of arguments” that the user might pass in.
Usually, in the Python world, we call it `*args` (pronounced “star args”).

The parameter that gets the asterisk `*` next to it will then be a _tuple_ with whatever values the user passed in.
Here is an example of a function that accepts a variable number of arguments and whose only functionality is printing those same arguments:

```py
def print_star_args(*args):
    print(args)
```

If you use the function `print_star_args` with a couple of different arguments, you will see that the variable `args` is always a tuple:

```py
print_star_args()  # ()
print_star_args(True)  # (True,)
print_star_args(1, 2, 3)  # (1, 2, 3)
```

`*args` can also be used after some positional arguments, in which case the function accepts as many positional arguments as specified, plus an arbitrary number of arguments.
For example, the function `add_two_or_more` shown below accepts two mandatory positional arguments, plus as many arguments as you want.
But the minimum number of arguments that are accepted is two:

```py
def add_two_or_more(a, b, *args):
    return a + b + sum(args)

print(add_two_or_more(1, 2))  # 3
print(add_two_or_more(1, 2, 3, 4, 5, 6))  # 21
```

As a quick comprehension check, can you implement a function `my_max` that accepts a variable number of arguments and then returns the maximum value?
If you do it right, the snippet of code below should work:

```py
print(my_max(1))  # 1
print(my_max(1, 2))  # 2
print(my_max(1, 2, 3))  # 3
print(my_max(1, 2, 3, 4))  # 4
```

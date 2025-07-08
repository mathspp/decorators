# Functions are objects

## A key idea

Before jumping right into the world of decorators, there is a very important concept that can make or break your understanding of decorators, and that is the fact that Python functions are objects.

The built-in function `sorted` can be used to sort lists of objects.
If you pass it a list of lower case strings, you get another list with the same strings in alphabetical order:

```py
fruits = ["banana", "pear", "grapefruit", "apple"]
print(sorted(fruits))  # ['apple', 'banana', 'grapefruit', 'pear']
```

But what if you wanted to sort the strings _by length_, instead of alphabetically?
In that case, you can use the keyword parameter `key` from the built-in `sorted`.
You pass it a function that accepts strings and that returns their length, and `sorted` will use it to figure out how to sort the strings:

```py
fruits = ["banana", "pear", "grapefruit", "apple"]
print(sorted(fruits, key=len))
# ['pear', 'apple', 'banana', 'grapefruit']
```

The built-in `len` is a built-in you probably know already: it computes the length of strings, lists, and other similar objects.
However, the built-in `len` is also an object.
You can pass it as an argument to another function, like you just did with `sorted(..., key=len)`.

In other words, functions are like any other value.
You can assign them to variables, pass them into functions and return them from functions, put them in containers (like lists or dictionaries, for example), and more!

This is a key idea that is used implicitly and explicitly whenever you are working with decorators, so make sure you are comfortable with it before you move along!


## Exercises

To help make you comfortable with the idea that functions are objects, too, try to figure out what is the output of the following snippets of code and then run them yourself to check your answers:

1.

```py
numbers = [42, 73, 0, 16, 10]
functions = [sorted, max, min]
print(
    functions[1](numbers)
)  # ??
```

2.

```py
numbers = [42, 73, 0, 16, 10]
a, b, c = sorted, max, min
d, e, f = a, sorted, c
g, h, i = d, e, f
print(
    i(h(g(numbers)))
)  # ??
```

3.

```py
import operator

ops = {
    "+": operator.add,
    "-": operator.sub,
}

def get_computation(op_name):
    return ops[op_name]

addition = get_computation("+")
print(addition(1, 2))  # ??
```

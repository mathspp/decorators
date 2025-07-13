# Non-local variables

To access non-local variables in closures, use the keyword `nonlocal`.
Non-local variables are variables that are neither local, nor global.
For example, the variable `counter` is a non-local variable from the point of view of the function `inner` in the snippet below:

```py
def outer():
    counter = 0

    def inner():
        ...  # From the point of view of `inner`,
        # `counter` is neither local nor global.
```

Non-local variables can be read from inner functions without any special keywords:

```py
def outer():
    counter = 0

    def inner():
        print(counter)

    return inner

inner = outer()
inner()  # 0
inner()  # 0
```

To write to them, you need to declare the variable as non-local with the keyword `nonlocal`:

```py
def outer():
    counter = 0

    def inner():
        nonlocal counter
        counter += 1
        print(counter)

    return inner

inner = outer()
inner()  # 1
inner()  # 2
```

Note how you first declare the variable as non-local with `nonlocal counter` and only then you're allowed to write to it.

By the way, since you can read the value of a variable without using the keyword `nonlocal`, you can also mutate the value of a variable without the keyword `nonlocal`:

```py
def outer():
    my_list = []

    def inner():
        my_list.append(1)
        print(my_list)

    return inner

inner = outer()
inner()  # [1]
inner()  # [1, 1]
```

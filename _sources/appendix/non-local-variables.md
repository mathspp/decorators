# Non-local variables

```{warning}
This needs to be properly written up.
```

To modify a variable that lives in a closure, use the keyword `nonlocal`.

Example:

```py
def outer():
    counter = 0
    def increment():
        nonlocal counter
        counter += 1
        print(f"{counter = }")

    return increment

f = outer()
f()  # counter = 1
f()  # counter = 2
f()  # counter = 3
```

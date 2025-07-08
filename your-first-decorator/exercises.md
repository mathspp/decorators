# Exercises

Complete the exercises below to cement your understanding of the decorator syntax, the usage of the at sign `@`, and the process of writing decorators.

Most exercises here are adaptations of common decorators and you'll soon learn about the features that are required for you to implement full-featured versions of these decorators, instead of the simplifications you'll work with in here.

## Shorthand decorator syntax

Although rewriting may seem painful and unnecessary, a bit of repetition helps cement the ideas because your brain gets repeated exposure to the same (code) patterns.
That is why I ask you to complete the three following exercises:

 1. Rewrite [the decorator `cached_factory` from before](../why-decorators-matter/exercises.md#a-factory-of-cached-functions). Then, use the at sign `@` to apply it to the function `fibonacci` and test the decorator was correctly applied.
 2. Rewrite [the decorator `timed_factory` from before](../why-decorators-matter/exercises.md#a-factory-of-timed-functions). Then, use the at sign `@` to apply it to the function `fibonacci` and test the decorator was correctly applied.
 3. Rewrite [the decorator `logged_factory` from before](../why-decorators-matter/exercises.md#a-factory-of-logged-functions). Then, use the at sign `@` to apply it to the function `fibonacci` and test the decorator was correctly applied.

Here is the implementation of the function `fibonacci`, for your convenience:

```py
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```


## Retry decorator

Consider the function `roll_a_six` defined below:

```py
import random

def roll_a_six():
    if random.randint(1, 6) != 6:
        raise ValueError("Wrong value!")
    return 6
```

If you run it, there is a high chance you will get a `ValueError`.
If you run it enough times, eventually you get a 6.

````{margin}
Use the syntax

```py
try:
    ...  # Code that might error.
except Exception:
    print("Failed")
```

to call the original function that may produce different errors.
````

Write a decorator `retry` that accepts a function that takes no arguments and that might error.
The decorator `retry` should return another function that takes no arguments and that, when called, tries running the original function.
Every time the original function raises an error, print a message saying something went wrong and then try again.
Do this until the function works.
When it works, print the result.

After you implement `retry`, **apply** it as a decorator to the function `roll_a_six`.
Then, call `roll_a_six` three times:

```py
roll_a_six()
roll_a_six()
roll_a_six()
```

You should get output similar to this:

```
Failed.
Failed.
Success: 6
Failed.
Failed.
Failed.
Failed.
Failed.
Success: 6
Failed.
Failed.
Failed.
Success: 6
```

This exercise is a simplification of a decorator that is actually quite useful when using APIs or services that might temporarily be unavailable.

<!--
```py
def retry(f):
    def repeater():
        while True:
            try:
                result = f()
            except Exception:
                print("Failed.")
            else:
                break
        print(f"Success: {result}")
        return result

    return repeater
```
-->


## Ignore some errors

Go back to the function `roll_a_six` from before:

```py
import random

def roll_a_six():
    if random.randint(1, 6) != 6:
        raise ValueError("Wrong value!")
    return 6
```

Write a decorator `ignore_value_errors` that accepts a function that takes no arguments and that might produce a `ValueError`.
The decorator `ignore_value_errors` should return a function that calls the original function.
If the original function produces a `ValueError`, suppress it and return `None`.
If the original function works, return its value.

```py
def ignore_value_errors(f):
    def ignorer():
        try:
            return f()
        except ValueError:
            return None

    return ignorer
```

After you implement `ignore_value_errors`, **apply** it as a decorator to the function `roll_a_six`.
Then, call `roll_a_six` a bunch of times inside calls to `print`:

```py
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
print(roll_a_six())
```

You should get output similar to this:

```
None
None
None
6
None
None
None
6
None
None
None
None
6
```

This exercise is a simplification/adaptation of `contextlib.suppress` from the standard library.

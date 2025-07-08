# Closures are bubbles

I want you to spend a minute understanding this notion of “closure” that also plays such an important role in the world of decorators.
Here is a “simple” example of a closure in action:

```py
def outer_function():
    seventy_three = 73
    def inner_function():
        print(seventy_three)

    return inner_function

inner = outer_function()
inner()  # 73 gets printed
```

If you run the snippet of code above, when you call the function `inner` the number 73 is printed on the screen.
And yet, if you try to access the variable `seventy_three` directly, you'll see it is not defined:

```py
print(seventy_three)
# NameError: name 'seventy_three' is not defined
```

The variable `seventy_three` is only accessible from within the function `inner` because Python created a closure around the function `inner` that contains a reference to the variable `seventy_three`.
A closure is a feature of the Python programming language (and of other programming languages, too) and I like to think of closures as bubbles:
when the function `inner_function` is created, Python realises the inner function uses the variable `seventy_three` that is defined _outside_ of the inner function but _inside_ the outer function.

Because the inner function is going to be returned to the outside of the outer function, Python creates a bubble around the inner function and the variable `seventy_three`, so that when the inner function is used in other places, it still has access to the variable `seventy_three`.
The inner function and the variable `seventy_three` live inside the bubble (the closure), so the inner function can access that variable.
But the other parts of your program live outside of that bubble, so they can't access the variable `seventy_three`.
That's why the `print(seventy_three)` raised an error before.

This is what allows your function `cached_factory` to work.
Remember its code:

```py
def cached_factory(f):
    cache = {}
    def cached_f(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]

    return cached_f
```

When the function `cached_f` is created, Python realises it is using the variables `f` and `cache` that are defined _outside_ of the function `cached_f` but _inside_ the function `cached_factory`.
So, it creates a bubble around those two variables, so that when `cached_f` is returned from inside `cached_factory`, the whole bubble is returned and the function `cached_f` is able to remember and access the variables `cache` and `f`.


## Exercises

To make you comfortable with closures, here are a few exercises you can solve.
Just take a look at each snippet of code and figure out what will be printed.
Then, run the snippet of code to make sure you got it right.

1.

```py
def outer():
    x = 42
    def inner(y):
        return x + y

    return inner

plus_42 = outer()
print(plus_42(10))  # ??
```

2.

```py
def make_adder(a):
    def inner_adder(b):
        return a + b

    return inner_adder

add = make_adder(10)
print(add(15))  # ??
```

3.

```py
def make_secret_list():
    my_list = []
    def inner(value):
        my_list.append(value)
        print(my_list)

    return inner

l1 = make_secret_list()
l2 = make_secret_list()

l1(42)  # ??
l1(73)  # ??
l2(0)  # ??
```

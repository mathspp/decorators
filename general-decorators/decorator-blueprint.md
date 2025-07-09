# Decorator blueprint

Going back to everything you've seen so far, and if you compare all the different decorators you already wrote in the previous exercises, you will find the general structure of any decorator.
This gives you a blueprint to create any decorator you might need:

At this point you already have a pretty solid understanding of the anatomy of a decorator.
Here is a quick recap:

```py
import functools

def decorator(function_to_decorate):  # 1
    @functools.wraps(function_to_decorate)  # 3
    # 2                # 4
    def inner_function(*args, **kwargs):
        ...  # 5
        result = function_to_decorate(*args, **kwargs)  # 6
        ...  # 7
        return result  # 8

    return inner_function  # 9
```

 1. A decorator is typically a higher-order function that accepts an arbitrary function as argument.
 2. Inside the body of a decorator we typically define an inner function to wrap the function argument.
 3. The inner function is decorated with `@functools.wraps`, so it preserves the metadata of the original function.
 4. The inner function accepts `*args` and `**kwargs` so it's general and works with any type of function argument provided.
 5. The inner function can run arbitrary code before the original function has to run.
 6. The inner function calls the original function, either with the original arguments or with modified versions.
 7. The inner function can run arbitrary code after the original function runs.
 8. The inner function returns its result, typically the result that the original function produced.
 9. The decorator returns the inner function that it built, so that the inner function can be used in place of the original one.

![Diagram showing the anatomy of a decorator, namely that it's an outer function accepting a function to decorate as an argument. Inside it, we define an inner function that accepts arbitrary args and kwargs and is decorated with functools.wraps, runs arbitrary code before running the original function, runs the original function, runs arbitrary code after the original function, and then returns the result. The outer function then returns the inner function defined.](decorator_blueprint.png)

What is important for you to realise is that this represents a generic recipe.
You can use it as a reference to implement your own decorators.
None of the bullet points above are rules that are set in stone and you can come up with situations and contexts where you'll need decorators that go against those bullet points.
Some decorators will do work before calling the original function but not after (skipping point 7), and some decorators do the opposite (skipping point 5), for example.

My suggestion is that you go through the decorators `cached_factory` and `timed_factory` that you implemented above and see how well they fit the blueprint above.
(Notice how the decorator `timed_factory` breaks the guideline 8., since it doesn't just return the output of the inner function, but also the timing information.)

Armed with this blueprint, it is time for some exercises.

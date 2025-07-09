# General signatures

`*args` and `**kwargs` can be used in conjunction, which allows you to write the most general function signature possible:

```py
def print_args_kwargs(*args, **kwargs):
    print(args, kwargs)

print_args_kwargs()
# () {}
print_args_kwargs(1, 2)
# (1, 2) {}
print_args_kwargs(bananas=True, colour="yellow")
# () {'bananas': True, 'colour': 'yellow'}
print_args_kwargs("hello", rest="world")
# ('hello',) {'rest': 'world'}
```

Because `*args` and `**kwargs` are so flexible, they are used commonly when you are implementing decorators.

If you think about it, it makes a lot of sense: when you are writing a decorator, you typically do not know what are the signatures of the functions you are decorating, and those functions might have very different signatures.
The only way to write a decorator that works truly with any possible function is by using `*args` and `**kwargs`.

Now, _sometimes_ you may write a decorator that only works for functions with certain signatures, and that is ok.
But, in general, you will want to write general decorators that work with general function signatures.

As an example, if you go back to [the decorator `timed_factory` you wrote in a past exercise](../why-decorators-matter/exercises.md#a-factory-of-timed-functions), you should use `*args` and `**kwargs` to make the decorator as general as possible:

```py
import time

def timed_factory(f):
    def timed_f(*args, **kwargs):
        start_time = time.perf_counter()
        result = f(*args, **kwargs)
        end_time = time.perf_counter()
        return result, end_time - start_time

    return timed_f
```

The usage of `*args` and `**kwargs` will be prevalent in your future decorators, so take note of it!
You are also _very_, _very_ close to having all ingredients you need to write _any_ decorator you may want...
You are just missing one little thing.
Let me show you.

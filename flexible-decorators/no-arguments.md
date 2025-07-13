# No arguments

How do you modify the decorator factory `cache_factory` so that it can be used directly as a decorator, with the syntax `@cache_factory`?
Suppose that this is already possible.
In that case, using the decorator looks like this:

```python
@cache_factory
def fn(...):
    ...
```

Again, because the at sign `@` is just syntactic sugar, the code above is the same as

```python
def fn(...):
    ...

fn = cache_factory(fn)
```

So, it looks like the function `fn` is passed into `cache_factory` as the argument `maxsize`!
Therefore, for everything to work without any issues, the decorator factory `cache_factory` must be modified:

 - if the argument `maxsize` is an integer, then `cache_factory` was used as a decorator factory, as it was originally intended; and
 - if the argument `maxsize` is actually a function, then `cache_factory` was used directly as a decorator and the cache factory must produce a cache with the default value for `maxsize`; in a way, you have to skip a step.

Inside `cache_factory`, you can use the built-in `callable` to check whether your argument `maxsize` is callable (which means you accepted a function) or not, and then you can act accordingly.
In terms of code, it looks like this:

```python
def cache_factory(maxsize_or_fn=None):
    def cache(f):
        ...

    if callable(maxsize_or_fn):
        maxsize = None
        return cache(f)
    else:
        return cache
```

If the argument is a function, then the function you want to decorate is in the variable `maxsize_or_fn` and the value for `maxsize` should be restored to the default value of `None`, so you assign `None` to `maxsize` and then return the decorator applied to the function you wish to decorate.

If the argument is not a function, then `cache_factory` was used as a regular cache factory and you're supposed to return the decorator.

Take a moment to get comfortable with this, as it can be pretty mind-bending the first time you see it!

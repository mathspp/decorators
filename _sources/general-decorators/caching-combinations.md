# Caching combinations

The module `itertools` has an iterable called `combinations` that accepts two arguments, an iterable `it` and an integer `r`, and then “return[s] successive r-length combinations of elements in the iterable [`it`]”.

For example, you can use `combinations` to answer this question: if I have a class of 30 students and I need to pick 6 students for a volleyball team, how many different teams could I possibly create?
The correct answer is a staggering 593,775 teams!

The way you compute this with `combinations` is through the following code:

```py
print(
    len(list(combinations(range(30), 6)))
)
```

This was a random hypothetical question that shows how, in some mathematical contexts, you want to know the length of this result produced by `combinations` without caring about the “r-length combinations” that can be produced.
Thus, you can write a function for this:

```py
from itertools import combinations

def combinations_len(n, r):
    return len(list(combinations(range(n), r)))
```

Now, you can get the same result by computing

```py
print(combinations_len(30, 6))
```

Now, you might think “hey, let's add a cache to this function!
You go back to your trusted `cached_factory` and apply it to `combinations_len`:

```py
from itertools import combinations

def cached_factory(f):
    cache = {}
    def cached_f(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]

    return cached_f

@cached_factory
def combinations_len(n, r):
    return len(list(combinations(range(n), r)))
```

This looks great...
But the cached function doesn't work:

```py
print(combinations_len(10, 4))
"""
Traceback (most recent call last):
  File "<python-input-77>", line 1, in <module>
    print(combinations_len(10, 4))
          ~~~~~~~~~~~~~~~~^^^^^^^
TypeError: cached_function_factory.<locals>.cached_f() takes 1 positional argument but 2 were given
"""
```

What the heck is wrong here?
Can you see it?
And how do you fix it?

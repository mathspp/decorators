# `functools.lru_cache`

Your old and trusted caching decorator...
The [decorator `functools.lru_cache`](https://docs.python.org/3/library/functools.html#functools.lru_cache) implements a caching mechanism that may be sized or not.
This might be one of the “easiest” exercises from this section since it's similar to many of the things you've done already...

However, note that the decorator `lru_cache` is capable of handling keyword arguments, and none of the versions of the caching decorator that we used so far could do that:

```py
from functools import lru_cache

@lru_cache
def f(*, a):
    return a + 1

print(f(1))  # 2
```

When you're done with `lru_cache`, don't forget to implement [`functools.cache`](https://docs.python.org/3/library/functools.html#functools.cache) in terms of `functools.lru_cache`.

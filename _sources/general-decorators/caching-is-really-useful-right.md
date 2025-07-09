# Caching is really useful, right?

This decorator `cached_factory` looks really useful, doesn't it?
It is pretty flexible and it can save you a tremendous amount of time in function calls...
And that is why it's actually in the standard library!

The module `functools` contains two caching decorators:

 - `cache`, similar to what you've been developing and improving so far; and
 - `lru_cache`, a cache decorator with a built-in system to manage the cache size.

The decorators from the module `functools` are even better than the one you've developed so far because the decorator `cached_factory` still has some limitations that `functools.cache` and `functools.lru_cache` do not have.
You will understand these limitations, and get rid of them, progressively as you keep working through this course.

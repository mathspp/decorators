# Exercises

For these exercises, you will be writing decorators that take arguments to customise the behaviour of your decorators.
For all exercises, take these points in consideration:

 - try to make the decorator as general as possible (using `*args` and `**kwargs`); and
 - once you've written your decorator, apply it to some other function(s) to convince yourself that it's working.

## `repeat`

Write a general decorator `repeat(n)` that calls the decorated function repeatedly.
The integer argument `n` determines how many times the function is repeated when called.

## `delay`

Write a general decorator `delay(seconds)` that calls the decorated function after a pause.
The float argument `seconds` determines how much time to pause for before calling the function.

## `ensure_type`

Write a general decorator `ensure_type(type_)` that ensures that the return value of the decorated function is an instance of the given type.
If it is not, raise a `RuntimeError`.
The type argument `type_` specifies what is the acceptable output type.

## `bounded_cache`

Write a decorator `bounded_cache(maxsize)` that caches function call results.
The integer argument `maxsize` controls the maximum size of the cache, and your decorator should make sure that the cache never has more than the given number of cached results.
You can assume that the decorator `bounded_cache` will only be used on functions that only accept positional arguments (and no keyword arguments).
You can also assume that the functions only accept hashable arguments (values you can use as dictionary keys), like numbers, Booleans, tuples, and strings.

When the cache has hit the maximum size, you can:

 1. remove a random key/value pair from the cache;
 2. remove the oldest key/value pair from the cache; or
 3. remove the key/value pair that hasn't been used for the longest time.

```{note}
Strategies 2. and 3. are _not_ the same!
```

## `transform`

Write a decorator `transform(fn)` that transforms function results.
The function argument `fn` is an arbitrary function that you should apply to the return value of the decorated function.
For example, `transform(str.upper)` should be the same as [the decorator `scream` from a previous exercise](../general-decorators/exercises.md#scream).

## `suppress`

Write a general decorator `suppress(*exceptions)` that calls the function normally, but if the function raises an error specified in the argument `*exceptions`, the decorated function should return `None` instead.
For example, `@suppress(ValueError, TypeError)` should suppress all value and type errors, but not other types of errors.

## `throttle2`

Write a general decorator `throttle2(timeout)` that prevents you from calling a function too often in quick succession.
The float argument `timeout` defines how much time (in seconds) to wait before allowing another call of the same function.
For example, `throttle2(1)` should be the same as [the decorator `throttle` from a previous exercise](../general-decorators/exercises.md#throttle).

## `timeout`

Write a general decorator `timeout(duration)` that runs the decorated function in a separate thread and cancels it if the function takes too long to run.
The float argument `duration` defines how much time (in seconds) the function can run for before being cancelled.

Tackle this exercise only if you're familiar with threads.
Assume the decorator `timeout` is only applied to nice, thread-safe functions.

## `bounded_cache_strategy`

Tackle this exercise only if you've solved the [previous exercise on the decorator `bounded_cache`](#bounded-cache).

Write a general decorator `bounded_cache_strategy(maxsize, strategy)` that caches function results.
The integer `maxsize` controls the maximum size of the cache and the function `strategy(cache)` controls how to make room in the cache for a new key in case the cache is already full.

The remainder of the problem statement is the same as for [the previous exercise on the decorator `bounded_cache`](#bounded-cache).

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

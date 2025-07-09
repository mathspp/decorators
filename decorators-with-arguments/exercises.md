# Exercises

For these exercises, you will be writing decorators that take arguments to customise the behaviour of your decorators.
For all exercises, take these points in consideration:

 - try to make the decorator as general as possible (using `*args` and `**kwargs`); and
 - once you've written your decorator, apply it to some other function(s) to convince yourself that it's working.

## `bounded_cache`

Write a decorator `bounded_cache(maxsize)` that caches function call results.
The integer argument `maxsize` controls the maximum size of the cache, and your decorator should make sure that the cache never has more than the given number of cached results.
You can assume that the decorator `bounded_cache` will only be used on functions that only accept positional arguments (and no keyword arguments).
You can also assume that the functions only accept hashable arguments (values you can use as dictionary keys), like numbers, booleans, tuples, and strings.

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

## `transform`

Write a decorator `transform(fn)` that transforms function results.
The function argument `fn` is an arbitrary function that you should apply to the return value of the decorated function.
For example, `transform(str.upper)` should be the same as [the decorator `scream` from a previous exercise](../general-decorators/exercises.md#scream).

## `suppress`

Write a general decorator `suppress(*exceptions)` that calls the function normally, but if the function raises an error specified in the argument `*exceptions`, the decorated function should return `None` instead.
For example, `@suppress(ValueError, TypeError)` should suppress all value and type errors, but not other types of errors.

## `throttle2`

Write a general decorator `throttle2(timeout)` that prevents you from calling a function too often in quick succession.
The float argument `timeout` defines how much time to wait before allowing another call of the same function.
For example, `throttle2(1)` should be the same as [the decorator `throttle` from a previous exercise](../general-decorators/exercises.md#throttle).

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

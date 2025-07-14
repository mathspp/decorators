# Exercises

The exercises here are meant to have you write and rewrite decorators following [the decorator blueprint shown before](./decorator-blueprint.md).
For all exercises, take these points in consideration:

 - try to make the decorator as general as possible (using `*args` and `**kwargs`);
 - compare your decorator to the decorator blueprint and take note of the points that you followed and the ones you didn't; and
 - once you've written your decorator, apply it to some other function(s) to convince yourself that it's working.

## `noop`

Write a general decorator `noop` that does absolutely nothing.
It should wrap the original function and preserve its metadata, but other than that, the decorator does nothing.

## `cache`

Write a decorator `cache` that caches function call results, just like the decorator `cached_factory` you have been improving.
You can assume that the decorator `cache` will only be used on functions that only accept positional arguments (and no keyword arguments).
You can also assume that the functions only accept hashable arguments (values you can use as dictionary keys), like numbers, Booleans, tuples, and strings.

## `timer`

Write a general decorator `timer` that times function execution using `time.perf_counter` and that returns that execution time together with the return value of the original function.
This should be similar to the decorator `timed_factory` that showed up already.

## `debug`

Write a general decorator `debug` that prints a function's arguments before calling the function and prints a function's return value after the function returned.
This should be similar to the decorator `logged_factory` that showed up in a previous exercise.

## `scream`

Write a general decorator `scream` that converts string return values into upper case strings.
You can assume the decorator `scream` is only applied to functions that return strings.

## `ensure_non_negative`

Write a general decorator `ensure_non_negative` that takes numeric return values and ensures they are not negative.
If the function returns a negative number, return zero instead, but if the function returns a positive number, leave it unchanged.
You can assume the decorator `ensure_non_negative` is only applied to functions that return numbers.

## `suppress_errors`

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

Write a general decorator `suppress_errors` that calls the function normally, but if the function raises an error, the decorated function should return `None` instead.
In a way, it's as if you're converting exceptions into the value `None`.

## `count_calls`

Write a general decorator `count_calls` that tracks how many times the function has been called (regardless of the specific arguments) and prints that information each time the function is called.

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

## `profiler`

Write a general decorator `profiler` that tracks how much time, in total, has been spent inside of the function.
(It's like [the decorator `timer`](#timer), but it accumulates the total time.)
Each time the function returns, print how much total time has been spent inside that function.

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

## `once`

Write a general decorator `once` that prevents you from calling a function more than once.
In other words, after the function is called once, subsequent calls should do nothing and automatically return `None`.

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

## `throttle`

Write a general decorator `throttle` that prevents you from calling a function too often in quick succession.
After the function is called once, subsequent calls in the following second should do nothing and automatically return `None`.
Once more than a second has elapsed, the next call should work as normal, and then the function is “on pause” for another second again.

To be able to solve this, you may need to [read up on non-local variables](../appendix/non-local-variables.md), a closure-related feature.

## General cache

Can you fix [the decorator `cache` from a previous exercise](#cache) so it works with `kwargs` too, assuming the values themselves are hashable?
It's a fun challenge, to see how general you can make your decorator `cache`, but don't worry _too much_ about it.
The stuff that comes next is more important than having a perfect solution for this exercise.

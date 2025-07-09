# Exercises

For these exercises, write classes to be used as decorators and make sure to provide all the functionality required.

## `bounded_cache`

Write a class decorator `bounded_cache` that provides a cache for the function that is decorated.
Assume the function decorated only accepts positional arguments that are hashable.
The class decorator must provide the following functionality:

 - the attribute `cache` should let the user inspect the cache;
 - the attribute `hits` should count how many times the cache was hit (that is, values from the cache were used);
 - the attribute `misses` should count how many times the cache did not contain the value that was required; and
 - the method `clear_cache` should clear the cache and reset the attributes `hits`/`misses`.

## `profiler`

Write a class decorator `profiler` that keeps track of the time spent inside the decorated function.
The class decorator must provide the following functionality:

 - the attribute `calls` should count how many times the function was called;
 - the attribute `total_time` should keep track of how much time, in total, was spent inside the function;
 - the property `avg_time` should return the average time spent on the function per call; and
 - the method `reset` should reset everything.

## `history`

Write a class decorator `history(maxsize)` that keeps track of the history of values returned by a given function.
The class decorator must provide the following functionality:

 - the argument `maxsize` determines the maximum history size, which should never be exceeded;
 - the attribute `history` should let the user inspect the history as an iterable (doesn't have to be a list);
 - the property `most_recent` should return the most recent return value from that function;
 - the property `oldest` should return the oldest item in the history; and
 - the method `clear_history` should clear the function history.

# `functools.total_ordering`

The [module `functools` provides a decorator `total_ordering`](https://docs.python.org/3/library/functools.html#functools.total_ordering) that makes it less cumbersome to define a class that be used with the comparison operators `==`, `!=`, `<`, `<=`, `>`, and `>=`.

A class decorated with `total_ordering` must define:

 - the dunder method `__eq__`; and
 - one of
   - `__lt__`
   - `__le__`
   - `__gt__`
   - `__ge__`

This decorator is cumbersome to implement but it isn't technically very challenging, provided you know how to work with [dunder methods](https://mathspp.com/blog/pydonts/dunder-methods).

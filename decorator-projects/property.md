# `property`

The [built-in `property`](https://docs.python.org/3/library/functions.html#property) is a very interesting decorator.

`property` is mostly known for allowing you to turn a method into an attribute.
However, if `x` is a property (a method decorated with `@property`), then `x` also provides the decorators `x.getter`, `x.setter`, and `x.deleter`.
You should try to implement this functionality, about which you can read more in the documentation.

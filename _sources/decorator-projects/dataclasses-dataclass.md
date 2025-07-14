# `dataclasses.dataclass`

The [decorator `dataclass` from the module `dataclasses`](https://docs.python.org/3/library/dataclasses.html#dataclasses.dataclass) is the hardest to implement of them all.

The decorator `dataclass` does a _lot_ of different things, so this project is a standing invitation for what is essentially a rewrite of the standard module `dataclasses`.

As a good first exercise, try to create a decorator `dataclass` that just adds the dunder methods `__init__`, `__repr__`, and `__eq__`, to the class decorated by `dataclass`.
Assume the class attributes specified in the data class are all built-in atomic types like Booleans, integers, floats, and strings.

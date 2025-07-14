# Replacing classes

In the context of functions, decorators typically define a wrapper function that is used to replace the original, decorated function.
You will even use `functools.wraps` to make the wrapper look like the original function...
But you still replaced it.

With classes, things are a bit more tricky.
Think about it.
If you write a replacement class, how will you make sure the replacement class has all the same attributes, methods, properties, and other things, that the original class has?
And how do you make it so that the replacement class is part of the same hierarchy as the original class?

Even if it's a very difficult exercise – I genuinely don't know if it's possible, but pretty much everything is possible in Python if you try hard enough... –, give it a try.
Start with small classes and see if you can write a do-nothing decorator that replaces your decorated class with a class that behaves in the same way.
Things can get messy pretty quickly, so decorators for classes usually have a slightly different purpose...

Instead of creating a new class to replace the decorated class, decorators for classes typically _augment_ the original class with new methods, attributes, and more.

Since a class is already a collection of attributes (the data that you care about) and methods (ways to manipulate the data), it makes sense to think of decorators as ways of patching classes with extra functionality.
This is what the most common decorators for classes from the standard library do!

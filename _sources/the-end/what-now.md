# What now?

Holy Python!
Congratulations for making it this far!

## The briefest recap

In this course you learned about a wide range of ways in which decorators can be used and defined, how to make them work with very specific types of functions, or how to write general and flexible decorators that work with all sorts of functions and that accept different arguments.

You've also seen how this concept of “decorator” can interact with classes, both by using classes to write decorators with extra functionality and by writing decorators that augment the classes that you write.

## If you could only remember one thing

If you could only remember _one_ thing from this whole course, let it be the main idea behind decorators, regardless of whether they're functions or classes, for functions or for classes.

The main idea behind decorators is to augment your functions and your classes with useful functionality that is orthogonal to the main objective of the object you are decorating.
You write that functionality in a decorator because that makes it reusable across other objects that need that same functionality.

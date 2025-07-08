# Orthogonality

The core idea behind decorators, and the thing that makes them so useful, is not their syntax.
I think the `@` looks quite cool, but the brilliance of decorators has nothing to do with syntax.

You'll want to write a decorator whenever you think of a feature that:

 - is useful for a function to have; and
 - isn't tied to any function in particular.

Caching is such an example: caching is very useful, and it's useful for very many different functions.
Caching is a feature that is _orthogonal_ to the purpose of the functions you want to add caching to:

 - the function `factorial` computes a mathematical operation; caching is useful and it complements the function nicely, but it has nothing to do with the original purpose of the function;
 - the function `fibonacci` computes another mathematical operation; caching is useful and it complements the function nicely, but it has nothing to do with the original purpose of the function.

Profiling functions and logging functions, [the exercises you did before](../why-decorators-matter/exercises.md), are also features that are useful, but they're also not specific to any one function.
That's what I mean when I talk about _orthogonal behaviours_.

Because caching, profiling, and logging, are features that are orthogonal to the other functions, they can be implemented as separate things (in this case, decorators), and then they can be applied to whatever functions you desire.
Thus, decorators make it easier to write modular, reusable code.

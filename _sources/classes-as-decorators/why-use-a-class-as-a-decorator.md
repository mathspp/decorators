# Why use a class as a decorator?

Just because you _can_ do something, doesn't mean you _should_.
So, _should_ you create decorators based on classes?

The answer is that it depends!
Not always; simpler decorators definitely do not require a class.
But some decorators are better suited as classes.

Remember that the purpose of classes is to organise data (the attributes of the class) and functions that operate on that data (the methods of the class).
If you want to create a decorator that adds a lot of functionality, that decorator might be better suited as a class.

For example, you may want to create a cache decorator that allows you to reset the cache;
or you may want to create a profiling decorator that keeps track of statistics regarding time execution, instead of just the total time.

These things can be achieved with function decorators and a bit of ingenuity, but the code will be more contrived than what is necessary.

All you need is a decorator written as a class...
Now, let us see how to do it!

# Functions inside functions

Another key idea that you need to be very comfortable with is the fact that you can define functions inside other functions.

In the world of mathematics, which is a world that is very dear to me, there is this thing called the [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture).
The Collatz conjecture is a mouthful for something that is very easy to undertand.

Think of a positive integer.
Now,

 - if it's even, divide it by 2; but
 - if it's odd, multiply it by 3 and then add 1.

Done?
Ok, now repeat the step above.

Done?
Ok, now repeat the step above.

And keep going.
The Collatz conjecture says that, _regardless_ of the positive integer you start with, you'll eventually end up at 1.

For example, if you pick the number 4, you go through 4, 2, and then 1.
But if you pick the number 15, it'll be a longer ride: 15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, and finally, 1.

You can write a Python function that accepts a positive integer and then does all of these computations for you.

In the example that is shown below, the function `collatz` will define two inner functions:

 1. `even_step`; and
 2. `odd_step`.

The function `even_step` performs the division by 2 and the function `odd_step` performs the multiplication by 3 and the increment by 1:

```py
def collatz(n):
    def even_step(n):
        return n // 2
    def odd_step(n):
        return 3 * n + 1
    # ...
```

These [functions are objects](./functions-are-objects.md), so you can put them inside a list:

```py
def collatz(n):
    def even_step(n):
        return n // 2
    def odd_step(n):
        return 3 * n + 1

    steps = [even_step, odd_step]

    # ...
```

Now, suppose `n` is even.
If `n` is even, then `n % 2` is `0`, and `steps[0]` is the function that has the step for even numbers.
On the other hand, if `n` is odd, then `n % 2` is `1`, and `steps[1]` is the function that has the step for odd numbers.

This means you can be a little cheeky and finish your function `factorial` with a fun little loop:

```py
def collatz(n):
    def even_step(n):
        return n // 2
    def odd_step(n):
        return 3 * n + 1

    steps = [even_step, odd_step]

    while n != 1:
        print(n)
        n = steps[n % 2](n)
    print(n)
```

This is not the most straightforward way of implementing the function `collatz` and I'm not trying to say it's a good way of implementing it.
_But_ this does flex your brain muscles when it comes to functions being objects and the ability of writing functions inside functions, so make sure you are comfortable with the way `collatz` works before moving on!

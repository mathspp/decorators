# Web server crash

I think the cache decorator you've been working on is great, and that's why I started using it.
I tried using it in a web server I have running and the most curious thing happened...
After a couple of days running without any issues, my web server crashed!

The problem?
The cache grew too big and the server ran out of memory!
That's because the cache is a dictionary that can grow arbitrarily large, and in the case of my long-running web server, the dictionary tried caching too much data.

In case you forgot, here's what the caching decorator looks like, now with a shorter name:

```python
def cache(f):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            cache[args] = f(*args)
        return cache[args]

    return cached_f
```

To fix the memory issue, you can add a maximum size to the cache dictionary, which in this example is set to 1,000:

```{margin}
Yes, this implementation of the cache size limiting is bad.
You'll fix it in an exercise later!
```

```python
def cache(f):
    cache = {}
    def cached_f(*args):
        if args not in cache:
            if len(cache) >= 1000:
                cache.popitem()
            cache[args] = f(*args)
        return cache[args]

    return cached_f
```

This solves the memory problem...
But now all caches have a maximum size of 1,000 items, which is not ideal.
How can you rewrite this properly..?

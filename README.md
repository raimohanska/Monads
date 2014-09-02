# MONADS!

The Monad is a simple and powerful abstraction, yet often
considered complex and hard to understand. I'll discuss monads
from a practical perspective, starting from Javascript examples
and diving into the beautiful world of Haskell. Time permitting,
everyone gets to craft their own Monad in Haskell.

My presentation is [here](http://raimohanska.github.io/Monads).

There are ready [examples](examples/README.md) in Haskell and Javascript.

The assignments for the workshop can be found in the `assignments` directory.

Work hard and have fun!

## Why are Monads useful?

Bunch of Haskell monad examples that came to my mind.

### Real World examples

#### Restricting side-effects on the type level

All side-effects, including variable creation and access, are performed in the IO Monad. 
This allows you to keep your code predictable: you know what functions have side-effects and what don't.

#### Software Transactional Memory / STM

STM is awesome. Haskell STM is even more awesome as you'll get type-level guarantee that your
STM operations are actually reversible.

#### Passing state in the Snap web framework

In the Snap framework, your handler code operates in the Snap Monad. This means that you get implicit
access to request and response state. You can also perform any IO using `liftIO` function (a common practicse
in fact, using the MonadIO typeclass). Unlike ThreadLocals and such, you'll get a type-level guarantee that you
don't accidentally call Snap-dependent code from a "non handler thread". This is of course not the only neat
thing about Snap.

### Imaginary / Potential examples

#### Use monads for Transactions

As in my [haskell-transactional](https://github.com/raimohanska/haskell-transactional) experiment, you can 
use a Monad to deal with database transactions in a really cool way. You'll get type-level guarantee that
code that needs a database connection is only called in a context where such is available. Without passing
the connection around. Commit/rollback is automatic too, of course.

#### Use monads for Async operations

As in my [async](https://github.com/raimohanska/Monads/tree/master/haskell/Async) experiment, you can use
an Async monad (a.k.a Continuation Monad) to wrap any asynchronous operations. Then use the same do-notation
for doing your async stuff as you use for your normal IO code.

There's no way a Haskell dev would use explicit callbacks like we do on Node.js. It's just too easy to abstract away.

#### Use monads to wrap any kind of execution mode

Async, pausable, logging, distributed, transactional, whatnot. Stuff is really easy to wrap into a Monad. 
Abstract away the nasty implementation details and enjoy the beautiful monadic awesomeness.

### General benefits

You can re-use a lot of generic library code on any Monad. You get to use the nice
do-notation that makes complex monadic code much easier to write and read. You know, List and Maybe
are Monads too.

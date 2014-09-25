# MONADS!

The Monad is a simple and powerful abstraction, yet often
considered complex and hard to understand. I'll discuss monads
from a practical perspective and give a hands-on intro to the Haskell language
and typeclasses. Then everyone gets to build some monads in Haskell.

Bring your own Haskell compilers! But don't worry, you can do this online
too: http://www.compileonline.com/compile_haskell_online.php or http://haskellonline.org/

My presentation can be viewed [here](http://raimohanska.github.io/Monads). See [presentation](presentation) 
directory for more details.

There are 4 little excercises we do during the presentation. Solutions to those can be found
[here](examples/exercises).

After the presentation, I'll present you with a bunch of [challenges](challenges). I hope you'll
be able to complete as many as possible. If you need help, want to review your solution or just
lazy, you'll find ready-made solutions [here](examples/challenges).

Other material you might find useful and fun:

- [Monad laws](http://www.haskell.org/haskellwiki/Monad_laws)
- [Functors, Applicatives and Monads in Pictures](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html) by Aditya Bhargava

Work hard and have fun!

## Haskell cheat sheet

- ghci
  - Load source code `:l <filename>`
  - Reload source code `:r (reload)`
  - Type signature of expression `:t map reverse ["bacon", "eggs"]`
  - Info on function `:i map` or on typeclass `:i Monad`
  - Import module `import Control.Applicative`
- [Hoogle](http://www.haskell.org/hoogle/)
  - search by function name: `map` or `>>=`
  - search by type signature: `(a -> b) -> m a -> m b`
- [Learn You a Haskell for Great Good](http://learnyouahaskell.com/chapters)
  - Free book online
  - Order a paper copy!

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

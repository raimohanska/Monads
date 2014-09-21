## Validation Monad

The `Validation` type wraps a value together with a validation result. You can consider
this an extension to the [Try](../../examples/exercises/3_try.hs) example. The major
difference to `Try` is that even in the "invalid" case, the actual value is still passed
through. When multiple validations are combined, the final validation result contains
all validation errors that we've encountered.

For instance you might have

    Validation "this is fine" [] :: Validation [String] String

In this case the validation result is an empty list and thus the string "this is fine"
is wrapped in a successful validation context.

On the other hand
    
    Validation "easy" ["password too short"] :: Validation [String] String

Wraps the password "easy" with an error message. This is considered an invalid validation
context. The `Validation` module provides an `isValid` function for checking whether a
`Validation` object is valid or not.

If you look at the code more closely, you'll find out that the error lists doesn't have to
be a list at all. Any [Monoid](http://en.wikibooks.org/wiki/Haskell/Monoids) will do!

In [Examples.hs](Examples.hs) you can see how you can compose validation code using the
`Applicative` and `Monad` typeclasses.

Your job is to complete the `Monad` instance for `Validation`.

Then you might build another validation example yourself.

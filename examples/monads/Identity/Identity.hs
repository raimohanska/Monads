module Identity where

import Control.Applicative
import Control.Monad

data Identity a = Identity a

instance Monad Identity where
  return = Identity
  Identity x >>= f = f x

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Applicative Identity where
  pure = return
  (<*>) = ap

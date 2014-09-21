module List where

import Control.Applicative
import Control.Monad

data List a = Nil | Cons a (List a)
  deriving (Show, Eq)

instance Functor List where
  fmap = undefined

instance Monad List where
  return x = undefined
  Nil >>= f = undefined
  Cons a rest >>= f = undefined

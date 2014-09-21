module Identity where

import Control.Applicative
import Control.Monad

data Identity a = Identity a
  deriving (Eq, Show)

instance Monad Identity where
  return = undefined
  Identity x >>= f = undefined

instance Functor Identity where
  fmap = undefined

instance Applicative Identity where
  pure = undefined
  (<*>) = undefined

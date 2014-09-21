module List where

import Control.Applicative
import Control.Monad

data List a = Nil | Cons a (List a)
  deriving (Eq)

instance Show a => Show (List a) where
  show Nil = ""
  show (Cons head tail) = show head ++ " " ++ show tail

instance Functor List where
  fmap = undefined

instance Monad List where
  return x = undefined
  Nil >>= f = undefined
  Cons a rest >>= f = undefined

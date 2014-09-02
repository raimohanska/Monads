module List where

--- An alternative List datatype in case you find [] too easy
data List a = Nil | Cons a (List a)
  deriving (Show, Eq)

instance Monad List where
  return x = undefined
  Nil >>= f = undefined
  Cons a rest >>= f = undefined

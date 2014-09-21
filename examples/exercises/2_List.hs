module List where

data List a = Nil | Cons a (List a)
  deriving (Show)

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons head tail) = Cons (f head) (fmap f tail)

plus3 x = x + 3

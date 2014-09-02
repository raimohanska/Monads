module List where

data List a = Nil | Cons a (List a)
  deriving (Show, Eq)

concatL :: List a -> List a -> List a
concatL Nil xs = xs
concatL (Cons x rest) ys = Cons x (concatL rest ys)

instance Monad List where
  return x = Cons x Nil
  Nil >>= f = Nil
  Cons a rest >>= f = concatL (f a) (rest >>= f)

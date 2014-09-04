module List where

import Prelude hiding (concat)

--- An alternative List datatype in case you find [] too easy
data List a = Nil | Cons a (List a)
  deriving (Show, Eq)

instance Monad List where
  return x = Cons x Nil
  (>>=) = flatMap

flatMap :: List a -> (a -> List b) -> List b
flatMap Nil _ = Nil
flatMap (Cons head tail) f = concat (f head) (flatMap tail f)

concat :: List a -> List a -> List a
concat Nil xs = xs
concat (Cons y ys) xs = Cons y (concat ys xs) 

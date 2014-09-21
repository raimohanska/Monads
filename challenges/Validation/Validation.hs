module Validation(Validation, valid, invalid) where

import Control.Applicative
import Control.Monad
import Data.Monoid

data Validation e a = Validation a e

valid :: Monoid e => a -> Validation e a
valid x = Validation x mempty

invalid :: Monoid e => a -> e -> Validation e a
invalid x error = Validation x error

isValid :: (Eq e, Monoid e) => Validation e a -> Bool
isValid (Validation a e) = e == mempty

instance (Show a, Show e, Monoid e, Eq e) => Show (Validation e a) where
  show v@(Validation a e) | isValid v = "OK " ++ show a
                          | otherwise = "INVALID " ++ show a ++ "(" ++ show e ++")"

instance (Monoid e) => Monad (Validation e) where
  return = undefined
  (Validation a errors) >>= f = undefined

instance (Monoid e) => Functor (Validation e) where
  fmap = liftM

instance (Monoid e) => Applicative (Validation e) where
  pure = return
  (<*>) = ap

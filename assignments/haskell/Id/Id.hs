module ID where

--- The simplest monad, just wraps a value
data Id a = Id a

instance Monad Id where
  return = Id 
  Id x >>= f = f x

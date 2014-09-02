module ID where

--- The simplest monad, just wraps a value
data Id a = Id a

instance Monad Id where
  return = undefined
  Id x >>= f = undefined

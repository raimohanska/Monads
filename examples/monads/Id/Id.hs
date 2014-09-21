module ID where

data Id a = Id a

instance Monad Id where
  return = Id
  Id x >>= f = f x

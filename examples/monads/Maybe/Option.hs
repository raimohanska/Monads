module Option where

data Option a = None | Some a
  deriving (Show, Eq)

instance Monad Option where
  return = Some
  None >>= f = None
  Some x >>= f = f x

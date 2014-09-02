module Option where

--- A more scalaish alternative to Prelude.Maybe
data Option a = None | Some a
  deriving (Show, Eq)

instance Monad Option where
  return = undefined
  None >>= f = undefined
  Some x >>= f = undefined

import Control.Monad
import Control.Applicative 

data Try a = Fail String | Ok a
  deriving (Eq, Show)

instance Monad Try where
  Ok x >>= f = undefined
  (Fail e) >>= f = undefined
  return x = undefined

instance Functor Try where
  fmap = undefined

instance Applicative Try where
  (<*>) = ap
  pure = return


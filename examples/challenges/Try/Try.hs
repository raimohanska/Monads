import Control.Monad
import Control.Applicative 

data Try a = Fail String | Ok a
  deriving (Eq, Show)

instance Monad Try where
  Ok x >>= f = f x
  (Fail e) >>= f = Fail e
  return = Ok

instance Functor Try where
  fmap = liftM

instance Applicative Try where
  (<*>) = ap
  pure = return

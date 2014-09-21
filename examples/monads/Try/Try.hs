import Control.Monad
import Control.Applicative 

data Try a = Fail String | Ok a
  deriving (Show)

instance Monad Try where
  Ok a >>= f = f a
  (Fail e) >>= f = Fail e
  return = Ok

instance Functor Try where
  fmap = liftM

instance Applicative Try where
  (<*>) = ap
  pure = return

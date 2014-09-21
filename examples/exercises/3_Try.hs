import Control.Monad
import Control.Applicative 

data Try a = Fail String | Ok a
  deriving (Show)

half x = if even x
           then Ok (x `div` 2)
           else Fail "odd"

plus3 x = x + 3

instance Monad Try where
  Ok a >>= f = f a
  (Fail e) >>= f = Fail e
  return = Ok


instance Functor Try where
  fmap = liftM

instance Applicative Try where
  (<*>) = ap
  pure = return

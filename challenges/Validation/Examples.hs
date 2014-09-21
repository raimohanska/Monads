import Validation
import Control.Applicative
import Control.Monad

validate desc pred input = if (pred input) then valid input else invalid input [desc]

minLength desc min = validate desc $ (>= min) . length
maxLength desc max = validate desc $ (<= max) . length

validatePassword = minLength "password too short" 6
validateUsername = minLength "username too short" 6 >=> 
                   maxLength "username too long" 12

data Account = Account { username :: String, password :: String }
  deriving (Eq, Show)

validateAccount :: String -> String -> Validation [String] Account
validateAccount user pass = Account <$> validateUsername user<*> validatePassword pass 

main = do
  -- simple stuff
  print $ (valid "Good stuff" :: Validation [String] String)
  print $ invalid "Bad stuff" ["this stuff just sucks"]
  -- monadic stuff
  print $ validateAccount "raimo" "easy"
  print $ validateAccount "raimo" "secret"
  print $ validateAccount "raimohanska" "secret"

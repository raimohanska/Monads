import Validation
import Control.Applicative
import Control.Monad

validate desc pred input = if (pred input) then valid input else invalid input [desc]

minLength desc min = validate desc (\input -> length input >= min)
maxLength desc max = validate desc (\input -> length input <= max)

validatePassword = minLength "password too short" 6
validateUsername = minLength "username too short" 6 >=> 
                   maxLength "username too long" 12

-- validate using Applicative
validateAccount user pass = (,) <$> validateUsername user<*> validatePassword pass 

-- validate using Monad
validateMonadic :: String -> String -> Validation [String] (String, String)
validateMonadic user pass = do
  validateUsername user
  validatePassword pass
  return (user, pass)

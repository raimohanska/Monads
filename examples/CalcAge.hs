import Control.Monad
import Control.Applicative
import Text.Read

calcAge :: Int -> Int
calcAge y = 2014 - y

main = do 
  putStrLn "Year of birth?"
  line <- getLine 
  let age = calcAge <$> (readMaybe line)
  case age of
    Just age | age < 120 -> putStrLn ("You're " ++ (show age) ++ " years old")
    _ -> putStrLn "smartass"

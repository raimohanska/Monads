main = do 
  putStrLn "Year of birth?"
  yob <- readLn 
  let age = 2014 - yob
  putStrLn $ "You're " ++ (show age) ++ " years old"

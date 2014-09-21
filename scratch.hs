main = do
  putStrLn "Hello, what's ur naem?"
  name <- getLine 
  putStrLn $ "Hello, " ++ name

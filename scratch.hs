main :: IO ()
main = do
  putStrLn "Birth year, plx"
  year <- fmap read getLine
  let age = 2014 - year
  putStrLn $ "you're " ++ (show age) ++ " years old"

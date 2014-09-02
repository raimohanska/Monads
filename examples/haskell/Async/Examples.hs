import Async

printAsync input = Async $ \callback -> putStrLn input >> callback ()
readAsync = liftIO getLine

hello = runAsync $ do
  printAsync "name, please"
  name <- readAsync
  printAsync ("hello, " ++ name)

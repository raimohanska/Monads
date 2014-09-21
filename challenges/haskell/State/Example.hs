import State

main = print $ evalState 0 $ do
  sequence $ take 10 $ repeat increment
  get

increment = do
  val <- get
  put $ val + 1

import State

-- Should print "10"
-- Runs incrementByTen given the initial state of 0
main = print $ evalState 0 incrementByTen
 
incrementByTen = do
  -- increment state 10 times
  times 10 increment
  -- return state
  get

times :: Monad m => t -> m a -> m [a]
times n action = sequence $ take 10 $ repeat action

-- operation in the state monad
-- increments the state by 1
increment = do
  val <- get
  put $ val + 1

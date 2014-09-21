import State
import Control.Monad

-- Should print "6"
-- Calculates the sum of numbers using State monad
main = print $ evalState 0 (statefulSum [1,2,3])
 
statefulSum xs = do
  forM_ xs $ \x -> do
    sum <- get
    put (sum + x)
  get

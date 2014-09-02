module State where

-- A simplistic State monad.
-- allows you to access a single state variable
-- See Example.hs
data State s a = State (s -> (s, a))

runState :: s -> State s a -> (s, a)
runState init (State action) = action init

evalState :: s -> State s a -> a
evalState init = snd . runState init

put :: s -> State s ()
put x = State $ \_ -> (x, ())

get :: State s s
get = State $ \x -> (x, x)

instance Monad (State s) where
  return x = undefined
  a1 >>= f = undefined

module State where

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
  return x = State $ \s0 -> 
    (s0, x)
  a1 >>= f = State $ \s0 ->
    let (s1, v1) = runState s0 a1
    in runState s1 (f v1)

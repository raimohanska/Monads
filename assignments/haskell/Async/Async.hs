module Async where

type Callback a = (a -> IO ())

data Async a = Async { run :: (Callback a -> IO ()) }

--- utility for wrapping an IO operation as Async operation
liftIO :: IO a -> Async a
liftIO = Async . (>>=)

--- this is how you might actually run an Async task
runAsync :: Async () -> IO ()
runAsync (Async f) = f (const (return ()))

example = liftIO (putStrLn "LOL")

instance Monad Async where
  first >>= f = undefined
  return x = undefined

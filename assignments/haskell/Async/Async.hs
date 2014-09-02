module Async where

type Callback a = (a -> IO ())

data Async a = Async { run :: (Callback a -> IO ()) }

--- utility for wrapping an IO operation as Async operation
liftIO :: IO a -> Async a
liftIO = undefined

--- this is how you might actually run an Async task
runAsync :: Async a -> IO ()
runAsync = undefined

instance Monad Async where
  first >>= f = undefined
  return x = undefined

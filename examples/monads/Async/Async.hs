module Async where

import Control.Concurrent.MVar
import Control.Concurrent(forkIO)
import Control.Concurrent.MVar
import Control.Applicative

type Callback a = (a -> IO ())

data Async a = Async { run :: (Callback a -> IO ()) }

liftIO :: IO a -> Async a
liftIO io = Async $ \callback -> (forkIO $ io >>= callback) >> return ()

runMVar :: Async a -> IO (MVar a)
runMVar (Async async) = do
  value <- newEmptyMVar
  async $ putMVar value
  return value

runAsync :: Async a -> IO ()
runAsync (Async async) = async (\value -> return ())

runSync :: Async a -> IO a
runSync (Async async) = do
  result <- newEmptyMVar
  async (putMVar result)
  takeMVar result

chain :: Async a -> (a -> Async b) -> Async b
chain first f = Async (\callback ->
  run first (\value -> 
    run (f value) callback))

instance Monad Async where
  return x = Async (\callback -> callback x)
  (>>=) = chain

instance Functor Async where
  fmap f async = async >>= return . f

instance Applicative Async where
  pure = return
  af <*> ax = Async $ \callback -> do
    vx <- runMVar ax
    vf <- runMVar af
    x <- takeMVar vx
    f <- takeMVar vf
    callback $ f x

{-# LANGUAGE OverloadedStrings #-}
import Network.Http.Client as HTTP
import qualified Data.ByteString as S
import qualified Data.ByteString.UTF8 as UTF8
import Control.Concurrent(forkIO)
import Control.Applicative
import Data.Time.Clock
import Async

main = do
  timed $ runSync $ fetchApplicative
  timed $ runSync $ fetchMonadic

fetch = httpGetAsync "http://www.bbc.co.uk/news/"

fetchApplicative = do
  liftIO $ putStrLn "Fetching in parallel using Applicative"
  news <- (++) <$> fetch <*> fetch
  report news

fetchMonadic = do
  liftIO $ putStrLn "Fetching sequentially using Monad"
  news1 <- fetch
  news2 <- fetch
  let news = news1 ++ news2
  report news

report body = liftIO $ putStrLn $ "length: " ++ (show (length body))

httpGetAsync url = liftIO $ httpGetString url

httpGetString url =  do
  body <- HTTP.get url HTTP.concatHandler
  return $ UTF8.toString body

timed :: IO () -> IO ()
timed op = do
  now <- time
  op
  now2 <- time
  putStrLn $ "elapsed: " ++ (show (now2 - now))
 where time = getCurrentTime >>= return . utctDayTime

data Tweet = Tweet String

isCool (Tweet content) = (length content) < 10

getTweets = return $ map Tweet ["hello world", "pow"]

retweet1 (Tweet content) = putStrLn $ "RT : " ++ content

retweet tweets = mapM_ retweet1 tweets

retweetCool = do
  tweets <- getTweets
  let coolTweets = filter isCool tweets
  retweet coolTweets

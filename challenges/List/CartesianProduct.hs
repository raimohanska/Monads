import List

nums = Cons 1 $ Cons 2 $ Cons 3 Nil

-- Should print "1 2 3 2 4 6 3 6 9" 

main = print $ do
  x <- nums
  y <- nums
  return (x * y)

import System.Environment

chars :: String
chars = " ▏▎▍▌▋▊▉█"

cap :: Integral a => a -> a -> a
cap x n
  | x <= n    = x
  | otherwise = n

bar :: RealFrac a => Int -> a -> String
bar len perc =
  bar_helper len perc step ++ "▏"
  where step = 100 / 8 / (fromIntegral len)

bar_helper :: RealFrac a => Int -> a -> a -> [Char]
bar_helper 0 _prec _step = ""

bar_helper len perc step =
  let block = cap (floor (perc / step)) 8
      perc_new = perc - (step * (fromIntegral block))
  in [chars !! block] ++ (bar_helper (len - 1) perc_new step)

main :: IO()
main = do
  args <- getArgs
  putStrLn $ bar (read (args !! 0) :: Int) (read (args !! 1) :: Float)

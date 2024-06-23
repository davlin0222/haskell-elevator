module Main (main) where

import DrawElevator

main :: IO ()
main = do
  putStrLn ""
  mapM_ putStrLn $ drawElevator 2

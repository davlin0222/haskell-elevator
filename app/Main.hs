module Main (main) where

import RenderElevator

main :: IO ()
main = do
  putStrLn ""
  mapM_ putStrLn $ renderElevator 2

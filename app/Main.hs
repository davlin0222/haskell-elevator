module Main (main) where

import Lib

main :: IO ()
main = do
	putStrLn ""
	mapM_ putStrLn $ drawFloor 3
	mapM_ putStrLn $ drawFloor 2
	mapM_ putStrLn $ drawFloor 1

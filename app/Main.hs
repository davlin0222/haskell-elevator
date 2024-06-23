module Main (main) where

import Lib

main :: IO ()
main = do
	putStrLn ""
	mapM_ putStrLn $ drawElevator 3

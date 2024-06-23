module Main (main) where

drawFloor floorNumber =
	[
	"          |   | " ++ show floorNumber,
	"__________|   |"
	]

main :: IO ()
main = do
	putStrLn ""
	mapM_ putStrLn $ drawFloor 3
	mapM_ putStrLn $ drawFloor 2
	mapM_ putStrLn $ drawFloor 1

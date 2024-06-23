module Main (main) where

drawFloor floorNumber =
	[
	"          |   | 3",
	"__________|   |"
	]

main :: IO ()
main = do
	mapM_ putStrLn $ drawFloor 1

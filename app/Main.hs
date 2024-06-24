module Main (main) where

data Elevator = Elevator {name :: String} deriving (Show)

main :: IO ()
main = do
  putStrLn ""
  putStrLn $ renderElevator elevator
  where
    renderElevator elevator = show elevator
    elevator = Elevator {name = "Hi"}

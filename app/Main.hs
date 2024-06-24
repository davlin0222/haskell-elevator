module Main (main) where

data Elevator = Elevator {name :: String}

main :: IO ()
main = do
  putStrLn ""
  putStrLn $ renderElevator elevator
  where
    renderElevator elevator =
      "Name: " ++ name elevator
    elevator = Elevator {name = "Hi"}

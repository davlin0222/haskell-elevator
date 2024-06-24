module Main (main) where

data Elevator = Elevator {numOfFloors :: Int}

main :: IO ()
main = do
  putStrLn ""
  putStrLn $ renderElevator elevator
  where
    renderElevator elevator =
      "NumOfFloors: " ++ (show $ numOfFloors elevator)
    elevator = Elevator {numOfFloors = 3}

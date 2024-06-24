module Main (main) where

-- import Debug.Trace (traceShow)

data Elevator = Elevator {numOfFloors :: Int}

renderElevator :: Elevator -> String
renderElevator elevator =
  concat renderFloors
    where
      renderFloors = map renderFloor (reverse [1..numOfFloors elevator])
      renderFloor floorNumber = unlines [
          "     |   | " ++ show floorNumber,
          "_____|   |"
        ]

main :: IO ()
main = do
  putStrLn ""
  putStrLn $ renderElevator elevator
  where
    elevator = Elevator {numOfFloors = 3}

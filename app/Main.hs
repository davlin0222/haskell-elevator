module Main (main) where

-- import Debug.Trace (traceShow)

data Elevator = Elevator {numOfFloors :: Int, cabFloorPosition :: Int}

renderElevator :: Elevator -> String
renderElevator elevator =
    unlines renderFloors
    where
      renderFloors = concatMap renderFloor (reverse [1..numOfFloors elevator])
      renderFloor floorNumber
        | cabFloorPosition elevator == floorNumber || cabFloorPosition elevator + 1 == floorNumber =
          [
            "     |   | " ++ show floorNumber,
            "_____|___| "
          ]
        | otherwise =
          [
            "     |   | " ++ show floorNumber,
            "_____|   | "
          ]

main :: IO ()
main = do
  putStrLn ""
  putStrLn $ renderElevator elevator
  putStrLn "Move elevetor to floor number:"
  newFloorNumber <- readLn :: IO Int
  putStrLn $ "New floor number: " ++ show newFloorNumber
  where
    elevator = Elevator {numOfFloors = 3, cabFloorPosition = 3}

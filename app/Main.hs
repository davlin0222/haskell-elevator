module Main (main) where

-- import Debug.Trace (traceShow)
import Text.Read (readMaybe)  -- Import readMaybe explicitly from Text.Read

data Elevator = Elevator {numOfFloors :: Int, cabFloorPosition :: Int}

main :: IO ()
main = do
  putStrLn "Elevator control system starting..."
  let initialElevator = Elevator { numOfFloors = 3, cabFloorPosition = 1 }
  controlLoop initialElevator

controlLoop :: Elevator -> IO ()
controlLoop elevator = do
  putStrLn $ renderElevator elevator
  newFloorNumber <- promptFloorNumber
  let updatedElevator = moveElevator elevator newFloorNumber
  controlLoop updatedElevator

promptFloorNumber :: IO Int
promptFloorNumber = do
  putStrLn "Move elevator to floor number:"
  input <- getLine
  case readMaybe input of
    Just floorNum | isValidFloor floorNum -> return floorNum
    _ -> do
      putStrLn "Invalid input. Please enter a valid floor number."
      promptFloorNumber

  -- putStrLn "Move elevator to floor number:"
  -- newFloorNumber <- readLn :: IO Int
  -- putStrLn $ "New floor number: " ++ show newFloorNumber
  -- putStrLn $ renderElevator updatedElevator

isValidFloor :: Int -> Bool
isValidFloor floor = floor >= 1

moveElevator :: Elevator -> Int -> Elevator
moveElevator e newFloor
  | newFloor > numOfFloors e = e { cabFloorPosition = numOfFloors e }
  | newFloor < 1             = e { cabFloorPosition = 1 }
  | otherwise                = e { cabFloorPosition = newFloor }

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

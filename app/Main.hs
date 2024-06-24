module Main (main) where

-- import Debug.Trace (traceShow)
import Text.Read (readMaybe)  -- Import readMaybe explicitly from Text.Read

data ElevatorState = ElevatorState {cabFloor :: Int}
data Elevator = Elevator {topFloor :: Int, state :: ElevatorState}

main :: IO ()
main = do
  putStrLn "Elevator control system starting..."
  let initialElevator = Elevator { topFloor = 3, state = ElevatorState { cabFloor = 1 } }
  controlLoop initialElevator

controlLoop :: Elevator -> IO ()
controlLoop elevator = do
  putStrLn "\ESC[2J\ESC[H"
  putStrLn $ renderElevator elevator
  newFloorNumber <- promptFloorNumber
  let updatedElevator = moveElevator elevator newFloorNumber
  controlLoop updatedElevator
  where
    promptFloorNumber :: IO Int
    promptFloorNumber = do
      putStrLn "Move elevator to floor number:"
      input <- getLine
      case readMaybe input of
        Just floorNum | (isValidFloor $ topFloor elevator) floorNum -> return floorNum
        _ -> do
          putStrLn "Invalid input. Please enter a valid floor number."
          promptFloorNumber

isValidFloor :: Int -> Int -> Bool
isValidFloor topFloor floorNumber = floorNumber >= 1 && floorNumber <= topFloor

moveElevator :: Elevator -> Int -> Elevator
moveElevator elevator newFloor
  | newFloor > topFloor elevator =
      elevator { state = (state elevator) { cabFloor = topFloor elevator } }
  | newFloor < 1 =
      elevator { state = (state elevator) { cabFloor = 1 } }
  | otherwise =
      elevator { state = (state elevator) { cabFloor = newFloor } }


renderElevator :: Elevator -> String
renderElevator elevator =
	unlines renderFloors
	where
		renderFloors = concatMap renderFloor (reverse [1..topFloor elevator])
		renderFloor floorNumber
			| cabFloor (state elevator) == floorNumber || cabFloor (state elevator) + 1 == floorNumber =
				[
					"     |   | " ++ show floorNumber,
					"_____|___| "
				]
			| otherwise =
				[
					"     |   | " ++ show floorNumber,
					"_____|   | "
				]

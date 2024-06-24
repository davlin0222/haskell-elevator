module Main (main) where

-- import Debug.Trace (traceShow)
import Text.Read (readMaybe)  -- Import readMaybe explicitly from Text.Read

data ElevatorState = ElevatorState {cabFloor :: Int}
data Elevator = Elevator {topFloor :: Int, state :: ElevatorState}

main :: IO ()
main = do
  putStrLn "Elevator control system starting..."
  let initialElevator = Elevator { topFloor = 3, state = ElevatorState { cabFloor = 1 } }
  renderLoop initialElevator

clearTerminal :: IO ()
clearTerminal = putStrLn "\ESC[2J\ESC[H"

renderLoop :: Elevator -> IO ()
renderLoop elevator = do
  clearTerminal
  putStrLn $ renderElevator elevator
  newFloorNumber <- promptFloorNumber elevator
  let updatedElevator = moveElevator elevator newFloorNumber
  renderLoop updatedElevator

promptFloorNumber :: Elevator -> IO Int
promptFloorNumber elevator = do
  putStrLn "Move elevator to floor number:"
  input <- getLine
  handleInput elevator input

handleInput :: Elevator -> String -> IO Int
handleInput elevator input =
  case readMaybe input of
    Just floorNumber ->
      if isValidFloor elevator floorNumber
        then return floorNumber
        else retryPrompt
    _ -> retryPrompt
  where
    retryPrompt :: IO Int
    retryPrompt = do
      putStrLn "Invalid input. Please enter a valid floor number."
      promptFloorNumber elevator

isValidFloor :: Elevator -> Int -> Bool
isValidFloor elevator floorNumber = floorNumber >= 1 && floorNumber <= topFloor elevator

moveElevator :: Elevator -> Int -> Elevator
moveElevator elevator newFloor =
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

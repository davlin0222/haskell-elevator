module Lib
    (
      drawFloor,
      drawElevator
    ) where

drawFloor :: Int -> [String]
drawFloor floorNumber =
  [
  "          |   | " ++ show floorNumber,
  "__________|   |"
  ]

drawElevator :: Int -> [String]
drawElevator topFloor = concatMap drawFloor $ reverse [1..topFloor]

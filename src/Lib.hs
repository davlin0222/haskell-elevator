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

drawTop :: [String]
drawTop =
  [
    "          _____",
    "__________|   |"
  ]

drawBottom :: [String]
drawBottom =
  [
    "------------------"
  ]

drawElevator :: Int -> [String]
drawElevator topFloor =
  drawTop ++
  concatMap drawFloor (reverse [1..topFloor]) ++
  drawBottom

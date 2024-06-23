module Lib
    (
      drawFloor,
      drawElevator
    ) where

drawTop :: [String]
drawTop =
  [
    "          _____",
    "__________|   |"
  ]

drawFloor :: Bool -> Int -> [String]
drawFloor hasElevator floorNumber
  | hasElevator =
      [
      "          |   | " ++ show floorNumber,
      "__________|___|"
      ]
  | otherwise =
      [
      "          |   | " ++ show floorNumber,
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
  middle ++
  drawBottom
    where
      middle = concatMap (drawFloor False) list
      list = (reverse [1..topFloor])

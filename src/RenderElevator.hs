module RenderElevator
    (
      renderFloor,
      renderElevator
    ) where

renderTop :: [String]
renderTop =
  [
    "          _____",
    "__________|   |"
  ]

renderFloor :: Bool -> Int -> [String]
renderFloor hasElevator floorNumber
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

renderBottom :: [String]
renderBottom =
  [
    "------------------"
  ]

renderElevator :: Int -> [String]
renderElevator topFloor =
  renderTop ++
  middle ++
  renderBottom
    where
      middle = concatMap (renderFloor False) list
      list = (reverse [1..topFloor])

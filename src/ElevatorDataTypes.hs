module ElevatorDataTypes
    (
			FloorPosition(..)
    ) where

data FloorPosition = FloorPosition { topLine :: Int, bottomLine :: Int }

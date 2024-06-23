module ElevatorDataTypes
    (
			ElevatorFloorPosition(..)
    ) where

data ElevatorFloorPosition =
	ElevatorFloorPosition
	{
		topLine :: Int,
		bottomLine :: Int
	}

module ElevatorDataTypes
    (
			ElevatorFloorPosition(..),
			ElevatorFloor(..)
    ) where

data ElevatorFloorPosition =
	ElevatorFloorPosition
	{
		topLine :: Int,
		bottomLine :: Int
	}

data ElevatorFloor =
	ElevatorFloor
	{
		floorPosition :: ElevatorFloorPosition,
		floorNumber :: Int
	}

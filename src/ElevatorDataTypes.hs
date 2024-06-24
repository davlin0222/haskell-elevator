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

data Elevator =
	Elevator
	{
		floors :: [ElevatorFloor],
		cabPosition :: ElevatorFloorPosition
	}

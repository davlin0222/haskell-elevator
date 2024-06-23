module Lib
    ( drawFloor
    ) where

drawFloor :: Int -> [String]
drawFloor floorNumber =
	[
	"          |   | " ++ show floorNumber,
	"__________|   |"
	]

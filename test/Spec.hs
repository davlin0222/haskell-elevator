module Main (main) where

import Test.Hspec
import DrawElevator
import ElevatorDataTypes

specDrawElevator :: Spec
specDrawElevator = do
  describe "drawFloor" $ do
    it "should have the right floor number" $
      (head $ drawFloor False 2) `shouldEndWith` "2"
    it "should have an elevator floor in it if true" $
      ((drawFloor True 2) !! 1) `shouldBe` "__________|___|"
  describe "drawElevator" $ do
    it "should have the right top floor number" $
      (head $ drop 2 $ drawElevator 3) `shouldEndWith` "3"
    it "2 floors should have 7 lines" $
      (length (drawElevator 2)) `shouldSatisfy` (== 7)
    -- it "should have elevator car top" $
    --   ((drawElevator 2) !! 3) `shouldBe` "__________|___|"

specDataTypes :: Spec
specDataTypes = do
  describe "Floor" $ do
    it "should create FloorPosition with given topLine and bottomLine" $
      let currentFloor = FloorPosition { topLine = 3, bottomLine = 4 }
      in (topLine currentFloor, bottomLine currentFloor) `shouldBe` (3, 4)

main :: IO ()
main = hspec $ sequence_ [specDrawElevator, specDataTypes]

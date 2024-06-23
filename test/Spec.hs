module Main (main) where

import Test.Hspec
import RenderElevator
import ElevatorDataTypes

specRenderElevator :: Spec
specRenderElevator = do
  describe "renderFloor" $ do
    it "should have the right floor number" $
      (head $ renderFloor False 2) `shouldEndWith` "2"
    it "should have an elevator floor in it if true" $
      ((renderFloor True 2) !! 1) `shouldBe` "__________|___|"
  describe "RenderElevator" $ do
    it "should have the right top floor number" $
      (head $ drop 2 $ renderElevator 3) `shouldEndWith` "3"
    it "2 floors should have 7 lines" $
      (length (renderElevator 2)) `shouldSatisfy` (== 7)
    -- it "should have elevator car top" $
    --   ((RenderElevator 2) !! 3) `shouldBe` "__________|___|"

specDataTypes :: Spec
specDataTypes = do
  describe "Floor" $ do
    it "should create ElevatorFloorPosition with given topLine and bottomLine" $
      let elevatorFloor = ElevatorFloorPosition { topLine = 3, bottomLine = 4 }
      in (topLine elevatorFloor, bottomLine elevatorFloor) `shouldBe` (3, 4)

main :: IO ()
main = hspec $ sequence_ [specRenderElevator, specDataTypes]

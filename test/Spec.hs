module Main (main) where

import Test.Hspec
import DrawElevator

specs :: Spec
specs = do
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

main :: IO ()
main = hspec specs

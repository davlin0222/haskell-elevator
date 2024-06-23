module Main (main) where

import Test.Hspec
import Lib

specs :: Spec
specs = do
  describe "drawFloor" $ do
    it "should have the right floor number" $
      (head $ drawFloor 2) `shouldEndWith` "2"
  describe "drawElevator" $ do
    it "should have the right top floor number" $
      (head $ drawElevator 3) `shouldEndWith` "3"
    it "3 floors should have 4 or more lines" $
      (length (drawElevator 3)) `shouldSatisfy` (>= 4)

main :: IO ()
main = hspec specs

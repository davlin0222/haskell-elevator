module Main (main) where

import Test.Hspec
import Lib
-- import Debug.Trace (traceShow)

specs :: Spec
specs = do
  describe "drawFloor" $ do
    it "should have the right floor number" $
      (head $ drawFloor 2) `shouldEndWith` "2"
  describe "drawElevator" $ do
    it "should have the right top floor number" $
      (head $ drop 2 $ drawElevator 3) `shouldEndWith` "3"
    it "2 floors should have 7 lines" $
      (length (drawElevator 2)) `shouldSatisfy` (== 7)

main :: IO ()
main = hspec specs

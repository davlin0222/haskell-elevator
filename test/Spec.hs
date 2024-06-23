module Main (main) where

import Test.Hspec
import Lib

specs :: Spec
specs = do
  describe "drawFloor" $ do
    it "should return a string" $
      drawFloor 1 `shouldBe` ["Hello World"]

main :: IO ()
main = hspec specs

module Main (main) where

import Test.Hspec
import Lib

specs :: Spec
specs = do
  describe "drawFloor" $ do
    it "should return a non empty string" $
      drawFloor 1 `shouldSatisfy` ((>1) . length)

main :: IO ()
main = hspec specs

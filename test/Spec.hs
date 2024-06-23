module Main (main) where

import Test.Hspec
import Lib

specs :: Spec
specs = do
  describe "drawFloor" $ do
    it "should have the right floor number" $
      (head $ drawFloor 2) `shouldEndWith` "2"

main :: IO ()
main = hspec specs

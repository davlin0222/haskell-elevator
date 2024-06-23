import Test.Hspec

specs :: Spec
specs = do
  describe "Example Test Suite" $ do
    it "should add two numbers correctly" $
      (1 + 1) `shouldBe` 2

    it "should concatenate two strings" $
      ("hello" ++ " " ++ "world") `shouldBe` "hello world"

main :: IO ()
main = hspec specs

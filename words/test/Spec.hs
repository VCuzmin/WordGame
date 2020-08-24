import Test.Hspec
import Lib
import Data.Maybe

main :: IO ()
main = hspec $ do 
    describe "formatGrid" $ do
        it "Should concatenate every line witha newline" $ do
            (formatGrid ["abc","def"]) `shouldBe` "abc\ndef\n"

    describe "findWords" $ do
        it "Should find words that exist on the Grid" $ do
            findWord grid "HASKELL" `shouldBe` Just "HASKELL"
            findWord grid "PERL" `shouldBe` Just "PERL"


-- the same as:

-- main = hspec ( do 
--     describe "How to write a test" ( do
--         it "Should be able to run tests" ( do
--             someFunc `shouldBe` "someFunc")))
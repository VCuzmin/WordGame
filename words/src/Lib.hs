module Lib
  ( someFunc,
    someString,
    languages,
    formatGrid,
    outputGrid,
    findWord,
    findWordInLine,
    findWords,
    grid,
  )
where

import Data.List (isInfixOf)
import Data.Maybe (catMaybes)

type Grid = [String]

someFunc :: IO ()
someFunc = putStrLn someString

outputGrid :: [String] -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

--or
outputGrid' :: [String] -> IO () -- using point-free style
outputGrid' = putStrLn . formatGrid

formatGrid :: [String] -> String
formatGrid = unlines

findWord :: Grid -> String -> Maybe String
findWord grid word =
  let lines = grid ++ (map reverse grid)
      found = or (map (findWordInLine word) lines)
      in 
        if found then Just word 
        else Nothing

--or
findWord' :: Grid -> String -> Maybe String -- with $ operator instead of parathensis
findWord' grid word =
  let lines = grid ++ (map reverse grid)
      found = or $map (findWordInLine word) lines
       in 
        if found then Just word 
        else Nothing

findWords :: [String] -> [String] -> [String]
findWords grid words = 
  let foundWords = map (findWord grid) words
    in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine word line = word `isInfixOf` line --or isInfixOf word line
--OR

findWordInLine' :: String -> String -> Bool -- using point-free style
findWordInLine' = isInfixOf

someString :: String
someString = "someString"

grid :: [[Char]]
grid =
  [ "__C________R___",
    "__SI________U__",
    "__HASKELL____B_",
    "__A__A_____S__Y",
    "__R___B___C____",
    "__PHP____H_____",
    "____S_LREP_____",
    "____I__M_Y__L__",
    "____L_E__T_O___",
    "_________HB____",
    "_________O_____",
    "________CN_____"
  ]

languages :: [[Char]]
languages =
  [ "BASIC",
    "COBOL",
    "CSHARP",
    "HASKELL",
    "LISP",
    "PERL",
    "PHP",
    "PYTHON",
    "RUBY",
    "SCHEME"
  ]

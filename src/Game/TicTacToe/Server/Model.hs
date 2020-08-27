{-
    Implements a Tic-tac-toe data model.
-}
module Game.TicTacToe.Model where

import Data.List


data Tile = X | O | Empty

instance Show Tile where
    show X = "  X  "
    show O = "  O  "
    show Empty = "Empty"


type Row = [Tile]


data Board = Board [Row]

instance Show Board where
  show (Board b) = intercalate "\n" $ map show b


data Point = Point Int Int deriving Show

data Player = A | B deriving Show

data State = Winner Player | NoWinner deriving Show


createBoard :: Int -> Int -> Board
createBoard x y = Board $ replicate x (emptyRow y)

emptyRow :: Int -> Row
emptyRow x = replicate x Empty

-- checkWinner :: Board -> State
-- checkWinnerRow
-- checkWinnerCol
-- checkWinnerDiagOne
-- checkWinnerDiagTwo
-- isEmpty :: Point Board -> Bool
-- placeWithChecks Tile -> Point -> Board -> Maybe Board

place :: Tile -> Point -> Board -> Board 
place t (Point x y) (Board b) = 
    let r = b !! x
    in Board $ take x b ++ (placeInRow t y r) : drop (x + 1) b

placeInRow :: Tile -> Int -> Row -> Row
placeInRow t y r = take y r ++ t : drop (y + 1) r 


{-
    Turn-based strategy games can be succinctly described by
    discrete finite automata; this module provides those
    primitives.
-}
module Engine.Utility.DFA
( State
, Symbol
, DFA
) where

data State a = State a

type States a = [State a]


data Symbol a = Symbol a

type Alphabet a = [Symbol a]


type Transition a b = State a -> Symbol b -> State a

type Accept a = State a -> Bool


data DFA a b = DFA
    { states :: States a
    , alphabet :: Alphabet b
    , transition :: Transition a b
    , start :: State a
    , accept :: Accept a
    }

class DfaLike a where
    dfa_states :: a -> [State x]
    dfa_alphabet :: a -> [Symbol y]
    dfa_transition :: a -> (State x) -> (Symbol y) -> (State x)
    dfa_start :: a -> State x
    dfa_accept :: a -> (State x) -> Bool


data Parser a b = Parser (State a) (DFA a b)

initParser :: DFA a b -> Parser a b
initParser x = Parser (start x) x

advanceParser :: Parser a b -> Symbol b -> Parser a b
advanceParser (Parser x y) s = Parser ((transition y) x s) y

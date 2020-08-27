module Engine.Utility.DFA
( State
, Symbol
, DFA
) where

data State a = State a

data Symbol a = Symbol a

class DFA a where
    states :: a -> [State x]
    alphabet :: a -> [Symbol y]
    transition :: a -> (State x) -> (Symbol y) -> (State x)
    start :: a -> State x
    accept :: a -> (State x) -> Bool

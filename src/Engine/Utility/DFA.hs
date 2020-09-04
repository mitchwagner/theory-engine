{-
    Turn-based strategy games can be succinctly described by
    discrete finite automata; this module provides those
    primitives.

    Note that DFAs as they are traditionally described (stopping
    only when the input string is exhausted) are not practical
    constructs for our purposes. Our input stream extends beyond
    the lifetime of a single DFA, and we have no way to know when
    we should stop evaluating one and start evaluating another.

    Consequently, the DFAs this engine works with must have the
    property that all final states are unambiguously final- there
    are no valid transitions out of them.
-}
module Engine.Utility.DFA where

data State a = State a

type States a = [State a]


data Symbol a = Symbol a

type Alphabet a = [Symbol a]


type Transition a b = State a -> Symbol b -> State a

type Accept a = State a -> Bool


data DFA a b = DFA
    { states     :: States a
    , alphabet   :: Alphabet b
    , transition :: Transition a b
    , start      :: State a
    , accept     :: Accept a
    }

class DfaLike a where
    dfa_states     :: a -> [State x]
    dfa_alphabet   :: a -> [Symbol y]
    dfa_transition :: a -> (State x) -> (Symbol y) -> (State x)
    dfa_start      :: a -> State x
    dfa_accept     :: a -> (State x) -> Bool


data Parser a b = Parser
    { state :: (State a)
    , dfa   :: (DFA a b)
    }

initParser :: DFA a b -> Parser a b
initParser x = Parser (start x) x

consume :: Parser a b -> Symbol b -> Parser a b
consume (Parser x y) s = Parser ((transition y) x s) y

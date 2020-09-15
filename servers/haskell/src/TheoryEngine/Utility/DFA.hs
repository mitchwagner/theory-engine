{- | Turn-based strategy games can be succinctly described by
discrete finite automata; this module provides those primitives.

Note that DFAs as they are traditionally described (stopping only
when the input string is exhausted) are not practical constructs
for our purposes. Our input stream extends beyond the lifetime of
a single DFA, and we have no way to know when we should stop
evaluating one and start evaluating another.

Consequently, the DFAs this engine works with must have the
property that all final states are unambiguously final- there are
no valid transitions out of them.
-}
module TheoryEngine.Utility.DFA where

data State a = State a

type States a = [State a]


data Symbol a = Symbol a

type Alphabet a = [Symbol a]


type Transition a b = State a -> Symbol b -> State a

type Accept a = State a -> Bool


data DFA a b = DFA
    { dfaStates     :: States a
    , dfaAlphabet   :: Alphabet b
    , dfaTransition :: Transition a b
    , dfaStart      :: State a
    , dfaAccept     :: Accept a
    }

class DfaLike a where
    dfaLikeStates     :: a -> [State x]
    dfaLikeAlphabet   :: a -> [Symbol y]
    dfaLikeTransition :: a -> (State x) -> (Symbol y) -> (State x)
    dfaLikeStart      :: a -> State x
    dfaLikeAccept     :: a -> (State x) -> Bool


data Parser a b = Parser
    { parserState :: (State a)
    , parserDfa   :: (DFA a b)
    }

initParser :: DFA a b -> Parser a b
initParser x = Parser (start x) x

consume :: Parser a b -> Symbol b -> Parser a b
consume (Parser x y) s = Parser ((transition y) x s) y

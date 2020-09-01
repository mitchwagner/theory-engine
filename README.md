# Theory Engine

The Theory Engine (TE) is a turn-based strategy engine whose design is
focused on mathematical elegance and expressivity.

TE is designed with a client-server architecture in mind.

## Theory

We define a *machine* as consisting of a discrete finite automaton parser,
a model, and a table that describes tranformations to the model when the
parser transitions states, i.e., 

```haskell
data Machine a b c = Machine
    { model :: c
    , graph :: DFA.Parser a b
    , table :: DFA.State a  -> DFA.Symbol b -> (c -> c)
    }

-- Here, a characterizes states, and b, symbols
data Parser a b = Parser
    { state :: (State a)
    , dfa   :: (DFA a b)
    }
```

A turn-based strategy game can be concisely characterized as a
machine of machines. 

The outer machine (the shell) concerns itself transitions among the
inner machines (the rooms). Sometimes, deeper nesting may be desirable,
but the general principle holds.

A game is a program that drives the shell, feeding a stream of
inputs to the shell's model (which is a room); the room consumes
these in turn until the room stops, yielding the next room the
shell should transition to.

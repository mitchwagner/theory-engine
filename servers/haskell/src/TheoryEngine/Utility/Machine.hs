{- A machine has an associated model, a control flow in the form
of a DFA, and a lookup table that describes how each transition
transforms the model.
-}

{-# LANGUAGE DuplicateRecordFields #-}

module TheoryEngine.Utility.Machine where

import TheoryEngine.Utility.DFA as DFA

data Machine a b c
    = MachineActive  (Active a b c)
    | MachineStopped (Stopped c)

data Active a b c = Active
    { modelActive :: c
    , graph :: DFA.Parser a b
    , table :: DFA.State a -> DFA.Symbol b -> (c -> c)
    }

data Stopped c = Stopped {modelStopped :: c}

advance :: Machine a b c -> DFA.Symbol b -> Machine a b c
advance (MachineStopped m) _ = MachineStopped m
advance (MachineActive m) s =
    let x = state (consume (graph m) s)
        y = (dfa . graph) m
        z = (((table m) ((state . graph) m) s) (modelActive m))
    in if (accept y) x
        then MachineStopped (Stopped z)
        else MachineActive (Active z (consume (graph m) s) (table m))

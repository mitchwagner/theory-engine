{-
An Interface is a DFA that maps input to functions on a Model.
-}
module Engine.Server.Interface
( Interface
) where

import Data.Either
import Engine.Utility.DFA

data Input a = Input a

class DFA a => Interface a where
    select :: (DFA x) => x -> a -> Either a (x -> x)

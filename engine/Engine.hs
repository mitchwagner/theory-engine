import Model
import View
import Interface

data Room = Room View Interface Model 

-- Need to think about how the games transitions between rooms
-- It really is a nested DFA, dude

type Game = [Room]

main :: IO() =
    do putStrLn "Hi!"

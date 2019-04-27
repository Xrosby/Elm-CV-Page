module Main exposing (..)
import Html exposing (text)


dog =
    { name = "Spock"
    , age = 3

    }

main =
    text <| String.fromInt <| .age dog


{-

politely : String -> String
politely phrase =
    "Excuse me, " ++ phrase


ask : String -> String -> String
ask thing place =
    "is there a " ++ thing ++ " in the " ++ place ++ "?"

askPolitelyAboutFish : String -> String
askPolitelyAboutFish = politely << (ask "fish")

main =
    text <|askPolitelyAboutFish "pond"

    -}
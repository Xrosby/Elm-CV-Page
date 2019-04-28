module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


main =
    Browser.sandbox { init = init, update = update, view = view }



{-
   -- EXERCISE IN CREATING HTML ELEMENTS


   type alias Ship =
       { name : String
       , model : String
       , cost : Int
       }


   shipsArray =
       [ { name = "X-wing", cost = 14999 }
       , { name = "Millinium Falcon", cost = 10000 }
       , { name = "Death Star", cost = 10000000 }
       ]


   renderShip ship =
       li
           [ class "ship"
           ]
           [ text ship.name
           , text ", "
           , b []
               [ text <| String.fromInt ship.cost ]
           ]


   renderShips ships =
       div
           [ style "font-family" "-apple-system"
           , style "padding" "1em"
           , class "ship-list"
           ]
           [ h1 [] [ text "Ships" ]
           , ul [] (List.map renderShip ships)
           ]


   main =
       renderShips shipsArray

-}
{-
      -- Exercise in list creating and handling
      -- No mixed types in a list


      type alias Person =
          { name : String
          , age : Int
          }


      people =
          [ { name = "Martin Dreymann", age = 29 }
          , { name = "Lasse Klevang", age = 18 }
          ]


      names : List Person -> List String
      names peeps =
          List.map (\peep -> peep.name) peeps



   -- STUDY THIS FUNCTION FURTHER. TF IS "JUST" "_" "memo" ?
      findPerson :
          String
          -> List Person
          ->
              Maybe
                  -- Maybe equals to Null or a Person
                  Person
      findPerson name peeps =
          List.foldr
              (\peep memo ->
                  case memo of
                      Just _ ->
                          memo

                      Nothing ->
                          if peep.name == name then
                              Just peep

                          else
                              Nothing
              )
              Nothing
              peeps


      main =
          text <| Debug.toString <| findPerson "Martin Dreymann" people

-}
{-

   -- Exercise in Alias(Type definition) And record(object) creation and handling

   -- This is an alias > Defines a type which can be used to
   -- infer variables and types on a parameter of the type
   type alias Dog =
       { name : String
       , age : Int

       }
   -- Creating a record, which matches the alias definition
   spock =
       { name = "Spock"
       , age = 3

       }

   -- Basically ^^^ Uphere we define the type and an object of the type
   -- Down here we define the function signature, and then the actual function


   -- A renderDog function signature that takes an alias Dog, returns a String
   renderDog : Dog -> String
   -- renderDog function
   renderDog dog =
       dog.name ++ ", " ++ (String.fromInt dog.age)


   -- And here it is all render to html text,
    -- by calling the renderdog function with the dog variable
   main =
       text <| renderDog spock

-}
-- Exercise in function definitions and function concatination
{-

   politely : String -> String
   politely phrase =
       "Excuse me, " ++ phrase


   ask : String -> String -> String
   ask thing place =
       "is there a " ++ thing ++ " in the " ++ place ++ "?"


   -- Function takes a String and returns a function
   askPolitelyAboutFish : String -> String

   -- In the function body we first evaluate the parameter,
   -- with the ask punction. So "fish" and "pond" would be the two parameters.
   -- The returned String from ask with the two parameters will then be passed to politely
   -- evaluated, and then finally the function will return the result.
   askPolitelyAboutFish = politely << (ask "fish")

   main =
       text <|askPolitelyAboutFish "pond"

-}

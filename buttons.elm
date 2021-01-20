-- Kaitlin Berryman
-- Based on this tutorial https://elm-lang.org/examples/buttons

module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement
  
type Msg2
  = Hello
  | Goodbye

type TopLevel 
  = Top  Msg
  | Butt Msg2

update : TopLevel -> Model -> Model
update top model =
  case top of
    Top Increment ->
          model + 1
          
    Top Decrement ->
          model - 1
     
    Butt Hello ->
          model + 5
        
    Butt Goodbye ->
          model - 5
   

-- VIEW


view : Model -> Html TopLevel
view model =
  div []
    [ button [ onClick (Top Decrement) ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick (Top Increment) ] [ text "+" ]
    , button [ onClick (Butt Hello) ] [text "---"]
    , button [ onClick (Butt Goodbye) ] [text "___"]
    ]

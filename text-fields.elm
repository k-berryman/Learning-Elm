-- Kaitlin Berryman
-- Following this tutorial https://elm-lang.org/examples/text-fields 

-- A text input for reversing text. Very useful!
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/text_fields.html
--

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { content : String
  , number  : Int
  }


init : Model
init =
  { content = ""
  , number  = 0
  }



-- UPDATE


type Msg
  = Change String
  | Increment Int

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { number = 0, content = newContent }
    
    Increment newNum ->
      { model | number = newNum }


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]

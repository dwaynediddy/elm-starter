module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (..)

type Msg
  = NoOp
  | MakeTheNumberBigger

type Page = Home

type alias Model =
  { currentPage : Page
  , someNumber : Int
  }

type alias Flags = ()

main : Program Flags Model Msg
main = Browser.element
  { init = init
  , subscriptions = subscriptions
  , update = update
  , view = view
  }

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

init : Flags -> (Model, Cmd Msg)
init flags =
  ({ currentPage = Home
   , someNumber = 0
   }, Cmd.none)

view : Model -> Html Msg
view model =
  div []
    [ text "HELLO OOOHHHH SHIT!"
    , p [] [ text ("My number is: " ++ String.fromInt model.someNumber)]
    , button [ onClick MakeTheNumberBigger ] [ text "MAKE BIGGER" ]
    ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of

  NoOp ->
    (model, Cmd.none)

  MakeTheNumberBigger ->
    ({ model | someNumber = model.someNumber + 1}, Cmd.none)

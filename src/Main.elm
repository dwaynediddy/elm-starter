module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main : Program Flags Model Msg
main = Browser.element
  { init = init
  , subscriptions = subscriptions
  , update = update
  , view = view
  }

type Msg = SetQuestion Quiz

type Quiz = Start 
  | QuestionOne 
  | QuestionTwo 
  | QuestionThree 
  | QuestionFour 
  | QuestionFive
  | Results


type alias Model = { current : Quiz }


type alias Flags = ()


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

init : Flags -> (Model, Cmd Msg)
init flags =
  ({ current = Start }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    SetQuestion Start ->
        ({ model | current = Start }, Cmd.none)
    SetQuestion QuestionOne ->
        ({ model | current = QuestionOne }, Cmd.none)
    SetQuestion QuestionTwo ->
        ({ model | current = QuestionTwo }, Cmd.none)
    SetQuestion QuestionThree ->
        ({ model | current = QuestionThree }, Cmd.none)
    SetQuestion QuestionFour ->
        ({ model | current = QuestionFour }, Cmd.none)
    SetQuestion QuestionFive ->
        ({ model | current = QuestionFive }, Cmd.none)
    SetQuestion Results ->
        ({ model | current = Results}, Cmd.none)


view : Model -> Html Msg
view model = case model.current of
    Start ->
        div [] 
        [
        h2 []
        [text "Diddy Quiz"]
        , button [onClick (SetQuestion QuestionOne)][text "Start Quiz"]
        ]
    QuestionOne ->
        div [class "questionPage"]
        [
        h2 [] [text "question One"]
        , div [][text ""]
        , button [onClick (SetQuestion QuestionTwo)][text "submit"]
        ]
    QuestionTwo ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Two"]
        , div [][text ""]
        , button [onClick (SetQuestion QuestionThree)][text "submit"]
        ]
    QuestionThree ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Three"]
        , div [][text ""]
        , button [onClick (SetQuestion QuestionFour)][text "submit"]
        ]
    QuestionFour->
        div [class "questionPage"]
        [
        h2 [] [text "Question Four"]
        , div [][text ""]
        , button [onClick (SetQuestion QuestionFive)][text "submit"]
        ]
    QuestionFive ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Five"]
        , div [][text ""]
        , button [onClick (SetQuestion Results)][text "View Resdults"]
        ]
    Results ->
      div [class "resultsPage"]
      [
        h2 [][text "Results"]
        , div [] [text "you scored"]
        , button [onClick (SetQuestion Start)] [text "return to Start"]
      ]
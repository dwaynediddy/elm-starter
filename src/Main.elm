module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck)


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
        , h3 [][text "Who is the best Rugby team in Poland?"]
        ,div [] [
        label [] [text "Ogniwo"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Lodz"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Lublin"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Skra"]
        , input [type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionTwo)][text "submit"]
        ]
    QuestionTwo ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Two"]
        , div [][text ""]
        , h3 [][text "Which Hero dies in the fellowship of the ring??"]
        ,div [] [
        label [] [text "Gandelf"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Gimli"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Pippin"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Boromir"]
        , input [type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionThree)][text "submit"]
        ]
    QuestionThree ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Three"]
        , div [][text ""]
        , h3 [][text "where was jezen born?"]
        ,div [] [
        label [] [text "Poland"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "England"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Jerusalem"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Straya"]
        , input [type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionFour)][text "submit"]
        ]
    QuestionFour->
        div [class "questionPage"]
        [
        h2 [] [text "Question Four"]
        , div [][text ""]
        , h3 [][text "wWhich chess piece can ONLY move diagonally?"]
        ,div [] [
        label [] [text "Bishop"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Queen"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Knight"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Rook"]
        , input [type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionFive)][text "submit"]
        ]
    QuestionFive ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Five"]
        , div [][text ""]
        , h3 [][text "Who is the Black Mamba"]
        ,div [] [
        label [] [text "Lebron James"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Kobe Bryant"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Michael Jordan"]
        , input [type_ "radio"][]
        ]
        ,div [] [
        label [] [text "Shaq"]
        , input [type_ "radio"][]
        ]
        , button [onClick (SetQuestion Results)][text "View Results"]
        ]
    Results ->
      div [class "resultsPage"]
      [
        h2 [][text "Results"]
        , div [] [text "you scored"]
        , button [onClick (SetQuestion Start)] [text "return to Start"]
      ]
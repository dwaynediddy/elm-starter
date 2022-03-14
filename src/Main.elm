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
        div [class "startPage"] 
        [
        h2 []
        [text "Diddy Quiz"]
        , button [onClick (SetQuestion QuestionOne)][text "Start Quiz"]
        ]
    QuestionOne ->
        div [class "questionPage"]
        [
        h2 [] [text "Question One"]
        , h3 [][text "Who is the best Rugby team in Poland?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Ogniwo"]
        , input [name "q1", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lodz"]
        , input [name "q1", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lublin"]
        , input [name "q1", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Skra"]
        , input [name "q1", type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionTwo)][text "Submit"]
        ]
    QuestionTwo ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Two"]
        , h3 [][text "Which Hero dies in the fellowship of the ring??"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Gandelf"]
        , input [name "q2", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Gimli"]
        , input [name "q2", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Pippin"]
        , input [name "q2", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Boromir"]
        , input [name "q2", type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionThree)][text "Submit"]
        ]
    QuestionThree ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Three"]
        , div [class "questionContainer"][text ""]
        , h3 [][text "where was jezen born?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Poland"]
        , input [name "q3", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "England"]
        , input [name "q3", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Jerusalem"]
        , input [name "q3", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Straya"]
        , input [name "q3", type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionFour)][text "Submit"]
        ]
    QuestionFour->
        div [class "questionPage"]
        [
        h2 [] [text "Question Four"]
        , div [class "questionContainer"][text ""]
        , h3 [][text "Which chess piece can ONLY move diagonally?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Bishop"]
        , input [name "q4", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Queen"]
        , input [name "q4", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Knight"]
        , input [name "q4", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Rook"]
        , input [name "q4", type_ "radio"][]
        ]
        , button [onClick (SetQuestion QuestionFive)][text "Submit"]
        ]
    QuestionFive ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Five"]
        , h3 [][text "Who is the Black Mamba"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lebron James"]
        , input [name "q5", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Kobe Bryant"]
        , input [name "q5", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Michael Jordan"]
        , input [name "q5", type_ "radio"][]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Shaq"]
        , input [name "q5", type_ "radio"][]
        ]
        , button [onClick (SetQuestion Results)][text "View Results"]
        ]
    Results ->
      div [class "resultsPage"]
      [
        h2 [][text "Results"]
        , h4 [class "Results"] [text "you scored 5/5"]
        , button [onClick (SetQuestion Start)] [text "return to Start"]
      ]
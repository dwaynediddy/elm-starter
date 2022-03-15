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

type Msg = SetPage Page
  | SetAnswerOne AnswerOne



type Page = Start 
  | QuestionOne
  | QuestionTwo 
  | QuestionThree 
  | QuestionFour 
  | QuestionFive
  | Results

type AnswerOne = Ogniwo
    | Lodz
    | Lublin
    | Skra


type alias Model =
  { currentPage : Page
  , answerOne : Maybe AnswerOne
  }

type alias Flags = ()


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

init : Flags -> (Model, Cmd Msg)
init flags =
  ({ currentPage = Start, answerOne = Nothing }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    SetPage page ->
        ({ model | currentPage = page}, Cmd.none)
    SetAnswerOne answer ->
      ({ model | answerOne = Just answer }, Cmd.none)



view : Model -> Html Msg
view model = case model.currentPage of
    Start ->
        div [class "startPage"] 
        [
        h2 []
        [text "Diddy Quiz"]
        , button [onClick (SetPage QuestionOne)][text "Start Quiz"]
        ]
    QuestionOne ->
        div [class "questionPage"]
        [
        h2 [] [text "Question One"]
        , h3 [][text "Who is the best Rugby team in Poland?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Ogniwo", input [name "q1", type_ "radio", onClick (SetAnswerOne Ogniwo)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lodz", input [name "q1", type_ "radio", onClick (SetAnswerOne Lodz)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lublin", input [name "q1", type_ "radio", onClick (SetAnswerOne Lublin)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Skra", input [name "q1", type_ "radio", onClick (SetAnswerOne Skra)][]]
        ]
        , button [onClick (SetPage QuestionTwo)][text "Submit"]
        ]
    QuestionTwo ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Two"]
        , h3 [][text "Which Hero dies in the fellowship of the ring??"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Gandelf", input [name "q1", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Gimli", input [name "q1", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Pippin", input [name "q1", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Boromir", input [name "q1", type_ "radio"][]]
        ]
        , button [onClick (SetPage QuestionThree)][text "Submit"]
        ]
    QuestionThree ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Three"]
        , div [class "questionContainer"][text ""]
        , h3 [][text "where was jezen born?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Poland", input [name "q3", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "England", input [name "q3", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Jerusalem", input [name "q3", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Straya", input [name "q3", type_ "radio"][]]
        ]
        , button [onClick (SetPage QuestionFour)][text "Submit"]
        ]
    QuestionFour->
        div [class "questionPage"]
        [
        h2 [] [text "Question Four"]
        , div [class "questionContainer"][text ""]
        , h3 [][text "Which chess piece can ONLY move diagonally?"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Bishop", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Queen", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Knight", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Rook", input [name "q4", type_ "radio"][]]
        ]
        , button [onClick (SetPage QuestionFive)][text "Submit"]
        ]
    QuestionFive ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Five"]
        , h3 [][text "Who is the Black Mamba"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lebron James", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Kobe Bryant", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Michael Jordan", input [name "q4", type_ "radio"][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Shaq", input [name "q4", type_ "radio"][]]
        ]
        , button [onClick (SetPage Results)][text "View Results"]
        ]
    Results ->
      div [class "resultsPage"]
      [
        h2 [][text "Results"]
        , h4 [class "Results"] [text "you scored 5/5"]
        , button [onClick (SetPage Start)] [text "return to Start"]
      ]
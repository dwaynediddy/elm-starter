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
  | SetAnswerTwo AnswerTwo
  | SetAnswerThree AnswerThree
  | SetAnswerFour AnswerFour
  | SetAnswerFive AnswerFive



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

type AnswerTwo = Gandelf
    | Gimli
    | Pippin
    | Boromir

type AnswerThree = Poland
    | England
    | Jerusalem
    | Straya

type AnswerFour = Bishop
    | Queen
    | Knight
    | Rook

type AnswerFive = Lebron
    | Kobe
    | Mike
    | Shaq


type alias Model =
  { currentPage : Page
  , answerOne : Maybe AnswerOne
  , answerTwo : Maybe AnswerTwo
  , answerThree : Maybe AnswerThree
  , answerFour : Maybe AnswerFour
  , answerFive : Maybe AnswerFive
  }

type alias Flags = ()


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

init : Flags -> (Model, Cmd Msg)
init flags =
  ({ 
    currentPage = Start
  , answerOne = Nothing
  , answerTwo = Nothing
  , answerThree = Nothing
  , answerFour = Nothing
  , answerFive = Nothing
 }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    SetPage page ->
        ({ model | currentPage = page}, Cmd.none)
    SetAnswerOne answer ->
      ({ model | answerOne = Just answer }, Cmd.none)
    SetAnswerTwo answer ->
      ({ model | answerTwo = Just answer }, Cmd.none)
    SetAnswerThree answer ->
      ({ model | answerThree = Just answer }, Cmd.none)
    SetAnswerFour answer ->
      ({ model | answerFour = Just answer }, Cmd.none)
    SetAnswerFive answer ->
      ({ model | answerFive = Just answer }, Cmd.none)



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
        label [class "label"] [text "Gandelf", input [name "q1", type_ "radio", onClick (SetAnswerTwo Gandelf)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Gimli", input [name "q1", type_ "radio", onClick (SetAnswerTwo Gimli)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Pippin", input [name "q1", type_ "radio", onClick (SetAnswerTwo Pippin)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Boromir", input [name "q1", type_ "radio", onClick (SetAnswerTwo Boromir)][]]
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
        label [class "label"] [text "Poland", input [name "q3", type_ "radio", onClick (SetAnswerThree Poland)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "England", input [name "q3", type_ "radio", onClick (SetAnswerThree England)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Jerusalem", input [name "q3", type_ "radio", onClick (SetAnswerThree Jerusalem)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Straya", input [name "q3", type_ "radio", onClick (SetAnswerThree Straya)][]]
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
        label [class "label"] [text "Bishop", input [name "q4", type_ "radio", onClick (SetAnswerFour Bishop)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Queen", input [name "q4", type_ "radio", onClick (SetAnswerFour Queen)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Knight", input [name "q4", type_ "radio", onClick (SetAnswerFour Knight)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Rook", input [name "q4", type_ "radio", onClick (SetAnswerFour Rook)][]]
        ]
        , button [onClick (SetPage QuestionFive)][text "Submit"]
        ]
    QuestionFive ->
        div [class "questionPage"]
        [
        h2 [] [text "Question Five"]
        , h3 [][text "Who is the Black Mamba"]
        , div [class "questionContainer"] [
        label [class "label"] [text "Lebron James", input [name "q4", type_ "radio", onClick (SetAnswerFive Lebron)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Kobe Bryant", input [name "q4", type_ "radio", onClick (SetAnswerFive Kobe)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Michael Jordan", input [name "q4", type_ "radio", onClick (SetAnswerFive Mike)][]]
        ]
        , div [class "questionContainer"] [
        label [class "label"] [text "Shaq Diesel", input [name "q4", type_ "radio", onClick (SetAnswerFive Shaq)][]]
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
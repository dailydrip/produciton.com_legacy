module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (..)


type alias Model =
    { message : String
    , logo : String
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( { message = "Your Elm App is working!", logo = path }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ text "Stuff"]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

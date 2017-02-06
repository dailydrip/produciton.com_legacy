module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (..)


-- Model - the data that your app needs in order to work,
-- esp. data that can change.


type alias Model =
    { templates : List Template
    , todoList : Maybe TodoList
    }


type alias TodoList =
    { todos : List Todo
    , name : String
    , id : String
    }


type alias Todo =
    { title : String
    , completed : Bool
    }


type alias Template =
    -- This is a record
    { name : String
    , logoUrl : String
    , id : String
    }



-- first argument is 'flags' that are sent in when starting
-- the app from js


init : String -> ( Model, Cmd Msg )
init path =
    { templates = initialTemplates
    , todoList = Nothing
    }
        ! []


initialTemplates : List Template
initialTemplates =
    [ { name = "Rails"
      , logoUrl = ""
      , id = "0"
      }
    , { name = "Ember"
      , logoUrl = ""
      , id = "0"
      }
    ]


fakeTodoList : TodoList
fakeTodoList =
    { todos = []
    , name = "Josh's fancy todo list"
    , id = "foo"
    }


type Msg
    = NoOp
    | CreateTodoListFromTemplate String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        CreateTodoListFromTemplate templateId ->
            { model | todoList = Just fakeTodoList } ! []


view : Model -> Html Msg
view model =
    case model.todoList of
        Nothing ->
            viewTemplates model

        Just todoList ->
            viewTodoList todoList


viewTodoList : TodoList -> Html Msg
viewTodoList todoList =
    h2 [] [ text "todolist" ]


viewTemplates : Model -> Html Msg
viewTemplates model =
    div []
        ([ h2 [] [ text "Produciton" ] ]
            ++ (List.map templateButton model.templates)
        )


templateButton : Template -> Html Msg
templateButton template =
    button
        [ onClick (CreateTodoListFromTemplate template.id) ]
        [ text template.name ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

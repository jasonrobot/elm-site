-- Main.elm
-- Main entry point


module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    { value : Int }


init : Model
init =
    { value = 0 }



-- Update


type Msg
    = Increment
    | Decrement
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | value = model.value + 1 }

        Decrement ->
            { model | value = model.value - 1 }

        Change newValue ->
            case String.toInt newValue of
                Just intValue ->
                    { model | value = intValue }

                Nothing ->
                    model



-- View


view : Model -> Html Msg
view model =
    div [ class "form" ]
        [ div [ class "value-input" ]
            [ input [ value (String.fromInt model.value), onInput Change ] []
            ]
        , div [ class "value-buttons" ]
            [ button [ onClick Decrement ] [ text "-" ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        ]

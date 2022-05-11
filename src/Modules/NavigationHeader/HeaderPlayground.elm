module Modules.NavigationHeader.HeaderPlayground exposing (..)

import Browser
import DspCpeApi as Api
import Html exposing (div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Modules.NavigationHeader.NavbarModule exposing (..)
import Shared.SharedTypes exposing (NavItem)


type alias Model =
    String


main : Program () Model MyRoute
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type MyRoute
    = RouteOne
    | RouteTwo


init : () -> ( Model, Cmd msg )
init _ =
    ( "", Cmd.none )


someNavitem : NavItem MyRoute
someNavitem =
    { attrs = [ onClick RouteOne ], text = "NavItem which does events", href = "#", cmd = Cmd.none, isActive = True }


otherNavitem : NavItem MyRoute
otherNavitem =
    { attrs = [ onClick RouteTwo ], text = "other NavItem", href = "#", cmd = Cmd.none, isActive = False }


view : String -> Html.Html MyRoute
view model =
    div [ class "playground" ]
        [ div [ class "buttons" ] []
        , div [] [ Api.header "" Nothing [ someNavitem, otherNavitem ] True ]
        , div [] [ text model ]
        ]


update : MyRoute -> b -> ( String, Cmd msg )
update action _ =
    case action of
        RouteOne ->
            ( "changing to route one", Cmd.none )

        RouteTwo ->
            ( "changing to route two", Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
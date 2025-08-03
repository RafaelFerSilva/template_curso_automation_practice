*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Widgets/widgets.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    is_mobile=True    AND
...                 Click On Card And Validate Navigation    WIDGETS

Test Tags       web    widgets    widgets_mobile


*** Test Cases ***
Should Be Possible Move Carousel Item
    Mouve Carosel And Validate Item    3    Terceiro slide do carrossel
    Mouve Carosel And Validate Item    1    Primeiro slide do carrossel

Should Be Possible Reset Carousel
    Mouve Carosel And Validate Item    3    Terceiro slide do carrossel
    Reset Carousel To Default State

Should Be Possible Select Carousel Item By Dot Button
    Mouve Carosel And Validate Item    3    Terceiro slide do carrossel    True
    Mouve Carosel And Validate Item    1    Primeiro slide do carrossel    True

Should Be Possible Move Carousel With Auto Play
    Perform Carousel Auto Play

Should Be Possible Stop Carousel Auto Play
    Perform Carousel Auto Play And Stop On Item    3    Terceiro slide do carrossel

Should Be Possible Move Main Slider
    [Tags]    slider    slider_main
    Update Slider Main To Value    75
    Update Slider Main To Value    25

Should Be Possible Move Volume Slider
    [Tags]    slider    slider_volume
    Update Slider Volume To Value    50
    Update Slider Volume To Value    100

Should Be Possible Mute Volume Slider
    [Tags]    slider    slider_volume    mute
    Update Slider Volume To Value    20
    Click On Mute Button To Volume
    Check Valude On Slider Volume Display    0
    Click On Mute Button To Volume
    Check Valude On Slider Volume Display    20

Should Be Possible Validade Main Progress Bar
    [Tags]    progress_bar
    Click On Button To Start Progress Bar
    Wait For Progress Bar To Reach Value    ${PROGRESS_MAIN_INDICATOR}    100

It Must Be Possible To Move Items Between Zones
    [Tags]    drag_drop
    Move A List Items To Drop Zone    1    4
    Move Item Of Drop Zone To Sort Zone    1

    Validate Sortable Zone Items Quantity    3
    Validate Dropped Zone Items Quantity    1

    Validate Sortable Items Order    2    3    1
    Validate Dropped Items Order    4

It Must Be Possible Re-Arrange Items In Sortable Zone
    [Tags]    drag_drop
    Move A List Items To Drop Zone    1    2    3    4
    Move A List Items To Sort Zone    3    1    4    2

It Must Be Possible Re-Arrange Items In Dropped Zone
    [Tags]    drag_drop
    Move A List Items To Drop Zone    1    3    4    2

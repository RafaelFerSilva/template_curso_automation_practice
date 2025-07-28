*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Widgets/widgets.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    WIDGETS

Test Tags       web    widgets    widgets_web


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

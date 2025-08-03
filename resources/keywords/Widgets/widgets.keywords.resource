*** Settings ***
Resource    ${EXECDIR}/resources/common.keywords.resource
Resource    widgets.page.resource


*** Keywords ***
Mouve Carosel And Validate Item
    [Documentation]    Moves the carousel to the specified item and validates the displayed item and dot selection.
    [Arguments]    ${item}    ${description}    ${by_dot}=False    ${max_attempts}=10
    Move Carousel Item    ${item}    ${by_dot}    ${max_attempts}
    Validate The Item Being Displayed In The Carousel    ${item}    ${description}
    Check If Dot Was Selected    ${item}

Reset Carousel To Default State
    [Documentation]    Resets the carousel to its initial state and validates the first item's content and dot selection.
    Click On Reset Button
    Validate The Item Being Displayed In The Carousel    1    Primeiro slide do carrossel
    Check If Dot Was Selected    1

Perform Carousel Auto Play
    [Documentation]    Initiates auto-play and verifies the visibility of each slide's title and corresponding dot selection.
    ${dots}=    Get Carousel Dot Quantity
    Click On Auto Play Button
    FOR    ${index}    IN RANGE    1    ${dots}+1
        Check If Slide Title Is Visible    ${index}
        Check If Dot Was Selected    ${index}
    END

Perform Carousel Auto Play And Stop On Item
    [Documentation]    Starts auto-play, checks slides until a specified item is reached, stops auto-play, and validates the item's content and dot.
    [Arguments]    ${item}    ${description}

    ${dots}=    Get Carousel Dot Quantity
    Click On Auto Play Button
    FOR    ${index}    IN RANGE    1    ${dots}+1
        Check If Slide Title Is Visible    ${index}
        Check If Dot Was Selected    ${index}

        IF    ${index} == ${item}
            Click On Auto Play Button
            Validate The Item Being Displayed In The Carousel    ${index}    ${description}
            Check If Dot Was Selected    ${index}
            RETURN
        END
    END

Update Slider Main To Value
    [Arguments]    ${value}    ${tolerance}=2

    Set Slider Value    ${SLIDER_MAIN_THUMB}    ${SLIDER_MAIN_TRACK}    ${value}    ${tolerance}
    Check Value On Slider Main Display    ${value}

Update Slider Volume To Value
    [Arguments]    ${value}
    Set Slider Value    ${SLIDER_VOLUME_THUMB}    ${SLIDER_VOLUME_TRACK}    ${value}
    Check Valude On Slider Volume Display    ${value}

Move Item Of Sort Zone To Drop Zone
    [Arguments]    ${source_item}
    Drag And Drop Item To Drop Zone    ${source_item}
    Validate Item In Drop Zone    ${source_item}

Move Item Of Drop Zone To Sort Zone
    [Arguments]    ${source_item}
    Drag And Drop Item To Sortable Zone    ${source_item}
    Validate Item In Sortable Zone    ${source_item}

Move A List Items To Sort Zone
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        Move Item Of Drop Zone To Sort Zone    ${item}
    END
    Validate Sortable Items Order    @{items}

Move A List Items To Drop Zone
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        Move Item Of Sort Zone To Drop Zone    ${item}
    END
    Validate Dropped Items Order    @{items}

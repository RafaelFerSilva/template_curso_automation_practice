*** Settings ***
Library     Browser
Library     String
Library     Collections
Resource    widgets.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Check If Slide Title Is Visible
    [Documentation]    Verifies the visibility of a slide title based on its number.
    [Arguments]    ${number}

    ${update_number}=    Evaluate    ${number} - 1
    ${index}=    Convert To String    ${update_number}

    ${element}=    Replace String    ${CAROUSEL}[ITEM]    $$    ${index}
    Wait For Elements State    ${element} >> h3 >> text=Slide ${number}    visible

Check If Slide Description Is Visible
    [Documentation]    Verifies the visibility of a slide description based on its number and content.
    [Arguments]    ${number}    ${description}

    ${update_number}=    Evaluate    ${number} - 1
    ${index}=    Convert To String    ${update_number}

    ${element}=    Replace String    ${CAROUSEL}[ITEM]    $$    ${index}
    Wait For Elements State    ${element} >> p >> text=${description}    visible

Validate The Item Being Displayed In The Carousel
    [Documentation]    Validates the title and description of the currently displayed carousel item.
    [Arguments]    ${number}    ${description}

    Check If Slide Title Is Visible    ${number}
    Check If Slide Description Is Visible    ${number}    ${description}

Click On Next Button
    Click    ${CAROUSEL}[NEXT]

Click On Prev Button
    Click    ${CAROUSEL}[PREV]

Click On Auto Play Button
    Click    ${CAROUSEL}[AUTO]

Click On Reset Button
    Click    ${CAROUSEL}[RESET]

Check If Dot Was Selected
    [Documentation]    Verifies if the specified dot is selected.
    [Arguments]    ${dot_number}
    ${update_number}=    Evaluate    ${dot_number} - 1
    ${index}=    Convert To String    ${update_number}

    ${element}=    Replace String    ${CAROUSEL}[DOT]    $$    ${index}
    Wait For Elements State    ${element}.bg-blue-600

Click On Dot Button
    [Documentation]    Clicks a specific dot and verifies its selection.
    [Arguments]    ${dot_number}
    ${update_number}=    Evaluate    ${dot_number} - 1
    ${index}=    Convert To String    ${update_number}

    ${element}=    Replace String    ${CAROUSEL}[DOT]    $$    ${index}
    Click    ${element}
    Check If Dot Was Selected    ${index}

Move Carousel Item
    [Documentation]    Moves the carousel to a specific item, optionally using dots, with a maximum number of attempts.
    [Arguments]    ${item}    ${by_dot}=${False}    ${max_attempts}=10
    ${found_slide}=    Set Variable    ${False}
    ${item}=    Convert To Integer    ${item}

    IF    ${item} < 1    Fail    Item number cannot be less than 1.

    ${attempt}=    Set Variable    0

    WHILE    not ${found_slide} and ${attempt} < ${max_attempts}
        ${attempt}=    Evaluate    ${attempt} + 1

        ${translate}=    Get Translate Value    ${CAROUSEL_MAIN}
        ${progress}=    Evaluate    int(abs(${translate}))
        ${expected_percent}=    Evaluate    (${item} - 1) * 100

        Log    Attempt ${attempt}: TranslateX=${translate}%, Progress=${progress}%, Expected=${expected_percent}%

        ${found_slide}=    Evaluate    ${progress} == ${expected_percent}

        IF    ${found_slide}
            Log    Slide ${item} found.
            Take Screenshot
            RETURN
        END

        IF    ${by_dot}
            Run Keyword And Ignore Error    Click On Dot Button    ${item}
            Check If Dot Was Selected    ${item}
            Log    Dot ${item} is selected.
        ELSE
            IF    ${progress} < ${expected_percent}
                Run Keyword And Ignore Error    Click On Next Button
            ELSE
                Run Keyword And Ignore Error    Click On Prev Button
            END
        END
    END

    IF    not ${found_slide}
        Fail    Could not move to slide ${item} after ${max_attempts} attempts. Please!!! Check if slide ${item} Exist
    END

Get Carousel Dot Quantity
    [Documentation]    Retrieves the total number of dots in the carousel.
    ${dot_quantity}=    Get Element Count    ${CAROUSEL_DOTS}
    RETURN    ${dot_quantity}

Click On Button To Start Progress Bar
    Click    ${BTN_PRIMARY_START_PROGRESS}

Check Value On Slider Main Display
    [Arguments]    ${expected_value}    ${tolerance}=2

    ${value}=    Get Text    ${BADGE_SLIDER_DISPLAY}
    IF    abs(${expected_value} - ${value}) <= ${tolerance}    RETURN    True

Check Valude On Slider Volume Display
    [Arguments]    ${expected_value}
    Get Text    ${BADGE_VOLUME_DISPLAY}    ==    ${expected_value}

Click On Mute Button To Volume
    Click    ${BTN_EDIT_MUTE}

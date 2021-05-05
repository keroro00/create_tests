*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library		  Collections
Library           SeleniumLibrary



*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID title}    Yoga Class
${VALID description}    Yoga is good.
${VALID difficulty}  	 Beginner  #Intermediate  Advanced
${VALID language}    Cantonese    #English  Mandarin
${UNSELECT}    	Please select
${CreateClass URL}      http://${SERVER}/createClass.html
${Created URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create class
    Open Browser    ${CreateClass URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create class Should Be Open

Create class Should Be Open
    Title Should Be    Create class

Go To Create class
    Go To    ${CreateClass URL}
    Create class Should Be Open

Input title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Select difficulty
    [Arguments]	  ${difficulty}
    Select From List By label    difficulty_field    ${difficulty}

Select language
    [Arguments]	  ${language}
    Select From List By label   language_field   ${language}

Input description
    [Arguments]    ${description}
    Input Text    description_field    ${description}



Submit Creation
    Click Button    submit_button

Result Page Should Be Open
    Location Should Be    ${Created URL}
    Title Should Be    Result Page

*** Settings ***
Documentation     A test suite with a single test for invalid create.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       Open Browser To Create class
Suite Teardown    Close Browser
Test Setup        Go To Create class
Test Template     Invalid create
Resource          resource.robot
*** Test Cases ***   						TITLE	 		DESCRIPTION  	    DIFFICULTY  	  LANGUAGE
Empty title							${EMPTY}  	${VALID description}	${VALID difficulty}   ${VALID language}
Empty description						${VALID title}  ${EMPTY}		${VALID difficulty}   ${VALID language} 
Unselected difficulty						${VALID title}	${VALID description}	${UNSELECT}	      ${VALID language} 
Unselected language						${VALID title}	${VALID description}	${VALID difficulty}   ${UNSELECT}

Empty title and description					${EMPTY}  	${EMPTY}		${VALID difficulty}   ${VALID language} 
Empty title and difficulty					${EMPTY}  	${VALID description}	${UNSELECT}	      ${VALID language}
Empty title and language					${EMPTY}  	${VALID description}	${VALID difficulty}   ${UNSELECT} 

Empty description and unselect difficulty			${VALID title}  ${EMPTY}		${UNSELECT}	      ${VALID language}
Empty description and unselect language			${VALID title}  ${EMPTY}		${VALID difficulty}   ${UNSELECT}

Unselect difficulty and language				${VALID title}	${VALID description}	${UNSELECT}	      ${UNSELECT}

Empty title and description and difficulty			${EMPTY}  	${EMPTY}		${UNSELECT}	      ${VALID language} 
Empty title and description and language			${EMPTY}  	${EMPTY}		${VALID difficulty}   ${UNSELECT} 
Empty title and difficulty and language				${EMPTY}  	${VALID description}	${UNSELECT}	      ${UNSELECT} 

Empty description and unselect difficulty and language		${VALID title}  ${EMPTY}		${UNSELECT}	      ${UNSELECT}
All fields empty						${EMPTY}  	${EMPTY}		${UNSELECT}	      ${UNSELECT}
*** Keywords ***
Invalid create
    [Arguments]    ${title}    ${description}   ${difficulty}  ${language}
    Input title    ${title}
    Input description     ${description}
    Select difficulty     ${difficulty}
    Select language       ${language}
    Submit Creation
    create Should Have Failed

create Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page

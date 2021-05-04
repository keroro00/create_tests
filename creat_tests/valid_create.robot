*** Settings ***
Documentation     A test suite with a single test for valid create.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid create
    Open Browser To Create class
    Input title    Yoga Class
    Input description     Yoga is good.
    Select difficulty     Beginner
    Select language       Cantonese
    Submit Creation
    Result Page Should Be Open
    [Teardown]    Close Browser

*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     OperatingSystem

Resource    ../../Object_Repository/Shopping_Cart/locators.robot
Resource    ../../Test_Data/Shopping_Cart/ApplicationData.robot

*** Keywords ***

Launch DemoWebShop Application
    Open Browser    ${url}    ${browser}
    Maximize Browser Window  
  
Login Into DemoWebShop Application
    Wait Until Element Is Visible    ${ADVANCE_BUTTON}    ${parallelWait}
    Click Element    ${ADVANCE_BUTTON}
    Wait Until Element Is Visible    ${PROCEED_LINK}   ${parallelWait}
    Click Element    ${PROCEED_LINK}          
    Wait Until Element Is Visible    ${LOGIN_HEADER_TAB}    ${parallelWait}
    Click Element    ${LOGIN_HEADER_TAB}
    Wait Until Element Is Visible    ${EMAIL_TAB}    ${parallelWait}
    Input Text    ${EMAIL_TAB}    ${email}
    Wait Until Element Is Visible    ${PASSWORD_TAB}    ${parallelWait}
    Input Password    ${PASSWORD_TAB}    ${passwrd}
    Wait Until Element Is Visible    ${LOGIN_DETAILS_BUTTON}    ${parallelWait}
    Click Element    ${LOGIN_DETAILS_BUTTON}   

User Logged Into DemoWebShop Application
    Wait Until Element Is Visible    ${CATEGORIES_TEXT}    ${parallelWait}
    Log    User Successfully Logged in DemoWebShop application.
    
Log Out From DemoWebShop Shopping Site
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    ${parallelWait}
    Click Element    ${LOGOUT_BUTTON}
    
User Logged Out From DemoWebShop Shopping Site        
    Wait Until Element Is Visible    ${LOGIN_HEADER_TAB}    ${parallelWait}
    Log    User Logged Out of Application Successfully.    
           
Capture Page Screenshot in Directory   
   [Arguments]    ${screenshotName}
   ${timeStamp}    Create Date Timestamp  
   ${screenshotName}    Catenate    ${screenshotName}    ${timeStamp}
   Execute Javascript        document.body.style.zoom="80%"
   ${SCREENSHOT_IMG}=    Capture Page Screenshot   ${screenshotName}.png
   Execute Javascript        document.body.style.zoom="100%"               
   [Return]    ${SCREENSHOT_IMG}
   
Create Date Timestamp
   ${date} =    Get Current Date
   ${date1}=    Replace String   ${date}  ${SPACE}    ${EMPTY}
   ${date2}=    Replace String   ${date1}  -   ${EMPTY}
   ${date3}=    Replace String   ${date2}  :    ${EMPTY}
   ${date4}=    Replace String   ${date3}  .    ${EMPTY}
   [Return]    ${date4}       
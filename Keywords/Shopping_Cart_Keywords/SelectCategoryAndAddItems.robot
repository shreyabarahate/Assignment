*** Settings ***
Library     SeleniumLibrary
Library     String
Library    Collections

Resource    ../../Object_Repository/Shopping_Cart/locators.robot
Resource    ../../Test_Data/Shopping_Cart/ApplicationData.robot

*** Keywords ***

Navigate To Computer Section And Select Desktop SubField
    Wait Until Element Is Visible    ${COMPUTERS_OPTION}    ${parallelWait}
    Wait Until Keyword Succeeds    ${retry}    ${retryCount}    Click Element    ${COMPUTERS_OPTION}
    Wait Until Element Is Visible    ${SELECT_DESKTOP_OPTION}    ${parallelWait}
    Wait Until Keyword Succeeds    ${retry}    ${retryCount}    Click Element    ${SELECT_DESKTOP_OPTION}      
    
Navigated To Computer Section And Desktop SubField Selected
    Wait Until Element Is Visible    ${VERIFY_FILTER_TEXT}    ${parallelWait}
    Log    User Successfully navigated inside Desktop SubField.    
        
Apply Price Filter Under Desktop Category
    Wait Until Element Is Visible    ${SORT_BY_TAB}    ${parallelWait}
    Click Element    ${SORT_BY_TAB}
    Wait Until Element Is Visible    ${SELECT_PRICE_OPTION}    ${parallelWait}
    Click Element    ${SELECT_PRICE_OPTION}
    Wait Until Element Is Visible    ${PAGE_SIZE_TAB}    ${parallelWait}
    Click Element    ${PAGE_SIZE_TAB}
    Wait Until Element Is Visible    ${PAGE_DISPLAY_OPTION}    ${parallelWait}
    Click Element    ${PAGE_DISPLAY_OPTION}                        

Price Filter Applied Under Desktop Category
    Log    Price Filter From High to Low Applied Successfully.                
  
Add First Most Expensive Items From Desktop Category In Shopping Cart
    :FOR    ${i}    IN RANGE    1    3
    \    Wait Until Element Is Visible    (${OPEN_ITEM})[${i}]    ${parallelWait}
    \    Click Element    (${OPEN_ITEM})[${i}]    
    \    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${INPUT_USER_TAB}    ${quickWait}
    \    Run Keyword If    '${i}'=='2'    Click Element    ${ADD_ATTRIBUTE}     
    \    Wait Until Element Is Visible    ${ADD_ITEM}    ${parallelWait}
    \    Click Element    ${ADD_ITEM}
    \    Navigate To Computer Section And Select Desktop SubField
    \    Apply Price Filter Under Desktop Category
   
Added First Most Expensive Items From Desktop Category In Shopping Cart
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${INPUT_USER_TAB}    ${quickWait}
    Log    Items Added in Shopping Cart.
    
Navigate To Shopping Cart Section
    Wait Until Element Is Visible    ${SHOPPING_CART_OPTION}    ${parallelWait}
    Click Element    ${SHOPPING_CART_OPTION}    
    
User Navigated Inside Shopping Cart Section
    Wait Until Element Is Visible    ${VERIFY_SHOPPING_CART_TEXT}    ${parallelWait}
    Log    User Navigated inside Shopping Cart Section.  
    
Verify Sub Total Of The Purchased Items
    Wait Until Element Is Visible    ${VERIFY_CART_ITEMS}    ${parallelWait}
    ${count}    Get Element Count    ${VERIFY_CART_ITEMS}
    :FOR    ${i}    IN RANGE    1    ${count}+1
    \    ${text}    Get Text    (${VERIFY_CART_ITEMS})[${i}]
    \    @{split}    Split String    ${text}    .
    \    ${integerNo}    Convert To Integer    ${split}[0]
    \    ${result}    Evaluate    ${integerNo}+${result}
    Log    ${result}
    ${cartValue}    Get Text    ${CART_TOTAL_VALUE}
    @{split1}    Split String    ${cartValue}    .
    ${actualTotalValue}    Convert To Integer    ${split1}[0]
    Run Keyword If    '${actualTotalValue}'=='${result}'    Log    Sub Total Matches with the sum of Price of each item
    ...    ELSE    Fail    Price not matched    
     
Verified Sub Total Of Purchased Items
    Wait Until Element Is Visible    ${CHECKOUT_OPTION}    ${parallelWait}
    Log    Sub Total Verified.   
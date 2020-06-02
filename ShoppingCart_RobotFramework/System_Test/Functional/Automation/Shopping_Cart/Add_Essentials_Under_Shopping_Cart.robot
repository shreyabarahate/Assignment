*** Settings ***
Documentation    This Test Case Adds List of Items in Shopping Cart.
Library          ALMConvertor.KeywordStoreExtension
Library          SeleniumLibrary
Resource         ../../../../../Keywords/Shopping_Cart_Keywords/CommonKeywords.robot
Resource         ../../../../../Keywords/Shopping_Cart_Keywords/SelectCategoryAndAddItems.robot

Test Setup       Launch DemoWebShop Application
Test Teardown    Close Browser

*** Test Cases ***

TC001 Add Two Most Expensive Items To Shopping Cart
    [Documentation]
    ...    <b>objective</b>
    ...    1. To Add two most expensive itemsfrom a Category in Shopping Cart List.
    ...    
    ...    <b>pre-requisites</b>
    ...    1. URL of the website must be correct.
    ...    2. User must have an account created for shopping inside that website.

   - Login Into DemoWebShop Application
   ? User Logged Into DemoWebShop Application
   ${screenshot}=  ? Capture Page Screenshot in Directory    LoggedIntoApplication
   - Navigate To Computer Section And Select Desktop SubField
   ? Navigated To Computer Section And Desktop SubField Selected
   ${screenshot}=  ? Capture Page Screenshot in Directory    DesktopCategory
   - Apply Price Filter Under Desktop Category
   ? Price Filter Applied Under Desktop Category
   ${screenshot}=  ? Capture Page Screenshot in Directory    PriceFilter
   - Add First Most Expensive Items From Desktop Category In Shopping Cart
   ? Added First Most Expensive Items From Desktop Category In Shopping Cart
   ${screenshot}=  ? Capture Page Screenshot in Directory    FirtItemAdded
   - Navigate To Shopping Cart Section
   ? User Navigated Inside Shopping Cart Section
   ${screenshot}=  ? Capture Page Screenshot in Directory    ShoppingCart
   ${screenshot}=  ? Capture Page Screenshot in Directory    SecondItemVerified
   - Verify Sub Total Of The Purchased Items
   ? Verified Sub Total Of Purchased Items
   ${screenshot}=  ? Capture Page Screenshot in Directory    TotalPriceVerified
   - Log Out From DemoWebShop Shopping Site
   ? User Logged Out From DemoWebShop Shopping Site
   ${screenshot}=  ? Capture Page Screenshot in Directory    LogOut
*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables***
${wikipiedia_url}  https://pl.wikipedia.org/wiki/Wikipedia:Strona_g%C5%82%C3%B3wna
${OUTPUT_DIR}  C:\staż\python-git\RobotFramework

*** Keywords ***
Get Filename
  [Arguments]  ${url}
  ${filename}=  Evaluate  "${url}".split('/').pop()
  [Return]  ${filename}

*** Test Cases ***
Open Wikipedia and Search
  [Documentation]  Test: Wikipedia search
  Open Browser  ${wikipiedia_url}
  Click Element  css:[id='pt-login-2']
  Input Text  css:[id="wpName1"]  ZosiaRybakowska
  Input Password  css:[id="wpPassword1"]  RobotFramework
  Select Checkbox  css:[id="wpRemember"]
  Click Button  css:[id="wpLoginAttempt"]
  Input Text  xpath://form[@id="searchform"]//input[@class="cdx-text-input__input" and @name="search"]  Gekon
  Click Button  xpath://button[@class="cdx-button cdx-button--action-default cdx-button--weight-normal cdx-button--size-medium cdx-button--framed cdx-search-input__end-button"]
  Sleep  3
  #szukanie obrazka na stronie i pobieranie go:
  ${image_element}=  Get WebElement  xpath://img[@alt="Ilustracja"]
  ${image_url}=  Get Element Attribute  ${image_element}  src
  Log  ${image_url}

  #pobieranie obrazka 
#   ${download_path}=  Join Path  ${OUTPUT_DIR}  Images
#   Create Directory  ${download_path}
#   ${image_filename}=  Get Filename  ${image_url}
#   ${download_file_path}=  Set Variable  Join Path  ${download_path}  ${image_filename}
#   Download File  ${image_url}  ${download_file_path}
  
  Capture Page Screenshot  C:\staż\python-git\RobotFrameworkKurs\screenshot.png
  

 

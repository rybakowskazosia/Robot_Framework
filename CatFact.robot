*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Cat Fact
    [Documentation]    Get a random cat fact from Cat Facts API
    Create Session    CatFacts    https://catfact.ninja/
    #${responce}- przechowuje odpowiedź na żądanie ze ścieżki /fact
    ${response}    Get Request    CatFacts    /fact
    Should Be Equal As Strings    ${response.status_code}    200 
    #pobranie faktu o kotach z odpowiedzi, która jest w formacie json i przypisanie go do zmiennej fact
    ${fact}    Set Variable    ${response.json()["fact"]}
    Log    Cat fact: ${fact}
    Delete All Sessions


# *** Settings ***
# Library  SeleniumLibrary
# Library  Collections


# ***Variables***
# ${catfacts_url}  https://catfact.ninja/


# *** Test Cases ***
# Random Cat Fact Test
#   Open Browser  ${catfacts_url}
# # Click Element  xpath://*[@id="operations-tag-Facts"]
#   Sleep  2s
#   ${random_fact}  Get Text  css:[class="microlight"]
#   Log  Random Cat Fact: ${random_fact}
  





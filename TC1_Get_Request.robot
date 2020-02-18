*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}    http://restapi.demoqa.com/
${city}      Delhi
${response}

*** Test Cases ***
Get_WeatherInfo
    create session  mysession  ${base_url}
    ${response}=   get request  mysession  /utilities/weather/city/${city}

    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}


    #Validations
    ${Status_code}=  convert to string  ${response.status_code}
    should be equal  ${Status_code}   200

    ${body}=  convert to string   ${response.content}
    should contain  ${body}   ${city}

   ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
   should be equal  ${contentTypeValue}  application/json

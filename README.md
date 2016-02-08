# SSN Validation API

This is an api only app to validate Finnish Social Security Number. The service is accessible from [https://validate-ssn.herokuapp.com/api/v1/validate_ssn?ssn=xxxxxx-xxxx](https://validate-ssn.herokuapp.com/api/v1/validate_ssn?ssn=131052-308T).

It returns HTTP 200 response, with a response body of either true or false, depending whether the SSN is a valid finnish social security number. The response should have a http 200 status code and contain the header ContentType: text/plain.

---------------------------------------------------------
Example request, valid SSN: 

Request: http://api-endpoint/validateSSN/?ssn=131052-308T

Response: true

---------------------------------------------------------

Example request, invalid SSN: 

Request: http://api-endpoint/validateSSN/?ssn=220163-349C

Response: false




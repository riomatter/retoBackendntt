Feature: Obtener información de recursos

  #Ejemplo de como obtener siempre un token, aunque no se reutiliza en los demas ejemplos ya que actualmente
  #el ejemplo devuelve un token null,solo se indica a modo de ejemplo.
  Background:
    Given url 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token'
    * def credentials = { scope: '#(scope)', grant_type: '#(grant_type)', username: '#(username)', password: '#(password)', client_id: '#(client_id)'}
    And form fields credentials
    When method post
    * def token = response.access_token
    * print "Token:", token


  Scenario: Obtener la lista de usuarios
    * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
    Given url URL
    And path 'posts'
    When method GET
    Then status 200
    And match responseType == 'json'
    And match response[0] == expected

  Scenario: Obtener la lista de usuarios status code 404
    * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
    Given url URL
    And path 'postsx'
    When method GET
    Then status 404
    And match responseType == 'json'

  Scenario Outline: Verificar estructura de información de un usuario
    * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
    Given url URL
    And path 'posts/'
    And param userId = "<ID>"
    When method GET
    Then status 200
    And match responseType == 'json'
    And match response[0] == expected
    And assert response.length > 1
    * print "Response:" , response[0].userId

     Examples:
      | ID  |
      | 1   |
      | 2   |




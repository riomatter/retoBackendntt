Feature: Obtener información de recursos

Scenario Outline: Crear un usuario por metodo POST
  * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
  Given url URL
  And path 'posts'
  And request { title: '<title>', body: '<body>', userId: <userId> }
  And header Content-Type = 'application/json; charset=UTF-8'
  When method POST
  Then status 201
  And match responseType == 'json'
  And match response == expected

  Examples:
  | title | body | userId |
  | foo   | bar  | 1      |
  | hola  | mundo| 2      |

  Scenario Outline: Crear un usuario por metodo POST status code 404
    Given url URL
    And path 'postsx'
    And request { title: '<title>', body: '<body>', userId: <userId> }
    And header Content-Type = 'application/json; charset=UTF-8'
    When method POST
    Then status 404
    And match responseType == 'json'

    Examples:
      | title | body | userId |
      | foo   | bar  | 1      |



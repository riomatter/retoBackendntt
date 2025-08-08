Feature: Actualizar información de recursos

Scenario Outline: Actualizar un usuario por metodo PUT
  * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
  Given url URL
  And path 'posts/' + "<ID>"
  And request { title: '<title>', body: '<body>', userId: <userId> }
  And header Content-Type = 'application/json; charset=UTF-8'
  When method PUT
  Then status 200
  And match responseType == 'json'
  And match response == expected

  Examples:
  |ID  | title   | body    | userId |
  | 1  | Carta   | parque  | 1      |
  | 2  | Mensaje | mundo   | 2      |

Scenario Outline: Actualizar un usuario por metodo PATCH
  * def expected = read('classpath:karate/resources/request/estructuraJsonEsperadaResource.json')
  Given url URL
  And path 'posts/' + "<ID>"
  And request { title: '<title>' }
  And header Content-Type = 'application/json; charset=UTF-8'
  When method PATCH
  Then status 200
  And match responseType == 'json'

  Examples:
  |ID  | title   |
  | 1  | Carta   |
  | 2  | Mensaje |

  Scenario Outline: Actualizar un usuario por metodo POST status code 404
    Given url URL
    And path 'postsx'
    And request { title: '<title>', body: '<body>', userId: <userId> }
    And header Content-Type = 'application/json; charset=UTF-8'
    When method PATCH
    Then status 404
    And match responseType == 'json'

    Examples:
      | title | body | userId |
      | foo   | bar  | 1      |
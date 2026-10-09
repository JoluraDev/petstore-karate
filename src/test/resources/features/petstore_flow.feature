@petstore @regression
Feature: Gestión del ciclo de vida de una mascota en Swagger Petstore

  Background:
    # Obtiene la baseUrl definida en karate-config.js
    * url baseUrl
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

    # Generamos un ID dinámico basado en timestamp para que sea único en cada ejecución
    * def petId = java.lang.System.currentTimeMillis()
    * def petName = 'Scooby_' + petId
    * def updatedPetName = 'Scooby_Adoptado'

  Scenario: Flujo E2E de creación, consulta, actualización y filtrado de mascota


    # 1. AÑADIR UNA MASCOTA A LA TIENDA (POST /pet)

    Given path '/pet'
    And request
      """
      {
        "id": #(petId),
        "category": {
          "id": 1,
          "name": "Perros"
        },
        "name": "#(petName)",
        "photoUrls": [
          "https://example.com/Scooby.jpg"
        ],
        "tags": [
          {
            "id": 10,
            "name": "rescatado"
          }
        ],
        "status": "available"
      }
      """
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'
    * print 'Mascota creada exitosamente con ID:', response.id

    # 2. CONSULTAR LA MASCOTA POR ID (GET /pet/{petId})

    Given path '/pet', petId
    When method get
    Then status 200
    # Verificaciones (Test)
    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'
    * print 'Mascota consultada por ID:', response


    # 3. ACTUALIZAR NOMBRE Y ESTATUS A "sold" (PUT /pet)

    Given path '/pet'
    And request
      """
      {
        "id": #(petId),
        "category": {
          "id": 1,
          "name": "Perros"
        },
        "name": "#(updatedPetName)",
        "photoUrls": [
          "https://example.com/Scooby.jpg"
        ],
        "tags": [
          {
            "id": 10,
            "name": "rescatado"
          }
        ],
        "status": "sold"
      }
      """
    When method put
    Then status 200
    # Verificaciones (Test)
    And match response.id == petId
    And match response.name == updatedPetName
    And match response.status == 'sold'
    * print 'Mascota actualizada a estatus sold:', response


    # 4. CONSULTAR POR ESTATUS "sold" (GET /pet/findByStatus)
  
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    # Verificaciones (Test) y que sea un arreglo JSON
    And match response == '#[]'
    # Validamos que nuestra mascota específica con petId y status 'sold' esté en la lista
    And match response contains deep { id: #(petId), status: 'sold' }
    * print 'Consulta por estatus exitosa. Se verificó que el ID está en la lista de vendidos.', response
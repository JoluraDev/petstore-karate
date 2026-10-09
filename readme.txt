
GUÍA DE EJECUCIÓN - PRUEBA TÉCNICA AUTOMATIZACIÓN API (SWAGGER PETSTORE)


------------------- 1. DESCRIPCIÓN DEL PROYECTO ----------------------

Proyecto de automatización de pruebas para servicios REST sobre la API
pública de Swagger Petstore (https://petstore.swagger.io/v2).

Flujo cubierto
1. Añadir una nueva mascota al catálogo (POST /pet).
2. Consultar la mascota ingresada mediante búsqueda por ID (GET /pet/{petId}).
3. Actualizar el nombre y el estatus de la mascota a "sold" (PUT /pet).
4. Consultar las mascotas por estatus (GET /pet/findByStatus?status=sold)
   y verificar la existencia del registro modificado en el catálogo.

Herramientas y tecnologías utilizadas:
- Framework: Karate Framework 1.4.1
- Motor de ejecución: JUnit 5
- Lenguaje / Entorno: Java 11 (build 11.0.19+9-LTS)
- Gestor de construcción: Gradle


----------------- 2. REQUISITOS PREVIOS DEL ENTORNO ------------------

- Java JDK 11 (versión 11.0.x LTS) configurado en el sistema (JAVA_HOME y PATH).
- Visual Studio Code con el paquete "Extension Pack for Java".
- Conexión a Internet activa para la descarga de dependencias y el consumo de la API.


----------------- 3. ESTRUCTURA DEL PROYECTO -------------------------

petstore-karate/
  ├── build.gradle                              
  ├── src/test/java/
  │     ├── PetstoreTest.java                   
  │     └── karate-config.js                    
  ├── src/test/resources/
  │     └── features/
  │           └── petstore_flow.feature         
  ├── target/karate-reports/ (o build/...)      
  ├── readme.txt                                
  └── conclusiones.txt                          


---------------- 4. INSTRUCCIONES DE EJECUCIÓN PASO A PASO -----------

Opción A: Desde Visual Studio Code (Recomendada)
1. Abrir la carpeta raíz 'petstore-karate' en Visual Studio Code.
2. Esperar unos segundos a que el IDE sincronice las dependencias.
3. Navegar en el explorador a:
     src/test/java/PetstoreTest.java
4. Hacer clic sobre el botón de ejecución (Play / Run Test) al lado de la clase
   o del método 'testPetstore()'.

Opción B: Mediante Panel Gradle en VS Code
1. Ir a la barra lateral izquierda y abrir la pestaña "Gradle".
2. Desplegar: petstore-karate -> Tasks -> verification.
3. Hacer doble clic o clic en Play sobre la tarea "test".


---------- 5. CONSULTA DEL REPORTE KARATE DE EVIDENCIAS --------------
----------------------------------------------------------------------
Navegar en el explorador a
  target/karate-reports/karate-summary.html
  (o build/karate-reports/karate-summary.html)

Para visualizarlo:
1. Abrir dicho archivo 'karate-summary.html' en cualquier navegador (Chrome, Edge).
2. Hacer clic sobre 'features/petstore_flow.feature' para desplegar la línea de
   tiempo y examinar las peticiones HTTP (Request Body, Response Body, Headers
   y códigos de estado HTTP 200).

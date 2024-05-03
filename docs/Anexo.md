---
title: Anexo
updated: 2024-05-03 20:48:05Z
created: 2024-05-03 20:30:48Z
latitude: 41.38506390
longitude: 2.17340350
altitude: 0.0000
---

# Anexos
## Pipeline
Durante la practica se ha estado evolucionando el fichero Jenkins file. El actual en la rama master es la versión definitiva. En el se incluye :
* Utilización de una librería compartida test-pipeline-library que se puede encontrar en el directorio jenkins
* La paralelización de las fases de Test
  * Unit test
  * Integration test
*  La utilización de un bucle de espera activa para la inicialización de los servidores de mock y flask así como la utlización de un cerrojo de recursos
*  La parte de resultados no funciona como debería, posible bug
## Codigo
El codigo de la solución se encuentra en la rama develop aunque se ha hecho un merge a la rama master.

## IAC
Durante la ejecución de las pruebas el script de provisión para la configuración de los nodos en terraform se ha cambiado de un script provider.sh a una inline debido a que no se le pueden pasar parámetros a los scripts y era necesario pasar el hostname para determinadas tareas.


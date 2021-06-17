# INTRODUCCIÓN DEL PROYECTO: 

La metodología que se utiliza para lograr iniciar con cualquier proyecto de analítica de datos, debe basarse en el abastecimiento y recolección de datos históricos; en el caso de la compañía, el equipo de analítica de Colombia inició con  la recolección de datos y el alojamiento de ellos en la suite de la cuenta de MS @analítica de datos, integrando conexiones desde One drive, Share Point y  Power BI entre sí, inicialmente para lograr distribuir y mostrar los resultados de los proyectos a nivel interno y cliente.

# OBJETIVOS: 

Crear aplicación para recolectar datos por medio de un formulario, este después enviara la información hacia una base de datos el cual será consumida por la plataforma Power BI para representar dichos datos en tableros y gráficas.



# DETALLE PROPUESTA.

Crear una aplicación para recolectar datos por medio de formularios, estos enviaran la información hacia una base de datos y la almacenara de forma acumulativa. La base de datos es accesible por medio de una conexión con Power BI, la cual consumirá esta información para la creación de los tableros requeridos

    1 Control de acceso a la aplicación: La aplicación permite el acceso controlado de los usuarios, los cuales ingresaran con sus cuenta office 365 dados por la compañía.
    2 Roles: La aplicación permite que un administrador asigne roles o permisos de consultas a los usuarios que ingresan, los permisos se basan en poder registrar, consultar y/o modificar datos de ciertos proyectos, además de asignar a cuales formularios tendrán acceso.
    3 Portal Administrativo: La aplicación cuenta con un portal administrativo donde el administrador de la plataforma podrá asignar roles a los usuarios, crear  proyectos, Periodos de facturación, Servicios, Pjs.
    4 Portal Usuario: La aplicación cuenta con un portal de usuario donde estos registraran la información de sus formularios, dependiendo de sus permisos en la aplicación.

# ENTORNO DE DESARROLLO.

## Nivel 1:

Sistema Operativo: El proyecto se ha desarrollado sobre un S.O Linux, pero todo el entorno y la aplicación pueden desplegarse el cualquier otro sistema operativo.

## Nivel 2:

Servidor NGINX: Nginx es un servidor web que también puede ser usado como proxy inverso, balanceador de carga y proxy para protocolos de correo.

Nginx está diseñado para ofrecer un bajo uso de memoria y alta concurrencia. En lugar de crear nuevos procesos para cada solicitud web, Nginx usa un enfoque asincrónico basado en eventos donde las solicitudes se manejan en un solo hilo.

Con Nginx, un proceso maestro puede controlar múltiples procesos de trabajo. El proceso maestro mantiene los procesos de trabajo, y son estos lo que hacen el procesamiento real.

Algunas características comunes que se ven en Nginx incluyen:

    • Proxy inverso con caché
    • IPv6
    • Balanceo de carga
    • Soporte FastCGI con almacenamiento en caché
    • Websockets
    • Manejo de archivos estáticos, archivos de índice y auto indexación
    • TLS / SSL con SNI

## Nivel 3: 

En este tercer nivel encontramos los lenguajes de programación  y el sistema de gestión de base de datos elegidos para desarrollar la aplicación.

### Docker: 

es un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de contenedores de software, proporcionando una capa adicional de abstracción y automatización de virtualización de aplicaciones en múltiples sistemas operativos. Docker utiliza características de aislamiento de recursos del kernel Linux, tales como cgroups y espacios de nombres (namespaces) para permitir que "contenedores" independientes se ejecuten dentro de una sola instancia de Linux, evitando la sobrecarga de iniciar y mantener máquinas virtuales.

### VirtualEnv: 

Un entorno virtual de Python es un ambiente creado con el objetivo de aislar recursos como librerías y entorno de ejecución, del sistema principal o de otros entornos virtuales. Lo anterior significa que en el mismo sistema, maquina o computadora, es posible tener instaladas múltiples versiones de una misma librería sin crear ningún tipo de conflicto.

### Python: 
Es un lenguaje de programación que permite trabajar con gran rapidez e integrar sus sistemas con efectividad.

### Javascript: 
es un lenguaje de programación ligero, interpretado, o compilado justo a tiempo(just-in-time) con funciones de primera clase. JavaScript es un lenguaje de programación basada en prototipos, multiparadigma, de un solo hilo, dinámico, con soporte para programación orientada a objetos, imperativa y declarativa (por ejemplo programación funcional).

### MYSQL: 
MySQL es el sistema de gestión de bases de datos relacional más extendido en la actualidad al estar basada en código abierto. Desarrollado originalmente por MySQL AB, fue adquirida por Sun MicroSystems en 2008 y esta su vez comprada por Oracle Corporation en 2010, la cual ya era dueña de un motor propio InnoDB para MySQL.

## Nivel 4: 
De acuerdo a las buenas practicas de desarrollo se hace uso de dos frameworks Django (python) y Vue Js (Javascript). Un framework de desarrollo web por lo general se define como una aplicación  o conjunto de módulos que permiten  el desarrollo agil  de aplicaciones mediante la aportación de librerías y/o funcionalidades ya creadas

### Django: 
Es un framework de desarrollo web de código abierto escrito en Python, que respeta el patrón de diseño conocido como modelo-vista-controlador (MVC)

### Vue js: 

es un framework de JavaScript de código abierto para la construcción de interfaces de usuario y aplicaciones de una sola página(SPA).

## Nivel 5: 

Django Rest framework: Django Rest Framework es una aplicación Django que permite construir proyectos software bajo la arquitectura REST, incluye gran cantidad de código para reutilizar (Views, Resources, etc.) y una interfaz administrativa desde la cual es posible realizar pruebas sobre las operaciones HTTP como lo son: POST y GET.

# Iniciar el servicio
```
systemctl start anality
```

# Contenedor docker para mysql
```
docker run -d -p 33060:3306 --name mysql-anality -e MYSQL_ROOT_PASSWORD=ITS-4n4L1Ty --mount src=mysql-db-data,dst=/var/lib/mysql mysql

docker start mysql-anality
```

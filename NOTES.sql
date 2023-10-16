/*

Configuración Inicial:

Las variables de MySQL están ubicadas en el archivo my.ini en la ruta C:\ProgramData\MySQL\MySQL Server 8.0\.
Al iniciar el servicio MySQL, estas variables se inicializarán con los valores que se encuentran en este archivo.

Documentación de Referencia:
https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html

Para ver el valor de 'Created_tmp_disk_tables':
SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';

Para ver el valor de 'Created_tmp_tables':
SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

Estas variables están asociadas con el número de tablas temporales que se pueden abrir en memoria y en disco durante una sesión. Esto puede afectar el rendimiento de la base de datos.

La variable tmp_table_size, definida en my.ini, tiene un valor inicial de 35. Puedes verificarlo con:
SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

Modificación de Variables:
Si tienes los privilegios adecuados, puedes modificar las variables de ambiente.

Por ejemplo, para cambiar el valor de tmp_table_size a 136700160:
SET GLOBAL tmp_table_size = 136700160;

Esta acción te permite modificar el valor de la variable, independientemente de lo que esté especificado en el archivo my.ini.



Creación y Características de Tablas:

Durante la creación de una tabla, puedes especificar el mecanismo de almacenamiento que utilizará. Ejemplo:
CREATE TABLE df_table (ID INT, NOMBRE VARCHAR(100));

Para visualizar las características de almacenamiento de una tabla recién creada, dirígete a "Tables" en Workbench y haz clic en el ícono de información.

Por defecto, las tablas se crean usando el mecanismo de almacenamiento InnoDB.

Puedes modificar el mecanismo de almacenamiento de una tabla existente con:
ALTER TABLE DEFAULT_TABLE ENGINE = MyISAM;

Al crear una tabla, también puedes definir su mecanismo de almacenamiento:
CREATE TABLE df_table1 (ID INT, NOMBRE VARCHAR(100)) ENGINE = MEMORY;

Usando el asistente de Workbench, se te dará la opción de seleccionar el mecanismo de almacenamiento, siendo InnoDB la opción predeterminada.


Creación y Gestión de Bases de Datos:

Puedes crear bases de datos mediante comandos, como:
CREATE DATABASE base;

También puedes crear bases de datos utilizando el asistente de Workbench. Haz clic derecho en un espacio vacío en el panel izquierdo y selecciona "Create Schema...".
Siguiendo el asistente, introduce un nombre para la base de datos, por ejemplo, "base2".

Cuando se crean bases de datos, MySQL almacena archivos físicos en el disco duro. Para identificar dónde se almacenan, consulta la variable de entorno:
SHOW VARIABLES WHERE Variable_Name LIKE '%dir';

La variable "datadir" indica la ubicación de almacenamiento.
En el directorio "datadir", encontrarás subdirectorios correspondientes a cada base de datos.
La inicialización de la variable "datadir" se encuentra en el archivo "my.ini".



Eliminación de Bases de Datos:

Puedes eliminar bases de datos con el comando:
DROP DATABASE base2;

También puedes eliminar bases de datos a través del asistente de Workbench. Haz clic derecho sobre la base de datos deseada y elige "Drop Schema...".



Creación de Directorios y Acceso a MySQL desde el CMD:

Crea un directorio en C:\ llamado sql_dba.
Accede al binario de MySQL desde el símbolo del sistema con los comandos proporcionados.



Backup Lógico Usando mysqldump:

Realiza un backup completo de la base con mysqldump.
mysqldump -uroot -p --databases jugos_ventas > c:\mysqladmin\jugos_ventas_full.sql

También puedes excluir ciertas tablas al realizar el backup.
mysqldump -uroot -p --databases jugos_ventas --ignore-table jugos_ventas.facturas > c:\sql_dba\jugos_ventas_sin_facturas.sql

Para más opciones de mysqldump, consulta la documentación oficial.
https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html




Backup Lógico Usando Workbench:
Antes de hacer un backup, bloquea la instancia para evitar modificaciones.

Usa la opción "Data Export" en Workbench para exportar la base.

Puedes exportar toda la base en un archivo o cada tabla en un archivo separado.

Al finalizar, desbloquea la instancia.




Backup Físico:
Crea una carpeta back-up_fisico en C:\sql_dba\.

Copia el archivo my.ini y el contenido del directorio Data de MySQL al directorio creado anteriormente.



Restauración de Backups:
Para restaurar el backup lógico, elimina la base actual, accede a MySQL desde el CMD y ejecuta el archivo de backup.

Para restaurar usando archivos físicos, elimina la base, detén el servicio de MySQL, copia los archivos de backup y reinicia el servicio.

*/


-- COMANDOS DEL CURSO



SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';

SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

SET GLOBAL tmp_table_size = 136700160;



--------------------------------------------------------------



CREATE TABLE df_table (ID INT, NOMBRE VARCHAR(100));

ALTER TABLE df_table ENGINE = MyISAM;

CREATE TABLE df_table1 (ID INT, NOMBRE VARCHAR(100)) ENGINE = MEMORY;

SHOW ENGINES;

CREATE DATABASE base;

SHOW VARIABLES WHERE Variable_Name LIKE '%dir';

CREATE DATABASE base3;

DROP DATABASE base;



--------------------------------------------------------------



LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE;

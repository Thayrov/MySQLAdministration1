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

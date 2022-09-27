.. image:: images/plugins/core.png
  :width: 150px
  :alt: Core
  :align: center

Core
====
A core that connects the whole group, designed to be scalable and simple.

Installations
=============
The developers of voltage group's usually distribute the plugins as phar files or folders. These files can be easily loaded by placing them in your ``plugins`` folder in the server data folder.

Be sure to delete old versions of the plugin and restart the server to see the changes.

Requirements
============
* `PocketMine-MP <https://github.com/pmmp/PocketMine-MP>`__: 4.0.0+
* MySQL
* MongoDB (integrated extension)

Configuration
=============

Config
------
Navigate to ``plugins_data/Core/`` Open ``config.yml``

.. code-block:: yaml

    ranks:
        table: x

    mysql:
        host: XXX.XXX.XXX.XXX
        port: 3306
        username: x
        password: x
        schema: x

    socket:
        host: XXX.XXX.XXX.XXX
        port: 7000
        username: x
        password: x

    mongo:
        host: XXX.XXX.XXX.XXX
        port: 27017
        username: x
        password: x
        schema: x


Permissions
-----------
Allows you to have all the permissions of the plugin

Ranks
^^^^^
+--------------------------+-------------+
| permissions              | description |
+==========================+=============+
| command.rank.permission  | idk         |
+--------------------------+-------------+

Fonctionality
=============
Access to all the documentation on the use of the plugins

MongoDB
-------

Manager
^^^^^^^

.. py:class:: MongoDBManager

    Allows the use of MongDB in async within voltage.

    .. py:staticmethod:: getInstance()

        Is used to retrieve the class MongoDBManager.

    .. py:method:: create(MongoDBThread $thread, ?Closure $onCompletion = null, mixed $data = null) : ?MongoDBThread

        Allows mongodb to be used in a simpler and more optimized environment.

        :param MongoDBThread $thread: Allows to define, add, modify elements to the database in asynchronous mode
        :param Closure $onCompletion: Allows to retrieve the selected elements after the execution of the thread
        :param mixed $data: allows to define a variable without serialization within the thread

    .. py:method:: getSchema() : string

        Allows to retrieve the name of the used schema.

Thread
^^^^^^

.. py:class:: MongoDBThread

    Allows to execute the use of mongo within the same thread

    .. py:method:: call(mixed $data) : void

        Allows you to call the call inserter function in the constructor

        :param mixed $data: Allows to define a variable without serialization within the thread

    .. py:method:: getOnRun() : ?Closure

        Allows to retrieve the function inserted in the constructor

    .. py:method:: getData() : mixed

        Recovering entered data

    .. py:method:: setMongoData(array $data) : void

        Save the mongo database in order to use it

        :param array $data: A array with all the connection data

Exemple
^^^^^^^

.. code-block:: php

    MongoDBManager::getInstance()->create(new MongoDBThread(function (MongoDBThread $worker, Client $client, mixed $data, string $schema) {
        //code with mongoDB/Client
    }),function (mixed $result, Server $server) {
        //code after the thread
    }, $data);

MySQL
-------

Manager
^^^^^^^

.. py:class:: MysqlManager

    Allows the use of Mysql in async within voltage.

    .. py:staticmethod:: getInstance()

        Is used to retrieve the class MysqlManager.

    .. py:method:: create(MysqlThread $thread, Closure $onCompletion = null, mixed $data = null): ?MysqlThread

        Allows mysql to be used in a simpler and more optimized environment.

        :param MysqlThread $thread: Allows to define, add, modify elements to the database in asynchronous mode
        :param Closure $onCompletion: Allows to retrieve the selected elements after the execution of the thread
        :param mixed $data: allows to define a variable without serialization within the thread

Thread
^^^^^^

.. py:class:: MysqlThread

    Allows to execute the use of mysql within the same thread

    .. py:method:: call(mixed $data) : void

        Allows you to call the call inserter function in the constructor

        :param mixed $data: Allows to define a variable without serialization within the thread

    .. py:method:: getOnRun() : ?Closure

        Allows to retrieve the function inserted in the constructor

    .. py:method:: getData() : mixed

        Recovering entered data

    .. py:method:: setMysqlData(array $data) : void

        Save the mysql database in order to use it

        :param array $data: A array with all the connection data

Query
^^^^^

.. py:class:: MysqlQuery

    Allows to execute multiQuery or normal Query easily

    .. py:method:: execute(mysqli $mysqli) : ?array

        Allows to execute the query

        :param mysql $mysqli: A mysqli for the connection data

    .. py:method:: multiQuery(mysqli $mysqli): ?array

        Allows to execute the multi query

        :param mysql $mysqli: A mysqli for the connection data

    .. py:method:: prepareQuery(string $query, mysqli $mysqli) : ?array

        Allows you to prepare a query

        :param string $query: A query SQL in the string
        :param mysql $mysqli: A mysqli for the connection data

    .. py:method:: getQuery(): string

        Sql query retrieval

Exemple
^^^^^^^

.. code-block:: php

    MysqlManager::getInstance()->create(new MysqlThread(function(MysqlThread $worker, mysqli $mysqli, mixed $data, string $schema) {
        //code with mysqli
        $query = new MysqlQuery("SQL DATA");
        $datas = $query->execute($mysqli);
        if (isset($datas[0])) {
            $results[0] = array_values($datas[0]);
        }
    }),function (mixed $result, Server $server) {
        //code after the thread
    }, $data);
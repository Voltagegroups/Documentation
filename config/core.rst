.. image:: images/plugins/core.png
  :width: 300px
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
.. py:class:: MongoDBManager

   Allows the use of MongDB in async within voltage.

   .. py:staticmethod:: getInstance()

      is used to retrieve the class MongoDBManager.

   .. py:method:: create(MongoDBThread $thread, ?Closure $onCompletion = null, mixed $data = null) : ?MongoDBThread

      allows mongodb to be used in a simpler and more optimized environment.

      :param MongoDBThread param1: Allows to define, add, modify elements to the database in asynchronous mode
      :param Closure param2: Allows to retrieve the selected elements after the execution of the thread
      :param mixed param3: allows to define a variable without serialization within the thread


exemple

.. code-block:: php

    IN PROGRESSE
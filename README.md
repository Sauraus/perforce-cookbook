Description
===========

Install perforce (client and/or server) with a config file sourced in the user's shell profile.

Requirements
============

Chef 11

Attributes
==========

p4 (client)
* owner - System user in who's home directory the configs will be stored. File permissions use this user as well.
* group - System group of the owner above.
* install_dir - Where the p4 executable will be placed.
* config_filename - Configuration file name.
* host - Perforce server hostname.
* port_num - Port number of Perforce Server.
* port  - Perforce server (eg. perforce-server:1666).
* user  - Perforce user. Defaults to owner.
* password - Perforce password.
* diff
* editor
* merge
* client
* charset
* commandcharset
* language
* version - Perforce client version.

p4d (server)
* owner] - Owner of the p4d executable.
* group - Group of the p4d executable.
* install_dir - Where the p4d executable will be placed.
* journal - Contains 3 attributes
    * enabled - Whether journaling is active.
    * dir - The directory in which the journal file will be stored in.
    * file - The journal file name.
* log_dir - The directory in which the log file will be stored.
* log_file - The log file name
* audit - Contains 3 attributes
    * enabled - Whether audit is active.
    * dir - The directory in which the audit file will be stored in.
    * file - The audit file name.
* root_dir - The Perforce root directory where the db and depot files are stored.
* depot_dir - Split the depots by symbolically linking them to a different directory. If this is not wanted, set the value to the value of the root_dir.
* depots - Creates and symbolically links the depot folders. This will only occur if the root_dir and depot_dir values differ.
* port - What port the Perforce server should run on.
* version - What version of the server to install.
* pidfile - The path to the pidfile.


Usage
=====

Include the recipe and set the attributes above as node or environment attributes

    include_recipe 'perforce'

Authors
==================

- Author:: Josiah Kiehl <josiah@bluepojo.com>
- Author:: Kyle Allan <kallan@riotgames.com>
- Author:: Brandon Chothia <brandon@roblox.com>
- Author:: Antek Baranski <abaranski@roblox.com>

- Copyright:: 2012, Riot Games
- Copyright:: 2013, Roblox, Inc

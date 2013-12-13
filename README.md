Description
===========

Install perforce with a config file sourced in the user's shell profile.

Requirements
============

Chef 10

Attributes
==========

* owner - System user in who's home directory the configs will be stored. File permissions use this user as well.
* group - System group of the owner above.
* port  - Perforce server (eg. perforce-server:1666)
* user  - Perforce user. Defaults to owner.
* password - Perforce password.
* diff
* editor
* merge
* client
* charset
* commandcharset
* language
* host

Usage
=====

Include the recipe and set the attributes above as node or environment attributes

    include_recipe 'perforce'

Authors
==================

- Author:: Josiah Kiehl <josiah@bluepojo.com>
- Author:: Kyle Allan <kallan@riotgames.com>
- Author:: Brandon Chothia <brandon@roblox.com>

- Copyright:: 2012, Riot Games
- Copyright:: 2013, Roblox, Inc
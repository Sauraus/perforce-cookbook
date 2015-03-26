# Perforce Cookbook Change Log

##2.0.2
* Update p4d checksum for latest update on Perforce ftp server

##2.0.1
* Fix path for .p4config file to be ~/.p4config

##2.0.0
* Add option to name server, needed for replication
* Remove the shell script for P4 settings, this causes to much trouble in automation

##1.1.0
* Enable override of P4USER in perforce.sh
* Cleanup some of the export P4xxxx

##1.0.2
* Handle p4web restarts gracefully with no PID file present

##1.0.1
* Tune p4web config

##1.0.0
* Move to BerkShelf 3
* Added p4web to the install options
* refactor perforce.sh creation
* cleanup p4d erb template

##0.0.11
* Add auth server delegation option

##0.0.10
* Removed AD auth this should be done in a wrapper cookbook

##0.0.9
* p4auth AD

##0.0.8
* Added checksum to remote_file resource

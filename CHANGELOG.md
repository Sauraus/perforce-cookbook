# Perforce Cookbook Change Log

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

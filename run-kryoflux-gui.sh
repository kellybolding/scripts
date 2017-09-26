#!/bin/bash
#runs kryoflux gui by invoking java
#to reuse: edit file path to match your installation location

ln -s /home/bcadmin/Additional_Software/kryoflux_2.6_linux/dtc cddtc

cd cddtc

java -jar kryoflux-ui.jar

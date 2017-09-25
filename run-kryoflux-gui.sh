#!/bin/bash
#runs kryoflux gui by invoking java

ln -s /home/bcadmin/Additional_Software/kryoflux_2.6_linux/dtc cddtc

cd cddtc

java -jar kryoflux-ui.jar

#!/bin/bash

#source /usr/local/etc/ocp4.config
#cd /home/student/DO288/labs/trigger-builds
VERSION="original"
sudo  skopeo copy oci-archive:php-73-ubi8-${VERSION}.tar.gz docker://quay.io/omougoue/php-73-ubi8:latest

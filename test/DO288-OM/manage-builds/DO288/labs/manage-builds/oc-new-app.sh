#!/bin/bash

#source /usr/local/etc/ocp4.config

oc new-app \
    --name jhost \
    -i redhat-openjdk18-openshift:1.8 \
    --context-dir java-serverhost \
    https://github.com/policier/DO288-apps#manage-builds1 


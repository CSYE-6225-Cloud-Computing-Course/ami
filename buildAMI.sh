#!/bin/bash

packer build \
-var-file=vars.json\
 packer_build.json
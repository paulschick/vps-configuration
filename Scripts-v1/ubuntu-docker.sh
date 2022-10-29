#!/bin/bash

POST_INSTALL="$HOME"/source/Cloud-Development/vps-configuration/post-install
docker run -it -v $POST_INSTALL:/home ubuntu:jammy /bin/bash

#!/bin/sh
docker run -d --name discourse_sso -p 5000:5000 discourse_sso:latest

#!/bin/bash

docker-compose exec www python cavedb/manage.py "$@"

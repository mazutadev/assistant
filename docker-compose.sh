#!/bin/bash

export $(grep -v '^#' .env | xargs)

sudo docker-compose up --build
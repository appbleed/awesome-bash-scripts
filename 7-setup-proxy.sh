#!/bin/bash

set -e

# RUN THIS SCRIPT ONLY ONCE AFTER DEPLOYMENT IS DONE for all 6 CCP components Either BY CICD or Manual

export http_proxy=http://domain%5Cusername:password@proxy.example.com:8080
export HTTP_PROXY=http://domain%5Cusername:password@proxy.example.com:8080
export https_proxy=http://domain%5Cusername:password@proxy.example.com:8080
export HTTPS_PROXY=http://domain%5Cusername:password@proxy.example.com:8080

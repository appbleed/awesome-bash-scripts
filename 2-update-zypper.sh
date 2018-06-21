#!/bin/bash

set -e

echo "Refreshing repositories..."
sudo -E zypper ref

echo "Updates packages..."
sudo -E zypper up
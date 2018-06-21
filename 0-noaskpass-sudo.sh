#!/bin/bash

set -e

###### RUN ONLY ONCE ##########
# Don't prompt to ask sudo password when you login as a current user who has root access

if sudo cat /etc/sudoers |
  grep -xqFe "$USER ALL=(ALL) NOPASSWD:ALL"
then
  echo "$USER already set for no ask password"
else
  echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo env EDITOR="tee -a" visudo
  echo "$USER has been set for no ask password"
fi

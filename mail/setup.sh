#!/bin/bash

# Set up for the mail server
#
set -e

set -x

# Reload postfix to accept the changes

/etc/init.d/postfix start

#!/bin/bash
set -e # Exit on error

bundle check || bundle install
bin/rails db:prepare

exec "$@" # Execute the command passed to the script (the CMD in Dockerfile)

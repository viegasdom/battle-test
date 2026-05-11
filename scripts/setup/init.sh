#!/bin/bash
set -e

echo "Setting up environment..."
apt-get update -qq > /dev/null
apt-get install -y -qq curl jq > /dev/null
echo "Environment ready!"

#!/bin/bash
dconf load / < "$(dirname "$0")/settings.dconf"
echo "GNOME settings restored~"

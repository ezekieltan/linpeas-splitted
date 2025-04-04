#!/bin/bash

default_filename="lp.sh"
linpeas_filename="${1:-$default_filename}"
random_string="${2:-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)}"

echo "Downloading linpeas"
wget -q https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh -O "$linpeas_filename"

echo "Downloading splitter"
wget -q https://raw.githubusercontent.com/ezekieltan/linpeas-splitted/refs/heads/main/linpeas-splitter.sh -O linpeas-splitter.sh

echo "Splitting..."
chmod +x linpeas-splitter.sh
./linpeas-splitter.sh "$linpeas_filename" "lp_output" "$random_string"

echo "Cleaning up..."
rm -rf "$linpeas_filename"
rm -rf linpeas-splitter.sh

echo "Done!"

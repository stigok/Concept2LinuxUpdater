#!/bin/bash
set -euo pipefail

DESTINATION="${HOME}/Downloads/Concept2/Firmware"
FILES=$(awk -F '\t' '{print $5}' ./current_versions.txt)

mkdir -p "${DESTINATION}"
for file in $FILES
do
  echo "Downloading https://firmware.concept2.com/files/${file}..."
  curl --output-dir "${DESTINATION}" -O "https://firmware.concept2.com/files/${file}"
done

echo "Done downloading firmware to ${DESTINATION}!"

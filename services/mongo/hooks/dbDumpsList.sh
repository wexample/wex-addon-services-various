#!/usr/bin/env bash

mongoDbDumpsList() {
  local FILES
  local DIR=.wex/mongo/dumps
  FILES=$(find "${DIR}" -maxdepth  1 -exec basename {} \;)

  # Initialize an empty array
  FILES_TO_KEEP=()

  # Loop through each file
  for FILE in ${FILES[@]}; do
      # Check if the file is a directory or ends with .zip
      if [ -d "${DIR}/${FILE}" ] || [[ ${FILE} =~ \.zip$ ]]; then
          FILES_TO_KEEP+=(${FILE})
      fi
  done

  printf "%s\n" "${FILES_TO_KEEP[@]}"
}

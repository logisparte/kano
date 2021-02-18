#!/bin/sh

find_and_replace_in_directory() {
  DIRECTORY="$1"
  ORIGINAL_STRING="$2"
  REPLACEMENT_STRING="$3"

  find "$DIRECTORY" -type f -exec sh -c \
    'FILE="$1";
    SUBSTITUTION="$2";
    LANG=C sed "$SUBSTITUTION" "$FILE" > "$FILE.replacing";
    mv "$FILE.replacing" "$FILE"' _ {} "s/$ORIGINAL_STRING/$REPLACEMENT_STRING/g" \;
}

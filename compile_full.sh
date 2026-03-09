#!/usr/bin/env bash
# Vollständiger Build: zweimal pdflatex für stabile Querverweise + Copy nach Nextcloud
set -e
FILE="${1:-Mathe_Aufgaben.tex}"
DIR="$(dirname "$FILE")"
BASE="$(basename "$FILE")"
BASENAME="${BASE%.tex}"
NEXTCLOUD="/home/martin/Nextcloud/06_Lernen/Skripte"

cd "$DIR"
pdflatex -interaction=nonstopmode "$BASE"
pdflatex -interaction=nonstopmode "$BASE"

if [ -d "$NEXTCLOUD" ]; then
    cp "${BASENAME}.pdf" "$NEXTCLOUD/"
    echo "Kopiert nach $NEXTCLOUD/"
fi

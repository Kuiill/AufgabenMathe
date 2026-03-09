#!/usr/bin/env bash
# Schneller Build: einmal pdflatex, keine Nachbearbeitung
# Aufruf: ./compile_fast.sh [Datei.tex]
# Subfiles: ./compile_fast.sh stochastik/grundlagen.tex
set -e
FILE="${1:-Mathe_Aufgaben.tex}"
DIR="$(dirname "$FILE")"
BASE="$(basename "$FILE")"
cd "$DIR"
pdflatex -interaction=nonstopmode "$BASE"

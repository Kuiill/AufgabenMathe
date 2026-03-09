#!/usr/bin/env bash
# Hilfsdateien entfernen (nur auf explizite Anforderung ausführen)
find . -maxdepth 2 \( \
    -name "*.aux" -o -name "*.log" -o -name "*.toc" -o -name "*.out" \
    -o -name "*.fls" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" \
\) -delete
echo "Hilfsdateien gelöscht."

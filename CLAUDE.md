# CLAUDE.md – AufgabenMathe

Aufgaben- und Lösungssammlung für den Mathematikunterricht am OHG Göttingen.
Autor: Martin Polle. Compiler: **pdfLaTeX** (immer).

---

## Dateistruktur

```
Mathe_Aufgaben.tex      ← Masterdatei (nur \input + \subfile-Aufrufe)
preamble.tex            ← Alle Pakete, Befehle, Umgebungen
analysis/               ← Analysis-Subfiles
  grundlagen.tex
  kurvendiskussion1.tex
  extremalrechnung.tex
  kurvendiskussion2.tex
  differentialgleichungen.tex
stochastik/             ← Stochastik-Subfiles
  grundlagen.tex
```

**Subfile-Header:**
```latex
\documentclass[../Mathe_Aufgaben.tex]{subfiles}
\begin{document}
% ... Inhalt ...
\end{document}
```

---

## Umgebungen und Befehle

### Aufgaben-Umgebungen
| Umgebung | Verwendung |
|----------|------------|
| `\begin{kurzaufgaben}{label}` | kurze Aufgaben, mehrspaltig (multicols) |
| `\begin{komplexaufgaben}{label}` | längere Aufgaben |
| `\begin{abituraufgaben}{label}` | Abituraufgaben (grau hinterlegt) |

### Lösungs-Umgebungen
| Umgebung | Verwendung |
|----------|------------|
| `\begin{kurzloesungen}{label}` | Lösungen zu Kurzaufgaben |
| `\begin{komplexloesungen}{label}` | Lösungen zu komplexen Aufgaben |
| `\begin{abiturloesungen}{label}` | Lösungen zu Abituraufgaben |

### Einzel-Aufgaben/-Lösungen
| Befehl | Verwendung |
|--------|------------|
| `\kurzaufgabe[spalten]{text}{teilaufgaben}` | innerhalb kurzaufgaben |
| `\komplexaufgabe{text}{teilaufgaben}` | innerhalb komplexaufgaben |
| `\abituraufgabe{text}{teilaufgaben}` | innerhalb abituraufgaben |
| `\kurzloesung[spalten]{text}{teillösungen}` | innerhalb kurzloesungen |
| `\komplexloesung{text}{teillösungen}` | innerhalb komplexloesungen |
| `\abiturloesung{text}{teillösungen}` | innerhalb abiturloesungen |

### Gliederungs-Wrapper
| Umgebung | Verwendung |
|----------|------------|
| `\begin{loesungssektion}{label}` | Lösungsblock auf Sektionsebene |
| `\begin{loesungsubsektion}{label}` | Lösungsblock auf Subsektionsebene |

### Navigation
- `\zumloesung{aufgabenlabel}` → Link zur Lösung
- `\zurausgabe{aufgabenlabel}` → Link zur Aufgabe

---

## Label-System (KRITISCH)

Format: `\currentCategory\arabic{chapter}.\arabic{section}.\arabic{subsection}.\theexo`

- `\currentCategory` = `A` (Analysis), `S` (Stochastik), `G` (Geometrie)
- `loesungssektion` erzeugt `\section*{}` → **kein** Counter-Update
- Vor jeder `loesungssektion` manuell setzen:
  ```latex
  \setcounter{section}{N}\setcounter{subsection}{0}
  ```

### Stochastik S1 – Counter-Referenz
| Abschnitt | label | setcounter vor loesungssektion |
|-----------|-------|-------------------------------|
| S1.1 Kombinatorik (5 Aufg.) | `sec:kombinatorik` | `\setcounter{section}{1}\setcounter{subsection}{0}` |
| S1.2 Klassische Wahrsch. + Baumdiagramme (21 Aufg.) | `sec:klassWahrsch` | `\setcounter{section}{2}\setcounter{subsection}{0}` |
| S1.3 Mengenoperationen (4 Aufg.) | `sec:mengenoperationen` | `\setcounter{section}{3}\setcounter{subsection}{0}` |
| S1.4 Stochastik als math. Theorie (7 Aufg.) | `sec:stochTheorie` | `\setcounter{section}{4}\setcounter{subsection}{0}` |

Archiv (nicht eingebunden): `stochastik/archiv_von_konkreten_problemen.tex`

---

## Compile-Workflow

```bash
./compile_fast.sh              # einmal pdflatex (schnell)
./compile_full.sh              # zweimal pdflatex + Copy nach Nextcloud
./clean.sh                     # Hilfsdateien löschen (nur auf Anforderung)
```

Hilfsdateien (`.aux`, `.toc` usw.) **nicht** nach jedem Build löschen.

---

## Bekannte LaTeX-Fallstricke

- Unicode `Ω` literal → `$\Omega$`
- `°` in Mathe → `^\circ`
- `€` in Mathe → `\text{€}`
- `✓` → `$\checkmark$`
- `\begin{komplexaufgaben}{}` mit leerem Argument ist ungültig → Label angeben

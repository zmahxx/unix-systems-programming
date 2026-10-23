# Unix Systems Programming Coursework

A grouped collection of four small assignments using Bash, sed, AWK, C, POSIX process APIs, and Make.

## Contents

- `a1-shell-records/` — menu and helper scripts for record operations.
- `a2-bash-sed/` — Bash and sed text-processing artifacts.
- `a3-shell-awk/` — shell orchestration and AWK analysis.
- `a4-process-launcher/` — a bounded C process launcher using `fork`, `execvp`, and `waitpid`.

These are separate coursework assignments, not a general-purpose Unix shell. The launcher lacks shell quoting, pipes, redirection, and job control; its whitespace trimming and argument handling have known limitations. A1 and A3 expect particular working-directory and input layouts. Assignment prompts, reports, archives, sample data, and unrelated coursework are not included.

## Attribution, validation, and license

The owner confirms this was individual coursework, that they wrote essentially all substantive implementation, and that they know of no course rule prohibiting publication. The recovered archive path contained a student identifier, removed from this copy; it is provenance context, not the basis for authorship. The course code is not established by the targeted records, and no assignment prompt or identifiable instructor starter code is present in the staged source. No third-party libraries or data are vendored. No build or runtime checks were run. No project license is added.

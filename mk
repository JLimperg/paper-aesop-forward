#!/bin/bash

ROOT="$(dirname "$0")"

podman run --rm \
  --mount=type=bind,source="$ROOT",destination=/work \
  --workdir /work \
  registry.gitlab.com/islandoftex/images/texlive:TL2024-2024-12-01-full \
  latexmk -pdf -recorder \
  -latexoption="-interaction nonstopmode -shell-escape" \
  -outdir=build paper.tex $@

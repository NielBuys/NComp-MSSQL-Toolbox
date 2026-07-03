#!/usr/bin/env bash
#
# Compiles the Linux (GTK2, x86_64) binary of NComp SQL Toolbox with lazbuild.
# Runs inside the container defined by docker/Dockerfile; the repository is
# bind-mounted at /src and the binary is copied to ./Output/linux.
set -euo pipefail

# Locate the highest installed Lazarus directory (version-independent).
LAZDIR="$(ls -d /usr/lib/lazarus/*/ 2>/dev/null | sort -V | tail -1)"
LAZDIR="${LAZDIR%/}"
if [ -z "$LAZDIR" ]; then
  echo "ERROR: could not find a Lazarus installation under /usr/lib/lazarus" >&2
  exit 1
fi
echo "Using Lazarus dir: $LAZDIR"

# SQLDBLaz and SDFLaz ship with Lazarus but are not registered in a fresh
# lazbuild config, so build (register) them first; then the project resolves.
for pkg in sqldblaz.lpk sdflaz.lpk; do
  LPK="$(find "$LAZDIR" -name "$pkg" 2>/dev/null | head -1 || true)"
  if [ -n "${LPK:-}" ]; then
    echo "Registering package: $LPK"
    lazbuild --lazarusdir="$LAZDIR" "$LPK"
  else
    echo "WARNING: $pkg not found under $LAZDIR" >&2
  fi
done

# Build the project. Default widgetset on Linux is GTK2.
lazbuild --lazarusdir="$LAZDIR" --build-mode=Default CompareMSSQLTables.lpi

# Collect the binary next to the other build outputs.
mkdir -p Output/linux
cp -f CompareMSSQLTables Output/linux/CompareMSSQLTables
echo "----------------------------------------------------------------"
echo "Built: Output/linux/CompareMSSQLTables"
file Output/linux/CompareMSSQLTables || true

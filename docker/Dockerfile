# Build environment for the Linux (GTK2, x86_64) binary of NComp SQL Toolbox.
#
# It installs Lazarus + Free Pascal from the Ubuntu repositories, which brings
# the LCL, SQLDBLaz and SDFLaz packages the project depends on. The database
# client libraries (FreeTDS / MySQL / SQLite) are NOT needed to compile - the
# sqldb connectors load them dynamically at run time - so the image stays lean.
#
# Usage (from the repository root):
#   docker compose run --rm build-linux
# The resulting ELF binary is written to ./Output/linux/CompareMSSQLTables
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        lazarus \
        lcl-gtk2 \
        fpc \
        gcc \
        binutils \
        ca-certificates \
        file \
    && rm -rf /var/lib/apt/lists/*

COPY docker/build-linux.sh /usr/local/bin/build-linux.sh
RUN chmod +x /usr/local/bin/build-linux.sh

WORKDIR /src
ENTRYPOINT ["/usr/local/bin/build-linux.sh"]

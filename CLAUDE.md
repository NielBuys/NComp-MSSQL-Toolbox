# CLAUDE.md

## This is a public repository

This repository is public on GitHub, and anyone can read everything in it. Its releases and
installers are public downloads too.

**Nothing private goes into the repository or the releases.** That covers:

- source code and code comments
- docs: README, CLAUDE.md, build notes
- commit messages, tags, branch names, pull request and issue text
- release notes and release assets (installers, `.deb` packages)
- screenshots, sample data, test data, example SQL and CSV files
- error messages and text shown in the app
- installer and packaging scripts (`MSSQLCompare.iss`, `debpackage/`, `docker/`)

**What counts as private:**

- **People:** real names, email addresses, phone numbers or usernames of staff, customers or
  anyone else. Use clearly made-up examples (`Sam Sample`, `sam@example.com`).
- **Customers and clients:** their names, databases, table or column names, record ids, data or
  figures. Example SQL and screenshots use made-up tables and data.
- **Internal details:** server or host names, internal IP addresses, database names, connection
  strings, internal repository URLs, and paths on our own PCs.
- **Secrets:** passwords, API keys, tokens or certificates, whether real or real-looking. This
  includes anything copied from the app's settings file (see below).

**The app's settings file holds real connection details.** Saved connections, passwords
(only lightly obscured), recent SQL and project settings are kept per user in
`%LOCALAPPDATA%\<exe name>\<exe name>.cfg` on Windows and `~/.config/<exe name>.cfg` on Linux.
Never copy that file, or anything from it, into the repository, a commit, an issue or a release.

**Check before it goes public:** before committing, tagging or publishing a release, search the
diff, the release notes and anything being uploaded for names, email addresses, IP addresses,
host names, paths and key-like strings. If something public really must name a person or a
customer, ask first.

#!/usr/bin/env sh
# shellcheck shell=sh
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# mounting_nas.sh
#
# Interactive entry point for mounting the lab's network storage.
# Prompts for which storage solution(s) to mount and delegates to
# mount_bandicoot.sh (Isilon, CIFS/SMB) and/or mount_koala.sh
# (PetaLibrary/Alpine, sshfs), which live alongside this script.
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

set -eu
# -e: exit immediately on any error
# -u: treat unset variables as an error

echo "Which NAS would you like to mount?"
echo "  1) bandicoot (Isilon)"
echo "  2) koala (PetaLibrary / Alpine)"
echo "  3) both"
printf "Enter choice [1-3]: " >/dev/tty
read -r CHOICE </dev/tty

case "$CHOICE" in
    1)
        curl https://raw.githubusercontent.com/WayScience/playbooks/refs/heads/main/internal/mount_bandicoot.sh | sh

        ;;
    2)
        curl https://raw.githubusercontent.com/WayScience/playbooks/refs/heads/main/internal/mount_koala.sh | sh

        ;;
    3)
        curl https://raw.githubusercontent.com/WayScience/playbooks/refs/heads/main/internal/mount_bandicoot.sh | sh
        curl https://raw.githubusercontent.com/WayScience/playbooks/refs/heads/main/internal/mount_koala.sh | sh

        ;;
    *)
        echo "✗ Invalid choice: $CHOICE" >&2
        exit 1
        ;;
esac

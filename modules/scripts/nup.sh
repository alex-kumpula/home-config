#!/usr/bin/env bash

set -euo pipefail

FLAKEPATH="$HOME/Documents/nix-configs/pinned-nix-configs"
FLAKEHOST="alex-laptop"
FLAKEHOME="alex"

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -s    Rebuild system config"
    echo "  -h    Rebuild home config"
    echo "  -f    Update flake (default on if either -s or -h is used)"
    echo "  -n    Skip flake update"
    echo "  -a    Do both system and home (default if no -s/-h given)"
    echo "  -?    Show this help"
    exit 1
}

do_system=false
do_home=false
do_flake=true

# Parse options
while getopts "shfan" opt; do
    case "$opt" in
        s) do_system=true ;;
        h) do_home=true ;;
        f) do_flake=true ;;
        n) do_flake=false ;;
        a) do_system=true; do_home=true ;;
        ?) usage ;;
    esac
done

# Default to both if nothing specified
if ! $do_system && ! $do_home; then
    do_system=true
    do_home=true
fi

cd "$FLAKEPATH"

if $do_flake; then
    echo "🔄 Updating flake... 🔄"
    if nix flake update; then
        echo "✅ Flake update successful! ✅"
        if git diff --quiet flake.lock; then
            echo "ℹ️  No changes in flake.lock"
        else
            echo "💾 Committing flake.lock update..."
            git add flake.lock
            git commit -m "Update flake.lock ($(date +%Y-%m-%d))"
            if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
                echo "📤 Pushing to remote..."
                git push
            else
                echo "⚠️  No upstream branch set, skipping push"
            fi
        fi
    else
        echo "❌ Flake update failed. ❌"
        exit 1
    fi
    echo ""
fi

if $do_system; then
    echo "🔨 Rebuilding and switching system configuration for host $FLAKEHOST... 🔨"
    if sudo nixos-rebuild switch --flake ".#$FLAKEHOST"; then
        echo "✅ System successfully rebuilt and switched! ✅"
    else
        echo "❌ System rebuild failed. ❌"
        exit 1
    fi
    echo ""
fi

if $do_home; then
    echo "🔨 Rebuilding and switching home configuration for user $FLAKEHOME... 🔨"
    if home-manager switch --flake ".#$FLAKEHOME"; then
        echo "✅ Home successfully rebuilt and switched! ✅"
    else
        echo "❌ Home rebuild failed. ❌"
        exit 1
    fi
    echo ""
fi


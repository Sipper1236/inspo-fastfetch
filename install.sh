#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/inspo-fastfetch"
bin_dir="$HOME/.local/bin"

for dependency in python3 fastfetch; do
    if ! command -v "$dependency" >/dev/null 2>&1; then
        printf 'Missing dependency: %s\n' "$dependency" >&2
        exit 1
    fi
done

mkdir -p "$data_dir" "$bin_dir"
install -m 755 "$repo_dir/bin/inspo-fetch" "$bin_dir/inspo-fetch"
install -m 644 "$repo_dir/assets/artwork.png" "$data_dir/artwork.png"
install -m 644 "$repo_dir/preview.conf" "$data_dir/preview.conf"
# Keep existing customizations when reinstalling.
if [[ ! -f "$data_dir/config.jsonc" ]]; then
    install -m 644 "$repo_dir/config.jsonc" "$data_dir/config.jsonc"
fi
printf 'Installed. Run %s/inspo-fetch in Kitty.\n' "$bin_dir"
printf 'Config: %s/config.jsonc\n' "$data_dir"
printf 'Add ~/.local/bin to PATH if needed. Shell startup is opt-in; see README.md.\n'

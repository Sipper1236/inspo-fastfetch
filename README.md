# Inspo Fastfetch

A recreated Fastfetch layout with a pink-haired figure, silver filigree, and a
long ornamental sword underneath live system information.

Inspired by [“i dont really know” by u/kleksjonasz on r/fastfetch](https://www.reddit.com/r/fastfetch/comments/1wppsos/i_dont_really_know/).
Credit to the original poster for the composition and inspiration. This is a
recreation, not the original author's dotfiles.

![Recreated character and sword artwork](assets/artwork.png)

## How it works

`kitten icat` places the transparent artwork behind the text with a negative
z-index. Fastfetch runs with its logo disabled, and the renderer positions its
live output inside the ornament. Terminal cell dimensions determine the scale.
The image contains no system information.

## Requirements

- Linux, Python 3, and Fastfetch
- Kitty with the `kitten` command available
- A Nerd Font for the row icons; the preview uses FiraCode Nerd Font

Small terminals, redirected output, and other terminals fall back to plain text.
The artwork layout supports up to nine output rows; extra rows use plain text.

## Install

```sh
git clone https://github.com/Sipper1236/inspo-fastfetch.git
cd inspo-fastfetch
./install.sh
inspo-fetch
```

Make sure `~/.local/bin` is on your PATH. The installer keeps its files under
`~/.local/share/inspo-fastfetch` (or `$XDG_DATA_HOME/inspo-fastfetch`) and installs
the command into `~/.local/bin`. It does not change your default Fastfetch config
or shell startup. Reinstalling preserves the installed config.

You can also try it directly from the checkout:

```sh
./bin/inspo-fetch
```

For a separate preview with the included font and background settings:

```sh
kitty --config ./preview.conf ./bin/inspo-fetch --preview
```

The preview adds reference-style prompts and waits for Enter before closing.
Ordinary `inspo-fetch` returns to your real shell prompt.

## Shell setup

For fish, add this to your user config:

```fish
alias ff 'inspo-fetch'
if status is-interactive
    inspo-fetch
end
```

For Bash or Zsh, add `alias ff='inspo-fetch'` to your interactive shell config.
Call `inspo-fetch` there as well if you want it shown on terminal startup.
Avoid adding a second startup call if your desktop already runs Fastfetch.

## Customize

Edit `~/.local/share/inspo-fastfetch/config.jsonc` after installation, or
`config.jsonc` in the checkout. The default rows are OS, kernel, window manager,
shell, terminal, CPU, GPU, memory, and uptime. The shell row uses `$SHELL`;
the terminal row reports the installed Kitty version.

Arguments pass through to Fastfetch using the included config and plain output:

```sh
inspo-fetch --format json
```

For a different font, change `font_family` in `preview.conf` or your Kitty config.
The preview settings are optional and do not change your desktop theme.

## Remove

Delete `~/.local/bin/inspo-fetch` and the `inspo-fastfetch` data directory, then
remove any aliases or startup calls you added.

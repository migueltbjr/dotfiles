# shellcheck shell=bash

# This file runs once at login.

# shellcheck disable=SC1091
. "${XDG_CONFIG_HOME:-"${HOME}/.config"}/zsh/.xdg.local"

# Force app to use XDG_CONFIG
export AZURE_CONFIG_DIR="${XDG_CONFIG_HOME}/azure"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export CODEX_HOME="${XDG_CONFIG_HOME}/codex"
export CLAUDE_CONFIG_DIR="${XDG_CONFIG_HOME}/claude"
export GEMINI_CLI_HOME="${XDG_CONFIG_HOME}/gemini"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export DAGSTER_HOME="${XDG_CONFIG_HOME}/dagster"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export PYTHON_HISTORY="${XDG_STATE_HOME}/python_history"
export PSQL_HISTORY="${XDG_STATE_HOME}/psql/psql_history"

# Add all local binaries to the system path and make sure they are first.
export PATH="${HOME}/.local/bin:${HOME}/.local/bin/local:${PATH}"

# Confiure Mise (programming language run-time manager).
export PATH="${XDG_DATA_HOME}/mise/shims:${PATH}"

# Default programs to run.
export EDITOR="nvim"
export DIFFPROG="nvim -d"

# Add colors to the less and man commands.
export LESS=-R
LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_ue
export LESS_TERMCAP_mb=$'\e[1;31mm'   # begin blinking
export LESS_TERMCAP_md=$'\e[1;36m'    # begin bold
export LESS_TERMCAP_us=$'\e[1;332m'   # begin underline
export LESS_TERMCAP_so=$'\e[1;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_me=$'\e[0m'       # end mode
export LESS_TERMCAP_ue=$'\e[0m'       # end underline
export LESS_TERMCAP_se=$'\e[0m'       # end standout-mode

# Configure GPG.
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"

# Configure pass, Docker Desktop on Linux uses this tool and while I have used
# it for years in the past, I've moved to using KeePassXC.
export PASSWORD_STORE_DIR="${XDG_CONFIG_HOME}/password-store"

# Configure delta (diffs) defaults.
# https://dandavison.github.io/delta/environment-variables.html
export DELTA_FEATURES="diff-so-fancy"

# Configure zsh-vi-mode.
export ZVM_NORMAL_MODE_CURSOR="${ZVM_CURSOR_BLOCK}"
export ZVM_INSERT_MODE_CURSOR="${ZVM_CURSOR_BEAM}"

# Load local settings if they exist.
# shellcheck disable=SC1091
if [ -f "${XDG_CONFIG_HOME}/zsh/.zprofile.local" ]; then . "${XDG_CONFIG_HOME}/zsh/.zprofile.local"; fi

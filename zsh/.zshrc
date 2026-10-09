# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS

# Use ~/.config for app configs, like on Linux
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"

# User-installed completions (e.g. AeroSpace)
fpath=(~/.local/share/zsh/site-functions $fpath)

# --- Completion: Tab opens a menu you can move through ---
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# --- Default editor ---
export EDITOR=nvim
export VISUAL=nvim

# --- Vim mode ---
bindkey -v
export KEYTIMEOUT=1
# Keep the default shortcuts while typing
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^?' backward-delete-char
# In normal mode, press v to edit the current command in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# --- Prompt ---
eval "$(starship init zsh)"

# --- zoxide: z <part of a folder name> jumps to it ---
eval "$(zoxide init zsh)"

# --- fzf: Ctrl+R fuzzy history search, Ctrl+T insert a file path ---
# fzf: list files with fd, skipping .git and macOS's protected folders
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git --exclude Library --exclude .Trash"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source <(fzf --zsh)

# --- Plugins ---
# Load a plugin from wherever this system's package manager put it:
# MacPorts (/opt/local/share), Arch/Omarchy (/usr/share/zsh/plugins), Homebrew (/opt/homebrew/share)
load_plugin() {
  local name=$1 dir
  for dir in /opt/local/share /usr/share/zsh/plugins /opt/homebrew/share; do
    if [[ -f $dir/$name/$name.zsh ]]; then
      source $dir/$name/$name.zsh
      return
    fi
  done
}
load_plugin zsh-autosuggestions
load_plugin zsh-syntax-highlighting   # must be the last plugin loaded

# --- Start tmux automatically in Ghostty ---
if [[ -z "$TMUX" && "$TERM_PROGRAM" == "ghostty" ]] && command -v tmux >/dev/null; then
  exec tmux new-session -A -s main
fi

# y: open Yazi; when you quit, the shell moves to the folder you were in
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Synology shares on demand:
#   nas              mount Backups
#   nas Sync-Cle     mount Sync-Cle
#   nas -u           unmount Backups
#   nas -u Sync-Cle  unmount Sync-Cle
nas() {
    if [[ "$1" == "-u" ]]; then
        diskutil unmount "/Volumes/${2:-Backups}" && diskutil unmount "/Volumes/${2:-Sync-Cle}"
    else
	open "smb://DS423.local/${1:-Backups}" && open "smb://DS423.local/${1:-Sync-Cle}"
    fi
}

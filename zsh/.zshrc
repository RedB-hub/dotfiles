# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS

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

# --- Start tmux automatically in Ghostty ---
if [[ -z "$TMUX" && "$TERM_PROGRAM" == "ghostty" ]] && command -v tmux >/dev/null; then
  exec tmux new-session -A -s main
fi

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ''
    export PATH="$PATH:/opt/nvim-linux64/bin"
    alias venv="source .venv/bin/activate.fish"
    alias wezterm="flatpak run org.wezfurlong.wezterm"
    alias Tarzan="cd ~/workspace/Tarzan_ws/Tarzan"
    alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
    alias gs="/usr/bin/grim -g (slurp)"
end


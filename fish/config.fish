function random_emoji
    set emojis '-_-' '¯\_(ツ)_/¯' 'O_o' '⸜( ˃ᵕ˂)⸝♡' '\(^ᵕ^)/' '•_•' '>﹏<' 'ಠ_ಠ' '>_<' '\(ᵔᵕᵔ)/'
    set colors 'red' 'green' 'yellow' 'blue' 'magenta' 'cyan'

    set_color (random choice $colors)
    random choice $emojis
    set_color normal
end

# print random emoji when shell starts
set fish_greeting (random_emoji)

# don't try to look for a missing command with package manager
function fish_command_not_found; end

# aliases

alias ls 'EXA_COLORS=\'xa=8\' eza --all --icons --group-directories-first'
alias ll 'ls --long --git'
alias code 'code --ozone-platform-hint=auto'
alias vim 'nvim'
alias :q 'exit'


# hydro config
set -g hydro_symbol_prompt ❯
test "$TERM" = linux && set -g hydro_symbol_prompt '>'

set -g hydro_color_pwd green
set -g hydro_color_git magenta
set -g hydro_color_error red
set -g hydro_color_duration --dim white
set -g hydro_cmd_duration_threshold 60000 # 1 min

# vi mode
fish_vi_key_bindings
function fish_mode_prompt; end
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# env
set -gx EDITOR hx
set -gx PNPM_HOME ~/.local/share/pnpm

fish_add_path -g ~/bin ~/.local/bin ~/.cargo/bin $PNPM_HOME

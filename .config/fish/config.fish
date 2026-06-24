set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'

set -gx MASON_LSP_DIR $HOME/.local/mason
set -gx ZIG_BUILD_ERROR_STYLE minimal # `--error-style verbose` for defaults

fish_add_path -g \
    $HOME/.local/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $HOME/.zvm/bin \
    $MASON_LSP_DIR/bin

if status is-interactive
    set fish_greeting
    bind \cx\ce edit_command_buffer

    ###############
    # abbreviations

    abbr -a l     'ls -lah'
    abbr -a dot   'cd ~/.dotfiles/'
    abbr -a dotnv 'cd ~/.config/nvim/'

    abbr -a n     'nvim .'
    abbr -a cvim  'nvim -u NORC'
    abbr -a npack 'nvim "+lua vim.pack.update()"'

    abbr -a zb   'zig build'
    abbr -a zbr  'zig build run'
    abbr -a zbt  'zig build test'
    abbr -a zbp  'zig build -p ~/.local'
    abbr -a zout 'zig-out/bin/*'

    abbr -a tn    'tmux new -s'
    abbr -a ta    'tmux attach -t'
    abbr -a tls   'tmux ls'
    abbr -a tkill 'tmux kill-server'

    abbr -a gs      'git status'
    abbr -a gss     'git status --short'
    abbr -a ga      'git add'
    abbr -a gaa     'git add -A'
    abbr -a gap     'git add --patch'
    abbr -a ga3     'git apply --3way'
    abbr -a gc      'git commit --verbose'
    abbr -a gcm     'git commit -m'
    abbr -a gca     'git commit --amend'
    abbr -a gce     'git commit --amend --no-edit'
    abbr -a gclean  'git clean -df'
    abbr -a gclone1 'git clone --depth 1'
    abbr -a gd      'git diff'
    abbr -a gdc     'git diff --cached'
    abbr -a gdw     'git diff --word-diff'
    abbr -a hd      'hunk diff'
    abbr -a hdc     'hunk diff --cached'
    abbr -a hdw     'hunk diff --watch'
    abbr -a gsh     'git show'
    abbr -a gr      'git restore'
    abbr -a grs     'git restore --staged'
    abbr -a glog    'git log'
    abbr -a gp      'git push'
    abbr -a gpf     'git push --force-with-lease'
    abbr -a gpb     'git push -u origin (git branch --show-current)'
    abbr -a gpl     'git pull'
    abbr -a gpr     'git rebase'
    abbr -a grl     'git reflog --date=iso'
    abbr -a gb      'git blame -C -C -C'
    abbr -a cdr     'cd (git rev-parse --show-toplevel)'
    abbr -a co      'git checkout'


    ###########
    # functions

    function formatted_git_log
        set -l HASH "%C(always,yellow)%h%C(always,reset)"
        set -l RELATIVE_TIME "%C(always,green)%ar%C(always,reset)"
        set -l AUTHOR "%C(always,bold blue)%an%C(always,reset)"
        set -l REFS "%C(always,red)%d%C(always,reset)"
        set -l SUBJECT "%s"
        set -l FORMAT "$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"
        git log --graph --pretty="tformat:$FORMAT" $argv | column -t -s '{' | less -XRS --quit-if-one-screen
    end
    abbr -a gl 'formatted_git_log'

    if type -q gh
        function pr_checkout
            set -l author $argv[1]
            set -l branch (
                gh pr list --author "$author" \
                | fzf --reverse --header 'checkout PR' \
                | awk '{print $(NF-2)}'
            )

            test -n "$branch"; and git checkout "$branch"
        end
        abbr -a po 'pr_checkout'
    end

    function tmux_attach
        set -l sessions (tmux ls 2>/dev/null)
        if test $status -ne 0
            echo "no tmux sessions found, exiting"
            return 1
        end

        set -l session (
            string join \n -- $sessions \
            | fzf --reverse --header 'attach to tmux session' \
            | cut -d: -f1
        )

        test -n "$session"; and tmux attach -t "$session"
    end
    abbr -a ft 'tmux_attach'


    ####################
    # shell integrations

    if type -q cs
        cs --shell fish | source
    end

    if type -q fzf
        fzf --fish | source
    end


    ############
    # git prompt

    set -g __fish_git_prompt_showdirtystate        1
    set -g __fish_git_prompt_showuntrackedfiles    1
    set -g __fish_git_prompt_showcolorhints        1
    set -g __fish_git_prompt_use_informative_chars 1
    set -g __fish_git_prompt_showupstream          informative

    set -g __fish_git_prompt_color_branch         magenta
    set -g __fish_git_prompt_color_invalidstate   red
    set -g __fish_git_prompt_color_stagedstate    green
    set -g __fish_git_prompt_color_dirtystate     red
    set -g __fish_git_prompt_color_untrackedfiles yellow

    set -g __fish_git_prompt_color_cleanstate --bold green
    set -g __fish_git_prompt_char_cleanstate  '✔'
end

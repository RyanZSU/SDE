export TERM=xterm-256color

alias ls='ls -G'
alias scr='screen -aAL'
alias scrx='screen -x'
alias lsscr='screen -ls'
alias sshaws='ssh ubuntu@54.201.216.194'
alias sshgcp='ssh tanjingpan@35.197.86.140'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
    xterm*|vte*)
    PROMPT_COMMAND='printf "\033]0;%s@%s\007" "${USER}" "${HOSTNAME%%.*}"'
    ;;
    screen*)
    PROMPT_COMMAND='printf "\033k%s@%s\033\\" "${USER}" "${HOSTNAME%%.*}"'
    ;;
    *)
    [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
    ;;
    esac

    PS1="\n\[\e[32m\]\u@\h: \[\e[33m\]\$PWD\[\e[35m\]\$(parse_git_branch)\[\e[0m\]\n\\$ "
    # You might want to have e.g. tty in prompt (e.g. more virtual machines)
    # and console windows
    # If you want to do so, just add e.g.
    # if [ "$PS1" ]; then
    #   PS1="[\u@\h:\l \W]\\$ "
    # fi
    # to your custom modification shell script in /etc/profile.d/ directory
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

bind Space:magic-space


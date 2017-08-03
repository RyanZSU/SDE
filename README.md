# Ryan's SDE files

Some codes in .bashrc

    export TERM=xterm-256color

    alias scr='screen -aAL'
    alias scrx='screen -x'
    alias lsscr='screen -ls'


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

      PS1="\n\[\e[32m\]\u@\h: \[\e[33m\]\$PWD\[\e[0m\]\n\\$ "
      # You might want to have e.g. tty in prompt (e.g. more virtual machines)
      # and console windows
      # If you want to do so, just add e.g.
      # if [ "$PS1" ]; then
      #   PS1="[\u@\h:\l \W]\\$ "
      # fi
      # to your custom modification shell script in /etc/profile.d/ directory
    fi

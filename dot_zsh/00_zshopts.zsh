setopt INC_APPEND_HISTORY   # multiple instances append history instead of overwriting
setopt EXTENDED_HISTORY     # include the timestamp in the history
setopt HIST_FIND_NO_DUPS    # don't show duplicates when searching history
setopt GLOB_DOTS            # let files beginning with `.` be matched without explicitly 
                            # specifying the dot.
setopt EXTENDED_GLOB        # more zsh globbing options. see `man zshexpn`
setopt NOMATCH              # if a pattern has no matches, print an error
setopt NO_CORRECT           # don't try to correct mis-spellings
setopt NO_BEEP              # don't beep if something goes wrong
setopt NO_LIST_BEEP

export HISTFILE=$HOME/.zsh_history
export SAVEHIST=1000000000  # 1B commands saved
export HISTORY_IGNORE='(unset *|l[asl](| *)|j *|)'

export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
export LESS=" -R -X -F "
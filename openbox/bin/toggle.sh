#!/usr/bin/env bash

Name=$(basename "$0")
Version="0.1"
_usage() {
    cat <<EOF

 USAGE:
        $Name [OPTIONS] [ADDITIONAL]

 OPTIONS:
      -h,--help         Display this message
      -v,--version      Display script version
      -t,--terminal     Toggle a floating work terminal, no additional options
      -p,--polybar      Toggle the configured polybar session, no additional options
      -c,--compton      Toggle compton or daemon monitoring icon, can use toggle option
      -r,--redshift     Toggle redshift or daemon monitoring icon, can use toggle option
      -f,--caffeine     Toggle caffeine or daemon monitoring icon, can use toggle option

 ADDITIONAL:
      -tg,--toggle      Toggle the program off/on, without this flag a monitor process will be started

EOF
}


toggle_terminal() {
    terminal_command="termite --title=scratch --class=scratch --geometry=1366x300"
    if pgrep --full "$terminal_command" &>/dev/null; then
        pkill --full "$terminal_command"
    else
        exec $terminal_command &
    fi
}


toggle_polybar() {
    if [[ $(pidof polybar) ]]; then
        pkill polybar
    else
        al-polybar-session
    fi
}


toggle_compton() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pidof compton) ]]; then
            al-compositor --stop
        else
            al-compositor --start
        fi
        exit 0
    fi
    on=""
    off=""
    while true; do
        if [[ $(pidof compton) ]]; then
            echo "$on"
        else
            echo "%{F#888888}$off"
        fi
        sleep 2
    done
}


toggle_redshift() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pidof redshift) ]]; then
            pkill redshift
        else
            redshift &
        fi
        exit 0
    fi
    icon=""
    while true; do
        if [[ $(pidof redshift) ]]; then
            temp=$(sed 's/K//g' <<< "$(grep -o '[0-9].*K' <<< "$(redshift -p 2>/dev/null)")")
        fi
        
        if [[ -z $temp ]]; then
            echo " $icon "                # Greyed out (not running)
        elif [[ $temp -lt 4000 ]]; then
          echo "%{F#ED9407} $icon "
        else
          echo " $icon "
        fi
        sleep 2
    done
}


toggle_caffeine() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pidof caffeine) ]]; then
            killall caffeine
        else
            caffeine &
        fi
        exit 0
    fi
    on=""
    off=""
    while true; do
        if [[ $(pidof caffeine) ]]; then
            echo "%{F#0000FF}$on"
        else
            echo "%{F#FF0000}$off"
        fi
        sleep 2
    done
}


# Catch command line options
case $1 in
    -t|--terminal)
        toggle_terminal
        ;;
    -p|--polybar)
        toggle_polybar
        ;;
    -c|--compton)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_compton
        ;;
    -r|--redshift)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_redshift
        ;;
    -f|--caffeine)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_caffeine
        ;;
    -h|--help)
        _usage
        ;;
    -v|--version)
        echo -e "$Name -- Version $Version"
        ;;
    *)
        echo -e "Option does not exist: $1" && _usage && exit 1
esac

exit 0

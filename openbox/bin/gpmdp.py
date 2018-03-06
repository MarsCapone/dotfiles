#!/usr/bin/env python3

import subprocess

def get_output(command):
    res = subprocess.run(command.split(), 
                         stdout=subprocess.PIPE, 
                         stderr=subprocess.PIPE)
    
    def _process(val):
        return val.strip().decode()

    out, err = _process(res.stdout), _process(res.stderr)
    if err != '':
        raise RuntimeError(err)
    else:
        return out

def gpremote(option):
    try:
        out = get_output('gpmdp-remote {}'.format(option))
        if 'usage' in out:
            return None
        else:
            return out
    except RuntimeError as e:
        return None


def main():
    current = gpremote('current')
    status = gpremote('status')
    if current is None or status is None:
        return 'unrecognised'
    if current == '-':
        return ''
    
    stat = ''
    if status == 'Paused':
        stat += '(paused) '
    stat += current

    output = [stat]
    
    return ' '.join(output)


print(main())

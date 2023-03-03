#!/usr/bin/env python3

from subprocess import run, PIPE, check_output, CalledProcessError

def sh(cmd):
    res = run(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE, shell=True, text=True)
    stdout = res.stdout.strip() if res.stdout else None
    stderr = res.stderr.strip() if res.stderr else None
    return stdout, stderr, res.returncode

def fzf(input_items, fzf_args_str):
    input_bytes = '\n'.join(input_items).encode('utf-8')
    try:
        output = check_output(f'fzf {fzf_args_str}', shell=True, input=input_bytes)
    except CalledProcessError as e:
        # fzf will return 130 if nothing is chosen; output will still be empty.
        output = e.output
    return output.decode('utf-8').strip()

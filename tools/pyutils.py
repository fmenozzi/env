#!/usr/bin/env python3

from subprocess import run, PIPE

def sh(cmd):
    res = run(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE, shell=True, text=True)
    stdout = res.stdout.strip() if res.stdout else None
    stderr = res.stderr.strip() if res.stderr else None
    return stdout, stderr, res.returncode

#!/usr/bin/env python3

import argparse
import configparser
import os
import shutil
import subprocess

CWD = os.path.dirname(os.path.realpath(__file__))

# Read symlinks config file from disk. We allow for sections to contain only
# values in order to allow for the [shell] section to contain a simple list of
# shell commands to run post-link. We also change the option transform function
# to ensure that case is respected, which is not how INI files usually work but
# is important for running case-sensitive commands in the [shell] section.
def get_config(config_path):
    config = configparser.ConfigParser(allow_no_value=True)
    config.optionxform = lambda option: option
    config.read(config_path)

    return config

def link(config):
    # Make the actual symlinks. Existing symlinks are rewritten if present.
    if config['links']:
        print('Creating links...')
        symlinks = config['links']
        for symlink in symlinks:
            src = os.path.expanduser(symlink).strip()
            dst = os.path.join(CWD, symlinks[symlink]).strip()
            if os.path.isdir(src):
                # If an existing non-symlink directory already exists for the
                # source, remove it first to avoid creating the symlink inside
                # the existing directory.
                shutil.rmtree(src)
            print('   ', src, '➜', dst)
            subprocess.call(['ln', '-sf', dst, src])

    # Run post-link shell commands.
    if config['shell']:
        print('Running post-link commands...')
        for cmd in config['shell']:
            cmd = cmd.strip()
            print('   ', cmd)
            subprocess.call(cmd.split())

def clean(config):
    if config['links']:
        print('Cleaning links...')
        for symlink in config['links']:
            path = os.path.expanduser(symlink).strip()
            if not os.path.exists(path) or (os.path.isdir(path) and not os.path.islink(path)):
                continue
            print('   ', symlink, 'removed')
            subprocess.call(['unlink', os.path.expanduser(symlink).strip()])

def main(args):
    config = get_config(args.config)

    if args.command == 'link':
        clean(config)
        link(config)
    elif args.command == 'clean':
        clean(config)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('command', choices=['link', 'clean'], help='Command to run')
    parser.add_argument('-c', '--config', help='Config file path', default='symlinks.ini')
    args = parser.parse_args()

    main(args)

import subprocess
import os

# Run single git command
def git(cmd, args=[], stdin=None, stderr=None, shell=False, universal_newlines=False):
    try:
        return subprocess.check_output(["git", cmd] + args, stdin=stdin, stderr=stderr, shell=shell, universal_newlines=universal_newlines).decode("utf-8")
    except:
        return None

# Determine if in git repo
def in_git_repo():
    return git("rev-parse") == ""

# Perform some basic checks on the repo.
def check_repo():
    # We must be in a git repo to do anything.
    assert in_git_repo(), "Must be within git repo"

    # Repo must contain one of (but not both) "master" or "main".
    all_branches = branches()
    assert "main" in all_branches or "master" in all_branches
    assert not ("main" in all_branches and "master" in all_branches), "Cannot have both master and main"

# Get the "main" branch of this repo. Historically this has been called "master"
# but nowadays this seems to be shifting to "main". Here we assume that the
# repo contains exactly one of these branch names.
def main_branch():
    all_branches = branches()
    if "main" in all_branches:
        return "main"
    if "master" in all_branches:
        return "master"
    raise AssertionError("Could not determine the main branch")

# Determine if the given branch has been fully merged into the main branch (and
# can therefore be deleted).
def is_fully_merged_into_main(branch):
    return branch in git('branch', ['--merged', main_branch()])

# Get list of all branches in current directory
def branches():
    branches_with_asterisk = [line.strip() for line in git("branch").splitlines()]
    branches_without_asterisk = list(branches_with_asterisk)
    for idx, branch in enumerate(branches_with_asterisk):
        if branch.startswith("* "):
            branches_without_asterisk[idx] = branch[2:]
    return branches_without_asterisk

# Get current active git branch
def current_branch():
    return git("rev-parse", ["--abbrev-ref", "HEAD"]).strip()

# Get branch's upstream (or current branch if None)
def upstream(branch=None):
    tmp = current_branch()

    if branch:
        git("checkout", [branch, "-q"])

    cmd = "rev-parse"
    args = ["--abbrev-ref", "--symbolic-full-name", "@{upstream}"]
    possible_upstream = git(cmd, args, None, open(os.devnull, "wb"), False, False)
    if possible_upstream:
        possible_upstream = possible_upstream.strip()

    if branch:
        git("checkout", [tmp, "-q"])

    return possible_upstream

# Return list of all remote branch names
def remotes():
    # Exclude remote HEAD
    verbose_remote_branches = [l.strip() for l in git("branch", ["-rvv"]).splitlines() if "HEAD" not in l]

    remote_branches = []

    for verbose_remote_branch in verbose_remote_branches:
        verbose_branch_info = verbose_remote_branch.split()

        name_idx = 1 if verbose_branch_info[0] == "*" else 0

        remote_branches.append("remotes/" + verbose_branch_info[name_idx])

    return remote_branches

# Return all upstreams in a dict (fewer subprocess calls than
# calling upstream(branch) for all branches). Upstream name can
# be None if branch is a remote or if there is no upstream.
def upstreams():
    # Exclude remote HEAD
    verbose_all_branches = [l.strip() for l in git("branch", ["-avv"]).splitlines() if "HEAD" not in l]

    all_remotes = remotes()
    all_upstreams = {}

    for verbose_branch in verbose_all_branches:
        verbose_branch_info = verbose_branch.split()

        name_idx = 1 if verbose_branch_info[0] == "*" else 0

        branch_name = verbose_branch_info[name_idx]

        possible_upstream_name = verbose_branch_info[name_idx+2][1:-1]

        if branch_name.startswith("remotes/"):
            # Remote branch with no upstream
            all_upstreams[branch_name] = None
        elif verbose_branch_info[name_idx+2].startswith("["):
            # Local branch with local or remote upstream
            if "remotes/" + possible_upstream_name in all_remotes:
                possible_upstream_name = "remotes/" + possible_upstream_name
            all_upstreams[branch_name] = possible_upstream_name
        else:
            # Local branch with no upstream
            all_upstreams[branch_name] = None

    return all_upstreams

# Determine whether branch name corresponds to a remote branch
def is_remote(branch):
    return branch.startswith("remotes/")

if __name__ == "__main__":
    tab = "    "

    print("BRANCHES")
    for branch in branches():
        print(tab, branch)
    print()

    print("REMOTES")
    for remote in remotes():
        print(tab, remote)
    print()

    print("UPSTREAMS")
    for branch, upstream in upstreams().iteritems():
        print(tab, branch, upstream)

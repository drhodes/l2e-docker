l2e-docker
==========

A Dockerized version of [latex2edx](https://github.com/mitocw/latex2edx)

Installation
------------

1. Download and install [Docker](https://www.docker.com/community-edition) (free)
2. Open a terminal (_Note: use PowerShell in Windows_) and run the following command:

       docker build -t latex2edx git@github.com:msegado/l2e-docker.git

Usage
-----

1. Open a terminal (_Note: use PowerShell in Windows_) and use the `cd` command to
   navigate to the directory containing your course files
2. Run latex2edx using the following command:

       docker run --rm -v $(pwd):$(pwd) latex2edx [...options]

_Note: latex2edx will only have access to directories within the directory in which you
run it; if you need to read or save files in a parent/sibling directory, first navigate
to the parent directory using `cd` and then run the command above._

Updating
--------

To update latex2edx and its dependencies (including Docker base images) versions, run the
following command:

    docker build --pull --no-cache -t latex2edx git@github.com:msegado/l2e-docker.git

_Note: if you want to try updates without overwriting your current version, you can install
them under a different name; just change `latex2edx` to something else in the command above._

Uninstalling
------------

To remove latex2edx and recover any disk space used[1], run the following commands:

    docker rmi latex2edx
    docker image purge

Optionally, uninstalling Docker should free up any spaced used by both latex2edx and
Docker itself (_unverified!_).

_[1] There is a bug at the time of this writing which may prevent space from being fully
recovered; see https://github.com/docker/for-win/issues/244 for updates._

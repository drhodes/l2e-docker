#!/bin/bash

set -e;

if [ $UID = 0 -a ! -O . ]; then
  groupadd -g $(stat -c %g .) l2e;
  useradd --no-create-home -s '/bin/bash' -u $(stat -c %u .) -g l2e l2e;
  exec su -c "latex2edx $@" l2e;
else
  exec latex2edx $@;
fi

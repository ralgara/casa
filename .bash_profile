#!/usr/bin/env bash

export GOPRIVATE=github.com/ClarabridgeInc/*

source ~/.bashrc

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rafael.algara/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/rafael.algara/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rafael.algara/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/rafael.algara/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
export PATH="/usr/local/sbin:$PATH"

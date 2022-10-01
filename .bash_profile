#!/usr/bin/env bash

export GOPRIVATE=github.com/ClarabridgeInc/*

source ~/.bashrc

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rafael.algara/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/rafael.algara/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rafael.algara/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/rafael.algara/Downloads/google-cloud-sdk/completion.bash.inc'; fi

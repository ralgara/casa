# Casa

Minimalist, portable user toolset for development hosts running Linux. Implemented as a simple home directory template that, bootstrapped via .bashrc, it aims at setting up a fully functional hacking rig by simply:

```
pushd .
cd ~ && [ ! -d git ] && mkdir git
cd git
[ ! -d casa ] && git clone git@bitbucket.org:ralgarat/casa.git
cd ~
[ -f .bashrc ] && cp .bashrc{,.bak}
ln -fs ~/git/casa/.bashrc ~
. ~/.bashrc
popd
```

* Bash configuration (`.bashrc`)
* Emacs Live (`.live-packs`)

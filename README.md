# Emacs for Data Science

## Install

Create eds script

```
#!/bin/bash
emacs -nw -q -l /home/tsu-nera/dotemacs-for-data-science/init.el $1
```

Install packages

```
M-x package-refresh-contents
M-x package-install-selected-packages
```

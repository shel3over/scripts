#!/bin/bash

killall lxpanel
find ~/.cache/menus -name '*' -type f -print0 | xargs -0 rm
lxpanel -p Lubuntu &

#!/bin/bash
echo "[Pre-commit hook] Running package tracking script..." >&2
paru -Qeq > ~/.config/packages/"$(hostnamectl --static)"-packages.txt
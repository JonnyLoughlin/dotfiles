#!/bin/bash
paru -Qeq > ~/.config/packages/"$(hostnamectl --static)"-packages.txt

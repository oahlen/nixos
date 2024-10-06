#!/usr/bin/env bash

rbw unlocked

if [ $? -eq 1 ]
then
    rbw unlock
fi

RESULT=$(rbw list | fuzzel -d)

if [ -n "$RESULT" ]
then
    PASS=$(rbw get "$RESULT")
    wl-copy $PASS
fi

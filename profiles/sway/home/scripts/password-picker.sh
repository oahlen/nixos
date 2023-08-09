#!/usr/bin/env bash

RESULT=$(rbw list | fuzzel -d)

if [ -n "$RESULT" ]
then
    PASS=$(rbw get "$RESULT")
    wl-copy $PASS
fi

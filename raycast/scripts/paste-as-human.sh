#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Paste As Human
# @raycast.mode silent

osascript -e 'tell application "System Events" to keystroke the clipboard as text'


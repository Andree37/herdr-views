#!/bin/sh
# Open an hv view as a herdr pane.
#
# Keybindings can only target a plugin action, so the action calls back into
# herdr to open the pane entrypoint it wants. HERDR_BIN_PATH points at the
# running herdr binary, which keeps this working wherever herdr is installed.
exec "${HERDR_BIN_PATH:-herdr}" plugin pane open \
    --plugin local.herdr-views \
    --entrypoint "${1:-agents}"

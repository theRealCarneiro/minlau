#!/bin/sh

[ -z $DEST_DIR ] && \
	DEST_DIR=/usr/local/bin

[ -z $LICENSE_DIR ] && \
	LICENSE_DIR=/usr/local/share/licenses/minlau

[ -z $ZSH_COMPLETION_DIR ] && \
	ZSH_COMPLETION_DIR=/usr/local/share/zsh/site-functions

[ -z $MAN_DIR ] && \
	MAN_DIR=/usr/local/man/man1

if [ "$1" = "install" ]; then
	install -Dm755 src/minlau "$DEST_DIR/minlau"
	install -Dm644 LICENSE "$LICENSE_DIR/LICENSE"
	install -Dm644 completion/_minlau "$ZSH_COMPLETION_DIR/_minlau"
	install -Dm644 minlau.1 "$MAN_DIR/minlau.1"
elif [ "$1" = "uninstall" ]; then
	rm "$DEST_DIR/minlau"
	rm -r "$LICENSE_DIR"
	rm "$ZSH_COMPLETION_DIR/_minlau"
	rm "$MAN_DIR/minlau.1"
fi

#!/bin/sh

[ -z $PREFIX ] && \
	PREFIX=/usr/local

[ -z $BIN_DIR ] && \
	BIN_DIR=$DESTDIR$PREFIX/bin

[ -z $LICENSE_DIR ] && \
	LICENSE_DIR=$DESTDIR$PREFIX/share/licenses/minlau

[ -z $ZSH_COMPLETION_DIR ] && \
	ZSH_COMPLETION_DIR=$DESTDIR$PREFIX/share/zsh/site-functions

[ -z $MAN_DIR ] && \
	MAN_DIR=$DESTDIR$PREFIX/share/man/man1

if [ "$1" = "install" ]; then
	install -Dm755 src/minlau "$BIN_DIR/minlau"
	install -Dm644 LICENSE "$LICENSE_DIR/LICENSE"
	install -Dm644 completion/_minlau "$ZSH_COMPLETION_DIR/_minlau"
	install -Dm644 minlau.1 "$MAN_DIR/minlau.1"
elif [ "$1" = "uninstall" ]; then
	rm "$BIN_DIR/minlau"
	rm -r "$LICENSE_DIR"
	rm "$ZSH_COMPLETION_DIR/_minlau"
	rm "$MAN_DIR/minlau.1"
fi

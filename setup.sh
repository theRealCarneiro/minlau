#!/bin/sh

[ -z $PREFIX ] && \
	PREFIX=/usr/local

[ -z $BIN_DIR ] && \
	BIN_DIR=$DESTDIR$PREFIX/bin

[ -z $LICENSE_DIR ] && \
	LICENSE_DIR=$DESTDIR$PREFIX/share/licenses/minlau

[ -z $ZSH_COMPLETION_DIR ] && \
	ZSH_COMPLETION_DIR=$DESTDIR$PREFIX/share/zsh/site-functions

[ -z $BASH_COMPLETION_DIR ] && \
	BASH_COMPLETION_DIR=$DESTDIR$PREFIX/share/bash-completion/completions

[ -z $MAN_DIR ] && \
	MAN_DIR=$DESTDIR$PREFIX/share/man/man1

if [ "$1" = "install" ]; then
	echo "install -Dm755 src/minlau "$BIN_DIR/minlau""
	install -Dm755 src/minlau "$BIN_DIR/minlau"

	echo "install -Dm644 LICENSE "$LICENSE_DIR/LICENSE""
	install -Dm644 LICENSE "$LICENSE_DIR/LICENSE"

	echo "install -Dm644 completion/zsh/_minlau "$ZSH_COMPLETION_DIR/_minlau""
	install -Dm644 completion/zsh/_minlau "$ZSH_COMPLETION_DIR/_minlau"

	echo "install -Dm644 completion/bash/minlau "$BASH_COMPLETION_DIR/minlau""
	install -Dm644 completion/bash/minlau "$BASH_COMPLETION_DIR/minlau"

	echo "install -Dm644 minlau.1 "$MAN_DIR/minlau.1""
	install -Dm644 minlau.1 "$MAN_DIR/minlau.1"

elif [ "$1" = "uninstall" ]; then
	echo "rm "$BIN_DIR/minlau""
	rm "$BIN_DIR/minlau"

	echo "rm -r "$LICENSE_DIR""
	rm -r "$LICENSE_DIR"

	echo "rm "$ZSH_COMPLETION_DIR/_minlau""
	rm "$ZSH_COMPLETION_DIR/_minlau"

	echo "rm "$BASH_COMPLETION_DIR/minlau""
	rm "$BASH_COMPLETION_DIR/minlau"

	echo "rm "$MAN_DIR/minlau.1""
	rm "$MAN_DIR/minlau.1"
fi

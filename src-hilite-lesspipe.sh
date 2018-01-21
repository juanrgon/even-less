#! /bin/bash

for source in "$@"; do
    case $source in
	*ChangeLog|*changelog)
            source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=esc.style -i "$source" ;;
	*Makefile|*makefile)
            source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source" ;;
	*.tar|*.tgz|*.gz|*.bz2|*.xz)
            lesspipe "$source" ;;
        *.zsh)  # HACK: source-highlight doesn't seem to work with zsh; use bash instead
            source-highlight --failsafe -f esc --lang-def=sh.lang --style-file=esc.style -i "$source" ;;
        *)
            source-highlight --failsafe --infer-lang -f esc --style-file=esc.style -i "$source" ;;
    esac
done

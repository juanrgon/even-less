# default "less" options
# -S: Don't wrap long lines; truncate them instead
# -R: Show raw character values
# -N: Show line numbers
# -g: Highlight search matches
# -i: Ignore case in searches that do not contain uppercase
export LESS="-R -S -N -g"

# if source-highlight is defined, color the less pages
if command -v source-highlight >/dev/null 2>&1; then
	local this_script_dir=$0:a:h
	export LESSOPEN="| $this_script_dir/src-hilite-lesspipe.sh %s"
else
    local install_instructions
    case $(uname) in
	    Linux)
            install_instructions='sudo apt-get install source-highlight'
            ;;
        Darwin)
            install_instructions='brew install source-highlight'
            ;;
    esac

	print -P '%B%F{yellow}For colored less pages, install source-highlight%f%b'
    print -P '%B%F{yellow}\n    '$install_instructions'\n%f%b'
fi

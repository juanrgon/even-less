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
    '%B%F{magenta}For colored less pages, install source-highlight.%f%b'
fi

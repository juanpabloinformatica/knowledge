#! /usr/bin/bash
set -eu
function set_builtin() {
    echo "hello"
    ls | if grep -Pi "f" <<<"t'"; then echo "true"; fi
    echo "Here"
    ls | grep -Pi "f" <<<"t'"
    echo "Here"
}
function cat_eof_variable() {
    local variable=$(
        cat <<EOF
    this is a long variable string
    i hope it works but it seems to be
    correct
EOF
    )
    echo "$variable"
}
function cat_eof_file() {
    local variable="$(
        cat <<EOF >longFile.txt
Passing a long string to been able to been put in a new file
EOF

    )
    "

}

# set_builtin
cat_eof_file

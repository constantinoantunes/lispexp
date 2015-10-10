#!/usr/bin/env bash

MYPATH=`dirname $(readlink -f $0)`

# https://github.com/lehmannro/assert.sh
. $MYPATH/assert.sh

chmod +x $MYPATH/grep.lisp
expected_usage="Usage: grep.lisp <regex> <file>"

assert_raises "$MYPATH/grep.lisp" 1 "Call without arguments."
assert "$MYPATH/grep.lisp" "$expected_usage" "Call without arguments."
assert "$MYPATH/grep.lisp ." "$expected_usage" "Call with one argument."
assert_raises "$MYPATH/grep.lisp . non_existent.txt" 1 "Call with non-existent file name."
assert "$MYPATH/grep.lisp . $MYPATH/test.txt" "aaa\nbbb\nccc\naab\naac" "Print all lines in file."
assert "$MYPATH/grep.lisp a $MYPATH/test.txt" "aaa\naab\naac" "Print all lines in file."
assert "$MYPATH/grep.lisp ab $MYPATH/test.txt" "aab" "Print all lines in file."
assert "$MYPATH/grep.lisp c$ $MYPATH/test.txt" "ccc\naac" "Print all lines in file."
assert "$MYPATH/grep.lisp [ab]a $MYPATH/test.txt" "aaa\naab\naac" "Print all lines in file."
assert_end

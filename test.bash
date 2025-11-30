#!/bin/bash
# SPDX-FileCopyrightText: 2025 Ryusei Abe
# SPDX-License-Identifier: BSD-3-Clause

ng () {
  echo "${1}行目が違うよ"
  res=1
}

res=0

### NORMAL INPUT ###
seq 5 | ./mean > .out_normal
[ "$?" = 0 ] || ng "$LINENO"
out="$(cat .out_normal)"
if [ "${out}" = 3 ] || [ "${out}" = 3.0 ]; then :; else ng "$LINENO"; fi

### STRANGE INPUT 1: 非数値 ###
echo あ | ./mean > .out_nonnum 2>/dev/null
[ "$?" = 1 ] || ng "$LINENO"
out="$(cat .out_nonnum)"
[ -z "${out}" ] || ng "$LINENO"

### STRANGE INPUT 2: 無入力 ###
echo | ./mean > .out_empty 2>/dev/null
[ "$?" = 1 ] || ng "$LINENO"
out="$(cat .out_empty)"
[ -z "${out}" ] || ng "$LINENO"

rm -f .out_normal .out_nonnum .out_empty

[ "$res" = 0 ] && echo OK
exit "$res"


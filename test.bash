#!/bin/bash
# SPDX-FileCopyrightText: 2026 Ryusei Abe
# SPDX-License-Identifier: BSD-3-Clause

ng () {
  echo "${1}行目が違うよ"
  res=1
}

res=0

### NORMAL INPUT ###
printf "0 a\n1 b\n3 c\n" | ./tsdiff > .out_normal
[ "$?" = 0 ] || ng "$LINENO"
out="$(cat .out_normal)"
expected=$'0\t0 a\n1\t1 b\n2\t3 c'
[ "${out}" = "${expected}" ] || ng "$LINENO"

### STRANGE INPUT 1: 非数値タイムスタンプ ###
echo "a b" | ./tsdiff > .out_bad 2>/dev/null
[ "$?" = 1 ] || ng "$LINENO"
out="$(cat .out_bad)"
[ -z "${out}" ] || ng "$LINENO"

### STRANGE INPUT 2: 無入力（空） ###
echo | ./tsdiff > .out_empty 2>/dev/null
[ "$?" = 1 ] || ng "$LINENO"
out="$(cat .out_empty)"
[ -z "${out}" ] || ng "$LINENO"

rm -f .out_normal .out_bad .out_empty

[ "$res" = 0 ] && echo OK
exit "$res"

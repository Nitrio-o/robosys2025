#!/bin/bash
# SPDX-FileCopyrightText: 2025 Ryusei Abe

ng () {
  echo "${1}行目が違うよ"
  res=1
}

res=0

### NORMAL INPUT ###
out="$(seq 5 | ./plus)"
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT 1: 非数入力 ###
out="$(echo あ | ./plus)"
[ "$?" = 1 ]    || ng "$LINENO"   # 直前コマンドの終了ステータスを先に確認
[ -z "${out}" ] || ng "$LINENO"   # 出力は空を期待

### STRANGE INPUT 2: 無入力 ###
out="$(echo | ./plus)"
[ "$?" = 1 ]    || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "${res}"

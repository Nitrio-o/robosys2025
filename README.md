ロボットシステム学課題１


---
# mean コマンド
![test](https://github.com/Nitrio-o/robosys2025/actions/workflows/test.yml/badge.svg)

このコマンドは、標準入力から読み込んだ数値の平均値を出力します。  
標準入力（パイプ）から数値データを受け取り、標準出力に結果を出力するフィルタ型コマンドです。

## 使い方

```bash
seq 5 | ./mean

出力例：

3.0

---

## 必要なソフトウェア 
- Python 3.7〜3.10（テスト済）

## テスト環境 
- Ubuntu 24.04 LTS
- GitHub Actions による自動テストを実施

## ライセンスおよび著作権表示 
- 本ソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- 本パッケージのコードは、下記の講義スライド資料のものを参考にしています。
- ロボットシステム学 講義資料
 -（Creative Commons Attribution-ShareAlike 4.0 International License）by Ryuichi Ueda
 - https://github.com/ryuichiueda/my_slides/tree/master/robosys_2025

- © 2025 Ryusei Abe

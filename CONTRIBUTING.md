# コントリビュート

翻訳作業へのご協力、ありがとうございます！お願いをしたいのは以下の2つの作業です。

- 誤訳の指摘や改訳の提案
- 原文への追従

それぞれのやり方については下記ルールを参考にしてください。

## 誤訳の指摘や改訳の提案

ドキュメント誤訳を発見した場合や改訳を提案する場合は、いずれかの方法で連絡してください。

- [Issues](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/issues)
  - 誤訳や改訳はいきなり PR だと敷居が高いかも…
  - とりあえず Issues から提案してもらえると議論しやすいかもしれません
- [Twitter](https://twitter.com/kk_Ataka)
- Pull Request(後述のワークフロー参照)

## 原文への追従

この翻訳プロジェクトでは、原文[(jekyll/jekyll)](https://github.com/jekyll/jekyll)への追従を再優先しています。追従状況は [Issues](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/issues) のラベル `Original Updated` と `Original Created` で確認できます。

- [`Original Updated`](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/labels/Original%20Updated) ← **原文の変更に訳文が追従できていないファイル一覧**
- [`Original Created`](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/labels/Original%20Created) ← **翻訳作業が未着手なファイル一覧**

追従作業を行う場合は、対象のIssueを確認のうえ、以下のワークフローを参考に Pull Request を送ってください。なお、Issue 1つあたりの原文変更・追加の分量が多い場合は、その一部に対する Pull Request でも助かります。

### Pull Request のワークフロー

1. 該当のIssueで「このIssue対応します！」の宣言コメントをする
1. このプロジェクトをフォークする
1. 自分の作業環境にフォークしたプロジェクトをクローンする ( `git clone git@github.com:<username>/jekyllrb-ja.github.io.git` )
1. トピックブランチを作成し、Issueの内容にもとづき修正をコミットをする ( `git checkout -b my_awesome_feature` )
  - Issue の description で指定されてるファイルを使う
    - `Diff:` で指定されている .diff ファイル
    - `File:` で指定されている .md ファイル
  - 変更を .diff ファイルで確認し、`/docs/` 配下の該当 .md ファイルの原文・日本語訳に反映する
  - 該当ファイルの YAML front-matter の base_revision キーを .diffファイルの一行目で置き換える( base_revision キーがない場合は挿入する)
1. トピックブランチをプッシュする ( `git push origin my_awesome_feature` )
1. jekyllrb-ja/jekyllrb-ja.github.io プロジェクトの `master` ブランチに対して Pull Request を作成する
  - 該当のIssueを閉じられるような Pull Request の場合は、description のところに `fix #<issue番号>` と書いておく 例：[#192](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/pull/192)
  - コミットログや PR コメントは英語でも日本語でもどちらでも :ok: です
1. Pull Request を送る

注：.diffファイルは別途削除しますので、そのままで結構です。

## プロジェクトへの参加

このプロジェクトに参加したいという場合は、 Issues や Twitter からメンバーに連絡をお願いします :heart:

## 翻訳ルール

すごく暫定。とりあえずGentooJPを参考に…。

### 基本ルール

- 文末はです・ます調で終わる
- 可能な限り原文の内容を維持する
  - 原文に誤りがある場合(リンクミスなど)は、先に原文にPR送ってみる？
- 翻訳した文章は以下の理由により、適宜改行をはさむ **140文字程度が目安**
  - レビュー時に読みづらい
  - 一行に複数個の指摘をつけるとどこのものか分かりづらい

### 用語集

以下を参考にしてください。

[翻訳メモ · jekyllrb-ja/jekyllrb-ja.github.io Wiki](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/wiki/%E7%BF%BB%E8%A8%B3%E3%83%A1%E3%83%A2#%E7%BF%BB%E8%A8%B3%E3%81%9B%E3%81%9A%E3%81%AB%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%8B%B1%E5%8D%98%E8%AA%9E%E3%81%A7%E8%A8%98%E8%BF%B0%E3%81%99%E3%82%8B%E3%82%82%E3%81%AE)

## 翻訳 Tips

ローカルで作業をする際の Tips については以下を参考にしてください。

- [翻訳ワークフロー](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/wiki/翻訳ワークフロー)

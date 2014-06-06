jekyllrb-ja.github.io
===============

[![Build Status](https://travis-ci.org/jekyllrb-ja/jekyllrb-ja.github.io.svg?branch=master)](https://travis-ci.org/jekyllrb-ja/jekyllrb-ja.github.io)

ここは http://jekyllrb.com/ の翻訳プロジェクトです。

このプロジェクトのメインブランチは 2 つあります。

1. `master` ブランチ
  - 上記サイトの翻訳ブランチ。内容、構成は [jekyll/jekyll master ブランチの site](https://github.com/jekyll/jekyll/tree/master/site) のものになります
2. `gh-pages` ブランチ
  - `master` ブランチの内容を GitHub Pages にデプロイするためのブランチ。以下の点が `master` ブランチと異なります
    - デプロイするための設定
      - `_config.yml` に使用する Markdown の指定
      - `CNAME`
    - いくつかの独自の文章
      - `index.html` に「翻訳対象のリビジョン」と「翻訳に関する issue や PR はこのプロジェクトへ送る注釈」の追加
      - このファイル

## バグ報告

ドキュメントにケアレスミスや誤訳を発見した場合は、いずれかの方法で連絡してください。

- Pull Request
- [Issues](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/issues)
- [Twitter](https://twitter.com/kk_Ataka)

Pull Request の手順については、ワークフローを参照してください。

## ワークフロー

- このプロジェクトをフォークする
- 自分の作業環境にフォークしたプロジェクトをクローンする ( `git clone git@github.com:<username>/jekyllrb-ja.github.io.git` )
- トピックブランチを作成し、修正した内容をコミットする ( `git checkout -b my_awesome_feature` )
- 必要に応じて、コミットを意味のある塊にリベースする
- トピックブランチをプッシュする ( `git push origin my_awesome_feature` )
- jekyllrb-ja/jekyllrb-ja.github.io プロジェクトの `master` ブランチに対して Pull Request を作成する
  - Pull Request には変更内容を記述する

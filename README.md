jekyllrb-ja.github.io
=====================

[![Build Status](https://travis-ci.org/jekyllrb-ja/jekyllrb-ja.github.io.svg?branch=master)](https://travis-ci.org/jekyllrb-ja/jekyllrb-ja.github.io)
[Idobata](https://idobata.io/organizations/jekyllrb-ja/rooms/jekyll/join_request/67ba6d88-67f3-4cfb-8f9d-d7dfe45137e9)

ここは http://jekyllrb.com/ の翻訳プロジェクトです。

## ブランチ

このプロジェクトのブランチです。

1. `master` ブランチ
  - http://jekyllrb-ja.github.io のデプロイブランチです
  - 構成は基本的に [jekyll/jekyll の master ブランチの site](https://github.com/jekyll/jekyll/tree/master/site) 以下と同じものになります
  - 一部、本プロジェクト独自の追加・変更があります
    - 新規追加
      - .gitignore, .travis.yml, Gemfile, Rakefile
    - 変更
      - _config.yml, index.html

## コントリビュート

ドキュメントにケアレスミスや誤訳を発見した場合は、いずれかの方法で連絡してください。

- [Issues](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/issues)
  - 誤訳や改訳はいきなり PR だと敷居が高いかも…
  - とりあえず Issues から提案してもらえると議論しやすいかもしれません
- [Twitter](https://twitter.com/kk_Ataka)
- Pull Request (後述のワークフロー参照)

また、このプロジェクトに参加したいという場合も、 Issues や Twitter からメンバーに連絡をお願いします :heart:

## ワークフロー

- このプロジェクトをフォークする
- 自分の作業環境にフォークしたプロジェクトをクローンする ( `git clone git@github.com:<username>/jekyllrb-ja.github.io.git` )
- トピックブランチを作成し、修正した内容をコミットする ( `git checkout -b my_awesome_feature` )
- 必要に応じて、コミットを意味のある塊にリベースする
- トピックブランチをプッシュする ( `git push origin my_awesome_feature` )
- jekyllrb-ja/jekyllrb-ja.github.io プロジェクトの `translate` ブランチに対して Pull Request を作成する
  - Pull Request には変更内容を記述する
  - コミットログや PR コメントは英語でも日本語でもどちらでも :ok: です

その他、このプロジェクトの翻訳作業におけるルールや Tips などは以下の Wiki を参考にしてください。

- ルールなど
  - [翻訳メモ](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/wiki/翻訳メモ)
- Tips
  - [翻訳ワークフロー](https://github.com/jekyllrb-ja/jekyllrb-ja.github.io/wiki/翻訳ワークフロー)

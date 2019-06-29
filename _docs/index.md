---
title: クイックスタート
permalink: /docs/
redirect_from:
  - /docs/home/
  - /docs/quickstart/
  - /docs/extras/
---

<!-- ---
title: Quickstart
permalink: /docs/
redirect_from:
  - /docs/home/
  - /docs/quickstart/
  - /docs/extras/
--- -->

Jekyllはシンプルで、拡張できる、静的サイトジェネレータです。  
好きなマークアップ言語で書かれたテキストを用意すれば、Jekyllはレイアウトを合成して静的サイトを作成します。  
このプロセスを通じ、サイトのURLの見た目をどうするか、レイアウトでどのデータを表示するかなどを調整することができます。
<!-- Jekyll is a simple, extendable, static site generator. You give it text written
in your favorite markup language and it churns through layouts to create a
static website. Throughout that process you can tweak how you want the site URLs
to look, what data gets displayed in the layout, and more. -->

## 説明
<!-- ## Instructions -->

1. [Ruby開発環境]({{ "/docs/installation/" | relative_url }})をフルでインストールします
<!-- 1. Install a full [Ruby development environment](/docs/installation/) -->
2. Jekyllと[bundler]({{ "/docs/ruby-101/#bundler" | relative_url }}) [gems]({{ "/docs/ruby-101/#gems" | relative_url }})をインストールします。
<!-- 2. Install Jekyll and [bundler](/docs/ruby-101/#bundler) [gems](/docs/ruby-101/#gems) -->
```
gem install jekyll bundler
```
3. `./myblog`に新しいJkyllサイトを作ります
<!-- 3. Create a new Jekyll site at `./myblog` -->
```
jekyll new myblog
```
4. 新しいディレクトリに移動します
<!-- 4. Change into your new directory -->
```
cd myblog
```
5. サイトを構築し、ローカルサーバ上に出現させます
<!-- 5. Build the site and make it available on a local server -->
```
bundle exec jekyll serve
```
6. さあ[http://localhost:4000](http://localhost:4000){:target="_blank"}をブラウザで見てみましょう
<!-- 6. Now browse to [http://localhost:4000](http://localhost:4000){:target="_blank"} -->

上記の作業中に予期しないエラーが発生した場合は、[トラブルシューティング]({{ "/docs/troubleshooting/#configuration-problems" | relative_url }})ページや既に紹介した[必要条件]({{ "/docs/installation/#requirements" | relative_url }})ページを参照してください。development headersや他の前提条件が整っていない可能性があります。
<!-- If you encounter any unexpected errors during the above, please refer to the
[troubleshooting](/docs/troubleshooting/#configuration-problems) page or the
already-mentioned [requirements](/docs/installation/#requirements) page, as
you might be missing development headers or other prerequisites. -->

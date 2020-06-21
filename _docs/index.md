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

Jekyllは静的サイトジェネレータです。  
好きなマークアップ言語で書かれたテキストを用意すれば、Jekyllはレイアウトを合成して静的サイトを作成します。  
このプロセスを通じ、サイトのURLの見た目をどうするか、レイアウトでどのデータを表示するかなどを調整することができます。

<!-- Jekyll is a static site generator. You give it text written in your
favorite markup language and it uses layouts to create a static website. You can
tweak how you want the site URLs to look, what data gets displayed on the
site, and more. -->

## 必要条件
<!-- ## Prerequities -->

[必要条件]({{'/docs/installation/#requirements' | relative_url}})をご覧ください。

<!-- See [requirements]({{ '/docs/installation/#requirements' | relative_url }}). -->

## 説明
<!-- ## Instructions -->

1. [Ruby開発環境]({{ "/docs/installation/" | relative_url }})をフルでインストールします。
<!-- 1. Install a full [Ruby development environment](/docs/installation/). -->
2. Jekyllと[bundler]({{ "/docs/ruby-101/#bundler" | relative_url }}) [gems]({{ "/docs/ruby-101/#gems" | relative_url }})をインストールします。
<!-- 2. Install Jekyll and [bundler](/docs/ruby-101/#bundler) [gems](/docs/ruby-101/#gems). -->
```
gem install jekyll bundler
```
3. `./myblog`に新しいJkyllサイトを作ります。
<!-- 3. Create a new Jekyll site at `./myblog`. -->
```
jekyll new myblog
```
4. 新しいディレクトリに移動します。
<!-- 4. Change into your new directory. -->
```
cd myblog
```
5. サイトを構築し、ローカルサーバ上に出現させます。
<!-- 5. Build the site and make it available on a local server. -->
```
bundle exec jekyll serve
```
6. [http://localhost:4000](http://localhost:4000){:target="_blank"}をブラウザで見てみましょう。
<!-- 6. Browse to [http://localhost:4000](http://localhost:4000){:target="_blank"} -->

上記の作業中にエラーが発生した場合は、[トラブルシューティング]({{ "/docs/troubleshooting/#configuration-problems" | relative_url }})ページを見てください。また、[必要条件]({{ "/docs/installation/#requirements" | relative_url }})ページを参照してdevelopment headersや他の前提条件がインストールされていることを確認してください。
<!-- If you encounter any errors during this process, see
[troubleshooting](/docs/troubleshooting/#configuration-problems) page. Also,
make sure you've installed the development headers and other prerequisites as
mentioned on the [requirements](/docs/installation/#requirements) page. -->

注：インストール方法はオペレーティングシステムにより異なります。OSにあった[ガイド]({{'/docs/installation/#guides' | relative_url }})をご覧ください。

<!-- Note: Installation might be different depending on your operating system. See our [guides](https://jekyllrb.com/docs/installation/#guides) for OS specific instructions. -->
---
layout: docs
title: ようこそ
next_section: quickstart
permalink: /docs/home/
base_revision: 52c76b5d9333a98285db7e04ee7ae8051228ec76[refs/heads/master]
---

<!--original
---
layout: docs
title: Welcome
next_section: quickstart
permalink: /docs/home/
---
-->

このサイトは Jekyll の包括的なガイドを目指しています。
私たちはあなたのサイトの起動と動作、コンテンツの作成と管理、
サイトの動作や見た目のカスタマイズ、様々な環境へのデプロイのようなトピックをカバーし、
Jekyll 自体の将来の開発への参加について、いくつかアドバイスします。

<!--original
This site aims to be a comprehensive guide to Jekyll. We’ll cover topics such
as getting your site up and running, creating and managing your content,
customizing the way your site works and looks, deploying to various
environments, and give you some advice on participating in the future
development of Jekyll itself.
-->

## Jekyll とは一体何ですか？

<!--original
## So what is Jekyll, exactly?
-->

Jekyll はシンプルな、ブログを意識した静的サイトジェネレータです。
それは様々なフォーマットの生テキストファイルを含むテンプレートディレクトリをとり、
[Markdown](http://daringfireball.net/projects/markdown/) (または
[Textile](http://redcloth.org/textile)) や
[Liquid](https://github.com/Shopify/liquid/wiki)
コンバータを通して実行し、あなたの好みの Web サーバとサービス提供に適した、
完全かつすぐに公開できる静的 Web サイトを吐き出します。
Jekyll は GitHub Pages の背後で動いているエンジンでもあります。このことは、
プロジェクトのページ、ブログまたは Web サイトをGitHub のサーバから**無料で**ホストするために
Jekyll を使用できることを意味します。

<!--original
Jekyll is a simple, blog-aware, static site generator. It takes a template
directory containing raw text files in various formats, runs it through
[Markdown](http://daringfireball.net/projects/markdown/) (or
[Textile](http://redcloth.org/textile)) and
[Liquid](https://github.com/Shopify/liquid/wiki)
converters, and spits out a complete, ready-to-publish static website suitable
for serving with your favorite web server. Jekyll also happens to be the engine
behind [GitHub Pages](http://pages.github.com), which means you can use Jekyll
to host your project’s page, blog, or website from GitHub’s servers **for
free**.
-->

## 役に立つヒント集

<!--original
## Helpful Hints
-->

このガイドには Jekyll の利用をより簡単に、より楽しく、より危険が少なく
できる、ささやかだけれども役に立つ多くの情報があります。
以下に、注意すべき点を示します。

<!--original
Throughout this guide there are a number of small-but-handy pieces of
information that can make using Jekyll easier, more interesting, and less
hazardous. Here’s what to look out for.
-->

<div class="note">
  <h5>ProTips™ はあなたが Jekyll からより多くのことを得る助けになります</h5>
  <p>Jekyll の達人になるのを助ける tips や仕掛けがあります！</p>
</div>

<!--original
<div class="note">
  <h5>ProTips™ help you get more from Jekyll</h5>
  <p>These are tips and tricks that will help you be a Jekyll wizard!</p>
</div>
-->

<div class="note info">
  <h5>Notes は役に立つ情報です</h5>
  <p>Jekyll を理解するために時々必要となる追加情報です。</p>
</div>

<!--original
<div class="note info">
  <h5>Notes are handy pieces of information</h5>
  <p>These are for the extra tidbits sometimes necessary to understand
     Jekyll.</p>
</div>
-->

<div class="note warning">
  <h5>Warnings は、あなたがものを破壊してしまわないよう手助けします</h5>
  <p>もし、あなたが絶体絶命の事態を回避したいなら、これらのメッセージに注意してください。</p>
</div>

<!--original
<div class="note warning">
  <h5>Warnings help you not blow things up</h5>
  <p>Be aware of these messages if you wish to avoid certain death.</p>
</div>
-->

<div class="note unreleased">
  <h5>この注釈付きの機能はリリースされていません</h5>
  <p>このウェブサイトの中には、まだリリースされていない将来のバージョンのJekyllのための情報が含まれています。</p>
</div>

<!--original
<div class="note unreleased">
  <h5>You'll see this by a feature that hasn't been released</h5>
  <p>Some pieces of this website are for future versions of Jekyll that
    are not yet released.</p>
</div>
-->

もし、あなたが私たちがカバーしていない何かに途中で出くわしたり、
他の人が便利だと思う tips を知っているならば、[issueに報告(英語)]({{ site.repository }}/issues/new) をお願いします。
そうすれば、私たちはこのガイドに含めることを検討します。

<!--original
If you come across anything along the way that we haven’t covered, or if you
know of a tip you think others would find handy, please [file an
issue]({{ site.repository }}/issues/new) and we’ll see about
including it in this guide.
-->

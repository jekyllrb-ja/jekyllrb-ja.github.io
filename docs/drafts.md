---
layout: docs
title: ドラフトの働き
prev_section: posts
next_section: pages
permalink: /docs/drafts/
---

ドラフトは、日付なしの posts です。
それらはまだ作業中、またはまだ公開したくない posts です。
ドラフトを実行するために、 `_drafts` フォルダをあなたのサイトのルート
([ディレクトリ構成](/docs/structure/) セクションに記述されているように) に作成し、
最初のドラフトを作成してください。
<!--
Drafts are posts without a date. They're posts you're still working on and don't want to
publish yet. To get up and running with drafts, create a `_drafts` folder in your site's
root (as described in the [site structure](/docs/structure/) section) and create your
first draft:
-->

{% highlight text %}
|-- _drafts/
|   |-- a-draft-post.md
{% endhighlight %}

ドラフトを含めてサイトをプレビューするためには、 ただ `jekyll serve`
または `jekyll build` に `--drafts` をつけて実行します。
それぞれのドラフトファイルの日付に変更時間の値が割り当てられます。
こうして、あなたは最新の posts として現在編集しているドラフトを見ることができます。
<!--
To preview your site with drafts, simply run `jekyll serve` or `jekyll build` with
the `--drafts` switch.  Each will be assigned the value modification time of the draft file
for its date, and thus you will see currently edited drafts as the latest posts.
-->

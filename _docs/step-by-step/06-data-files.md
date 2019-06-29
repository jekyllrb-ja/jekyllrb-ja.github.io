---
layout: step
title: Dataファイル
position: 6
---
<!-- ---
layout: step
title: Data Files
position: 6
--- -->

Jekyllは`_data`ディレクトリにあるYAMLやJSON、CSVファイルからのデータのロードをサポートしています。データファイルはコースコードとコンテンツを分け、サイトの管理を簡単にするよい方法です。

<!-- Jekyll supports loading data from YAML, JSON, and CSV files located in a `_data`
directory. Data files are a great way to separate content from source code to
make the site easier to maintain. -->

このステップでは、ナビゲーションの内容をデータファイルに保存して、ナビゲーションのインクルードで繰り返して使用します。

<!-- In this step you'll store the contents of the navigation in a data file
and then iterate over it in the navigation include. -->

## データファイルの使い方
<!-- ## Data file usage -->

[YAML](http://yaml.org/){:target="_blank"}はRubyエコシステムと共通のフォーマットです。ナビゲーションの各名前とリンクのアイテムを配列で保存して使用します。

<!-- [YAML](http://yaml.org/) is a format that's common in the Ruby ecosystem. You'll
use it to store an array of navigation items each with a name and link. -->

以下の内容のナビゲーション用ファイルを`_data/navigation.yml`として作成します。

<!-- Create a data file for the navigation at `_data/navigation.yml` with the
following: -->

```yaml
- name: Home
  link: /
- name: About
  link: /about.html
```

Jekyllはこのデータファイルを`site.data.navigation`で利用できるようにします。`_includes/navigation.html`の各リンクの出力の代わりに、データファイルの反復処理でできます。

<!-- Jekyll makes this data file available to you at `site.data.navigation`. Instead
of outputting each link in `_includes/navigation.html`, now you can iterate over
the data file instead: -->

{% raw %}
```liquid
<nav>
  {% for item in site.data.navigation %}
    <a href="{{ item.link }}" {% if page.url == item.link %}style="color: red;"{% endif %}>
      {{ item.name }}
    </a>
  {% endfor %}
</nav>
```
{% endraw %}

出力結果は同じです。違いは、新しいナビゲーションを追加やHTML構成の変更が簡単になることです。

<!-- The output will be exactly the same. The difference is you’ve made it easier to
add new navigation items and change the HTML structure. -->

CSS、JS、画像のないサイトは何がいいのでしょう？ JekyllでAssetsを処理する方法を見てみましょう。

<!-- What good is a site without CSS, JS and images? Let’s look at how to handle
assets in Jekyll. -->

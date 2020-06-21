---
title: 変数
permalink: /docs/variables/
---
<!-- ---
title: Variables
permalink: /docs/variables/
--- -->

Jekyllは、サイトを横断して処理するファイルを探します。[front matter]({{ "/docs/front-matter/" | | relative_url }})があるファイルは全て処理の対象になります。これらのファイルについて、Jekyllは[Liquid]({{ "/docs/liquid/" | | relative_url }})から利用可能な様々なデータを作成します。以下は利用できるデータのリファレンスです。

<!-- Jekyll traverses your site looking for files to process. Any files with
[front matter](/docs/front-matter/) are subject to processing. For each of these
files, Jekyll makes a variety of data available via [Liquid](/docs/liquid/).
The following is a reference of the available data. -->

## グローバル変数
<!-- ## Global Variables -->

{% include docs_variables_table.html scope=site.data.jekyll_variables.global %}

## サイト変数
<!-- ## Site Variables -->

{% include docs_variables_table.html scope=site.data.jekyll_variables.site %}

## ページ変数
<!-- ## Page Variables -->

{% include docs_variables_table.html scope=site.data.jekyll_variables.page %}

<div class="note">
  <h5>ProTip™: カスタムFront Matterの使用</h5>
  <!-- <h5>ProTip™: Use Custom Front Matter</h5> -->
  <p>
    カスタムfront matterは<code>page</code>で使用可能です。例えば、ページのfront matterに<code>custom_css: true</code>を記述すると、<code>page.custom_css</code>として使用できます。
  </p>
  <!-- <p>
    Any custom front matter that you specify will be available under
    <code>page</code>. For example, if you specify <code>custom_css: true</code>
    in a page’s front matter, that value will be available as <code>page.custom_css</code>.
  </p> -->
  <p>
    レイアウトのfront matterは<code>layout</code>でアクセスできます。例えば、レイアウトのfront matterに<code>class: full_page</code>を記述した場合、そのレイアウトや親のレイアウトで<code>layout.class</code>で使用できます。
  </p>
  <!-- <p>
    If you specify front matter in a layout, access that via <code>layout</code>.
    For example, if you specify <code>class: full_page</code> in a layout’s front matter,
    that value will be available as <code>layout.class</code> in the layout and its parents.
  </p> -->
</div>

## Paginator（ページ分け）
<!-- ## Paginator -->

{% include docs_variables_table.html scope=site.data.jekyll_variables.paginator %}

<div class="note info">
  <h5>Paginator変数の使用範囲</h5>
  <!-- <h5>Paginator variable availability</h5> -->
  <p>
    indexファイルでのみ使用可能ですが、<code>/blog/index.html</code>の様なサブディレクトリ中のindexファイルでも使用できます。
  </p>
  <!-- <p>
    These are only available in index files, however they can be located in a subdirectory,
    such as <code>/blog/index.html</code>.
  </p> -->
</div>

---
layout: docs
title: パーマリンク
prev_section: templates
next_section: pagination
permalink: /docs/permalinks/
---

<!--original
---
layout: docs
title: Permalinks
prev_section: templates
next_section: pagination
permalink: /docs/permalinks/
---
-->

Jekyll はサイトの URL を構築するための柔軟な方法をサポートしています。
あなたは[設定項目](../configuration/)か、Post ごとの
[YAML Front Matter](../frontmatter/) 内でサイトのパーマリンクを指定することができます。
あなたはリンクを作成するか、あなた自身のリンクを作成するために
組み込まれたスタイルのひとつを自由に選択します。
デフォルトのスタイルは `date` です。

<!--original
Jekyll supports a flexible way to build your site’s URLs. You can specify the
permalinks for your site through the [Configuration](../configuration/) or in the
[YAML Front Matter](../frontmatter/) for each post. You’re free to choose one of
the built-in styles to create your links or craft your own. The default style is
`date`.
-->

パーマリンクは動的要素がコロン接頭辞で表現された
テンプレートの URL を作成することによって構築されます。
例えば、デフォルトの `date` パーマリンクは
`/:categories/:year/:month/:day/:title.html` として定義されています。

<!--original
Permalinks are constructed by creating a template URL where dynamic elements are
represented by colon-prefixed keywords. For example, the default `date`
permalink is defined as `/:categories/:year/:month/:day/:title.html`.
-->

## テンプレート変数

<!--original
## Template variables
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>説明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>year</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる年</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>month</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる月</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_month</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる0埋めしない月</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>day</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる日</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_day</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる前ゼロなしの日</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>title</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できるタイトル</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>
          この Post に対して指定されたカテゴリ。
          Jekyll は自動的に URL 中のダブルスラッシュを解析し、
          もしそのカテゴリーが存在しない場合は、これを無視します。
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>year</code></p>
      </td>
      <td>
        <p>Year from the Post’s filename</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>month</code></p>
      </td>
      <td>
        <p>Month from the Post’s filename</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_month</code></p>
      </td>
      <td>
        <p>Month from the Post’s filename without leading zeros.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>day</code></p>
      </td>
      <td>
        <p>Day from the Post’s filename</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_day</code></p>
      </td>
      <td>
        <p>Day from the Post’s filename without leading zeros.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>title</code></p>
      </td>
      <td>
        <p>Title from the Post’s filename</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>
          The specified categories for this Post. Jekyll automatically parses
          out double slashes in the URLs, so if no categories are present, it
          will ignore this.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

## 組み込みパーマリンクスタイル

<!--original
## Built-in permalink styles
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>パーマリンクスタイル</th>
      <th>URL テンプレート</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:month/:day/:title.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>pretty</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:month/:day/:title/</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>none</code></p>
      </td>
      <td>
        <p><code>/:categories/:title.html</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Permalink Style</th>
      <th>URL Template</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:month/:day/:title.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>pretty</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:month/:day/:title/</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>none</code></p>
      </td>
      <td>
        <p><code>/:categories/:title.html</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

## パーマリンクスタイルの例

<!--original
## Permalink style examples
-->

Post 名 `/2009-04-29-slap-chop.textile` が与えられた時:

<!--original
Given a post named: `/2009-04-29-slap-chop.textile`
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>パーマリンク設定</th>
      <th>パーマリンク URL の結果</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p>指定なし、または <code>permalink: date</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: pretty</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: /:month-:day-:year/:title.html</code></p>
      </td>
      <td>
        <p><code>/04-29-2009/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: /blog/:year/:month/:day/:title</code></p>
      </td>
      <td>
        <p><code>/blog/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Permalink Setting</th>
      <th>Resulting Permalink URL</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p>None specified, or <code>permalink: date</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: pretty</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: /:month-:day-:year/:title.html</code></p>
      </td>
      <td>
        <p><code>/04-29-2009/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink: /blog/:year/:month/:day/:title</code></p>
      </td>
      <td>
        <p><code>/blog/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

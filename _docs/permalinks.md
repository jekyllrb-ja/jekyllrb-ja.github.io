---
layout: docs
title: パーマリンク
prev_section: templates
next_section: pagination
permalink: /docs/permalinks/
base_revision: 52c76b5d9333a98285db7e04ee7ae8051228ec76[refs/heads/master]
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
        <p><code>short_year</code></p>
      </td>
      <td>
        <p>Post のファイル名から取得できる年の下2桁</p>
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
        <p><code>short_year</code></p>
      </td>
      <td>
        <p>Year from the Post’s filename without the century.</p>
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

**注：** 下記で説明する内容はpostsのみに適用され、pages、collections、静的ファイルには
適用されません。たとえば `pretty` は、そのページがHTMLであれば、パーマリンクを
`/:path/:basename:output_ext` から `/:page/:basename/` に変更します。
つまりページのパーマリンクを「きれいにする(prettify)」わけです。
`date`、`none` および、その他全てのカスタム値はpagesには適用されません。
静的ファイルにはパーマリンクスタイルは全く適用されません。
collectionsはパーマリンクを指定する独自の手段があります。
上述の内容はかなり分かりにくいのですが、この件に関するさらなる背景は
[Issue #2691](https://github.com/jekyll/jekyll/issues/2691) をご覧ください。
この問題を解決しようという勇気ある方は、PRを送ってください！

<!--original
**Note:** these may only apply to posts, not to pages, collections or
static files. For example, `pretty` changes page permalinks from
`/:path/:basename:output_ext` to `/:page/:basename/` if the page is HTML,
thus "prettyifying" the page permalink. The `date`, `none`, and all custom
values do not apply to pages. No permalink style applies to static files,
and collections have their own means of specifying permalinks. It's all
rather confusing but check out [Issue #2691](https://github.com/jekyll/jekyll/issues/2691)
for more background on the subject, and submit a PR if you're adventurous
enough to fix it all!
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
      <th>URLテンプレート</th>
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
        <p><code>pretty</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>/:month-:day-:year/:title.html</code></p>
      </td>
      <td>
        <p><code>/04-29-2009/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>/blog/:year/:month/:day/:title/</code></p>
      </td>
      <td>
        <p><code>/blog/2009/04/29/slap-chop/</code></p>
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
      <th>URL Template</th>
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
        <p><code>pretty</code></p>
      </td>
      <td>
        <p><code>/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>/:month-:day-:year/:title.html</code></p>
      </td>
      <td>
        <p><code>/04-29-2009/slap-chop.html</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>/blog/:year/:month/:day/:title</code></p>
      </td>
      <td>
        <p><code>/blog/2009/04/29/slap-chop/index.html</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

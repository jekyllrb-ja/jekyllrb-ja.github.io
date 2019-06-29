---
title: パーマリンク
permalink: /docs/permalinks/
---
<!-- ---
title: Permalinks
permalink: /docs/permalinks/
--- -->

パーマリンクは、ページやポスト、コレクションを出力するパスです。ソースコードのディレクトリ構成と出力するディレクトリ構成を変えることも可能です。

<!-- Permalinks are the output path for your pages, posts, or collections. They
allow you to structure the directories of your source code different from the
directories in your output. -->

## Front Matter

パーマリンクを設定するシンプルな方法は、front matterを使用することです。front matterの`permalink`変数に、好きな出力パスを設定します。

<!-- The simplest way to set a permalink is using front matter. You set the
`permalink` variable in front matter to the output path you'd like. -->

例えば、`/my_pages/about-me.html`のページの出力するURLを`/about/`にしたい場合は、ページのfront matterを次のようにセットします。

<!-- For example, you might have a page on your site located at
`/my_pages/about-me.html` and you want the output url to be `/about/`. In
front matter of the page you would set: -->

```
---
permalink: /about/
---
```

## グローバル
<!-- ## Global -->

パーマリンクを全てのページのfront matterで設定するのは大変です。幸運なことに、Jekyllでは`_config.yml`でサイト全体のパーマリンクの構成を設定できます。

<!-- Setting a permalink in front matter for every page on your site is no fun.
Luckily, Jekyll lets you set the permalink structure globally in your `_config.yml`. -->

全体的なパーマリンクを設定するには、`_config.yml`で`permalink`変数を使用します。望む出力になるように置換用変数（placeholders）を使用できます。例えば：

<!-- To set a global permalink, you use the `permalink` variable in `_config.yml`.
You can use placeholders to your desired output. For example: -->

```yaml
permalink: /:categories/:year/:month/:day/:title:output_ext
```

ページやコレクションには時刻やカテゴリが無いことに注意してください。これらのパーマリンクスタイルは出力時には無視されます。

<!-- Note that pages and collections don't have time or categories, these aspects of
the permalink style are ignored for the output. -->

パーマリンクスタイルの例は、ポストなら`/:categories/:year/:month/:day/:title:output_ext`、ページやコレクションなら`/:title.html`です。

<!-- For example, a permalink style of
`/:categories/:year/:month/:day/:title:output_ext` for posts becomes
`/:title.html` for pages and collections. -->

### 置換用変数（Placeholders）
<!-- ### Placeholders -->

使用できる全置換用変数（Placeholders）のリストです。

<!-- Here's the full list of placeholders available: -->


<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>説明</th>
      <!-- <th>Variable</th>
      <th>Description</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>year</code></p>
      </td>
      <td>
        <p>
          ポストのファイル名から取得した4桁の年。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Year from the post’s filename with four digits.
          May be overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>short_year</code></p>
      </td>
      <td>
        <p>
          ポストのファイル名から取得した西暦の下2桁。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Year from the post’s filename without the century. (00..99)
          May be overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>month</code></p>
      </td>
      <td>
        <p>
          ポストのファイル名から取得した月（2桁）。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Month from the post’s filename. (01..12)
          May be overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_month</code></p>
      </td>
      <td>
        <p>
          ポストのファイル名から取得した月（10 の位の0なし）。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Month without leading zeros from the post’s filename. May be
          overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>short_month</code></p>
      </td>
      <td>
        <p>3文字表記の月。“Jan”など。</p>
        <!-- <p>Three-letter month abbreviation, e.g. “Jan”.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>long_month</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p>月のフルネーム。“January”など。</p>
        <!-- <p>Full month name, e.g. “January”.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>day</code></p>
      </td>
      <td>
        <p>
        ポストのファイル名から取得した日（2桁）。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Day of the month from the post’s filename. (01..31)
          May be overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>i_day</code></p>
      </td>
      <td>
        <p>
        ポストのファイル名から取得した日（10 の位の0なし）。ドキュメントのfront matterの<code>date</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
          Day of the month without leading zeros from the post’s filename.
          May be overridden via the document’s <code>date</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>y_day</code></p>
      </td>
      <td>
        <p>ポストのファイル名から取得した、その年の何日目か。 (001..366)</p>
        <!-- <p>Ordinal day of the year from the post’s filename, with leading zeros. (001..366)</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>w_year</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p>週の所属する年。1月の始めと12月の終わりは月の所属する年と異なる場合があります。</p>
        <!-- <p>Week year which may differ from the month year for up to three days at the start of January and end of December</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>week</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p>その年の何週目か。ただし、1月の日が大部分を占める週から始まります。 (01..53)</p>
        <!-- <p>Week number of the current year, starting with the first week having a majority of its days in January. (01..53)</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>w_day</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p月曜日を1とする曜日。(1..7)</p>
        <!-- <p>Day of the week, starting with Monday. (1..7)</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>short_day</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p>3文字表記の曜日。“Sun”など</p>
        <!-- <p>Three-letter weekday abbreviation, e.g. “Sun”.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>long_day</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p>曜日名。“Sunday”など。</p>
        <!-- <p>Weekday name, e.g. “Sunday”.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>hour</code></p>
      </td>
      <td>
        <p>
          ポストのfront matterの<code>date</code>から取得した24時間表記の時。(00..23)
        </p>
        <!-- <p>
          Hour of the day, 24-hour clock, zero-padded from the post’s
          <code>date</code> front matter. (00..23)
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>minute</code></p>
      </td>
      <td>
        <p>
          ポストのfront matterの<code>date</code>から取得した分。(00..59)
        </p>
        <!-- <p>
          Minute of the hour from the post’s <code>date</code> front matter. (00..59)
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>second</code></p>
      </td>
      <td>
        <p>
          ポストのfront matterの<code>date</code>から取得した秒。(00..59)
        </p>
        <!-- <p>
          Second of the minute from the post’s <code>date</code> front matter. (00..59)
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>title</code></p>
      </td>
      <td>
        <p>
          ドキュメントのファイル名から取得したタイトル。front matterの<code>slug</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
            Title from the document’s filename. May be overridden via
            the document’s <code>slug</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>slug</code></p>
      </td>
      <td>
        <p>
            ドキュメントのファイル名からのタイトルをスラグ化（数字と文字を除くすべての文字はハイフンに置き換えらる）したもの。front matterの<code>slug</code>で上書きされる可能性があります。
        </p>
        <!-- <p>
            Slugified title from the document’s filename (any character
            except numbers and letters is replaced as hyphen). May be
            overridden via the document’s <code>slug</code> front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>
          ポストのカテゴリ。ポストに複数のカテゴリがある場合、Jekyllは<code>/category1/category2</code>の様に階層化します。また、JekyllはURL内の二重スラッシュを自動的に修復します。そのため、カテゴリが存在しない場合、無視されます。
        </p>
        <!-- <p>
          The specified categories for this post. If a post has multiple
          categories, Jekyll will create a hierarchy (e.g. <code>/category1/category2</code>).
          Also Jekyll automatically parses out double slashes in the URLs,
          so if no categories are present, it will ignore this.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

### 組み込みフォーマット
<!-- ### Built-in formats -->

Jekyllはポストに、以下の便利な組み込みスタイルを提供します。

<!-- For posts, Jekyll also provides the following built-in styles for convenience: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>パーマリンクスタイル</th>
      <th>URLテンプレート</th>
      <!-- <th>Permalink Style</th>
      <th>URL Template</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:month/:day/:title:output_ext</code></p>
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
        <p><code>ordinal</code></p>
      </td>
      <td>
        <p><code>/:categories/:year/:y_day/:title:output_ext</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>weekdate</code></p>
        <small>{% include docs_version_badge.html version="4.0.0" %}</small>
      </td>
      <td>
        <p><code>/:categories/:year/W:week/:short_day/:title:output_ext</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>none</code></p>
      </td>
      <td>
        <p><code>/:categories/:title:output_ext</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

`permalink: /:categories/:year/:month/:day/:title/`と書く代わりに、`permalink: pretty`とすることができます。

<!-- Rather than typing `permalink: /:categories/:year/:month/:day/:title/`, you can just type `permalink: pretty`. -->

<div class="note info">
<h5>front matterでのパーマリンクの指定</h5>
<!-- <h5>Specifying permalinks through the front matter</h5> -->
<p>組み込みパーマリンクスタイルはfront matterでは認識されません。ですので、 <code>permalink: pretty</code>は機能しません。</p>
<!-- <p>Built-in permalink styles are not recognized in front matter. As a result, <code>permalink: pretty</code> will not work.</p> -->
</div>

### コレクション
<!-- ### Collections -->

コレクションは、`_config.yml`のコレクションの設定でグローバルパーマリンクを上書きできるオプションがあります。

<!-- For collections, you have the option to override the global permalink in the
collection configuration in `_config.yml`: -->

```yaml
collections:
  my_collection:
    output: true
    permalink: /:collection/:name
```

コレクションは以下の置換用変数を使用できます。

<!-- Collections have the following placeholders available: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>説明</th>
      <!-- <th>Variable</th>
      <th>Description</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>:collection</code></p>
      </td>
      <td>
        <p>どのコレクションかのラベル。</p>
        <!-- <p>Label of the containing collection.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:path</code></p>
      </td>
      <td>
        <p>コレクションのディレクトリからの相対パス。</p>
        <!-- <p>Path to the document relative to the collection's directory.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:name</code></p>
      </td>
      <td>
        <p>ドキュメントのベースファイル名。空白及びアルファベット以外の文字はハイフンに置き換えられます。</p>
        <!-- <p>The document's base filename, with every sequence of spaces
        and non-alphanumeric characters replaced by a hyphen.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:title</code></p>
      </td>
      <td>
        <p>
          <code>:title</code>テンプレート変数は<a href="{{ "/docs/front-matter/" | | relative_url }}">front matter</a>に<code>slug</code>がある場合はその値を取得します。無い場合、<code>:title</code>と<code>:name</code>は同じ値です。ファイル名から作成されたスラグとも言えます。
        </p>
        <!-- <p>
          The <code>:title</code> template variable will take the
          <code>slug</code> <a href="/docs/front-matter/">front matter</a>
          variable value if any is present in the document; if none is
          defined then <code>:title</code> will be equivalent to
          <code>:name</code>, aka the slug generated from the filename.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:output_ext</code></p>
      </td>
      <td>
        <p>出力ファイルの拡張子。（デフォルトで含まれており、通常は不要です。）</p>
        <!-- <p>Extension of the output file. (Included by default and usually unnecessary.)</p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

---
title: Front Matter
permalink: /docs/front-matter/
redirect_from: /docs/frontmatter/index.html
---

[YAML](https://yaml.org/ target="_blank") front matterブロックを含むファイルは全て、Jekyllに特別なファイルとして処理されます。front matterはファイルの最初で3つのダッシュの行に挟まれた有効なYAMLでなければなりません。次は基本的な例です。

<!-- Any file that contains a [YAML](http://yaml.org/) front matter block will be
processed by Jekyll as a special file. The front matter must be the first thing
in the file and must take the form of valid YAML set between triple-dashed
lines. Here is a basic example: -->

```yaml
---
layout: post
title: Blogging Like a Hacker
---
```

3つのダッシュの行の間で、定義済みの変数（下記を参照してください）を設定したり、カスタム変数を作ることができます。これらの変数は、そのファイルやそのページやポストのレイアウトで、Liquidタグを使ってアクセスできるようになります。

<!-- Between these triple-dashed lines, you can set predefined variables (see below
for a reference) or even create custom ones of your own. These variables will
then be available to you to access using Liquid tags both further down in the
file and also in any layouts or includes that the page or post in question
relies on. -->

<div class="note warning">
  <h5>UTF-8エンコーディング時の警告</h5>
  <!-- <h5>UTF-8 Character Encoding Warning</h5> -->
  <p>
    UTF-8エンコーディングを使用している場合、<code>BOM</code>をヘッダに含めないでください。Jekyllに非常に悪いことが起こります。特に<a href="{{ "/docs/installation/windows/" | relative_url }}">Jekyll on Windows</a>を使用している場合に影響があります。
  </p>
  <!-- <p>
    If you use UTF-8 encoding, make sure that no <code>BOM</code> header
    characters exist in your files or very, very bad things will happen to
    Jekyll. This is especially relevant if you’re running
    <a href="/docs/installation/windows/">Jekyll on Windows</a>.
  </p> -->
</div>

<div class="note">
  <h5>Front Matter変数はオプションです</h5>
  <!-- <h5>Front Matter Variables Are Optional</h5> -->
  <p>
    <a href="{{ "/docs/variables/" | relative_url }}">Liquidタグや変数</a>は使いたいけれどfront matterでは何も必要ない場合、取り除いて空にしましょう。3つのダッシュの行が2行続いていれば、Jekyllはそのファイルで作業をします。（これは、CSSやRSSフィードのファイルで便利です！）
  </p>
  <!-- <p>
    If you want to use <a href="/docs/variables/">Liquid tags and variables</a>
    but don’t need anything in your front matter, just leave it empty! The set
    of triple-dashed lines with nothing in between will still get Jekyll to
    process your file. (This is useful for things like CSS and RSS feeds!)
  </p> -->
</div>

## 定義済みグローバル変数
<!-- ## Predefined Global Variables -->

ページやポストのfront matterで設定できる、定義済みのグローバル変数です。

<!-- There are a number of predefined global variables that you can set in the
front matter of a page or post. -->

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
        <p><code>layout</code></p>
      </td>
      <td>
        <p>

          設定したらそのレイアウトファイルを使用します。レイアウトファイルの名前を拡張子無しで使います。レイアウトファイルは、<code>_layouts</code>ディレクトリになければなりません。

        </p>
        <!-- <p>

          If set, this specifies the layout file to use. Use the layout file
          name without the file extension. Layout files must be placed in the
          <code>_layouts</code> directory.

        </p> -->
        <ul>
          <li>
            <code>null</code>を使用するとレイアウトファイルを使用しません。ファイルがpost/documentで<a href="{{ "/docs/configuration/front-matter-defaults/" | relative_url }}">
            front matterのデフォルト</a>が定義されている場合、上書きします。
          </li>
          <!-- <li>
            Using <code>null</code> will produce a file without using a layout
            file. This is overridden if the file is a post/document and has a
            layout defined in the <a href="/docs/configuration/front-matter-defaults/">
            front matter defaults</a>.
          </li> -->
          <li>
            バージョン3.5.0から始めた場合、post/documentで<code>none</code>を使用すると、front matterのデフォルトに関係なく、レイアウトファイルを使用しません。pageで<code>none</code>を使用すると、Jekyllは"none"というレイアウトを使用しようとします。
          </li>
          <!-- <li>
            Starting from version 3.5.0, using <code>none</code> in a post/document will
            produce a file without using a layout file regardless of front matter defaults.
            Using <code>none</code> in a page will cause Jekyll to attempt to
            use a layout named "none".
          </li> -->
        </ul>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink</code></p>
      </td>
      <td>
        <p>

          サイト全体のURLのスタイル（デフォルトは<code>/year/month/day/title.html</code>）と異なるURLで作成したい場合この変数を設定します。最終的なURLとして使用されます。
        </p>
        <!-- <p>

          If you need your processed blog post URLs to be something other than
          the site-wide style (default <code>/year/month/day/title.html</code>), then you can set
          this variable and it will be used as the final URL.

        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>
          サイトを生成するときに、特定のポストを表示したくない場合にfalseを設定します。
        </p>
        <!-- <p>
          Set to false if you don’t want a specific post to show up when the
          site is generated.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note">
  <h5>非公開としてマークされたポストをレンダリングする</h5>
  <!-- <h5>Render Posts Marked As Unpublished</h5> -->
  <p>
    非公開のページをプレビューするには、<code>jekyll serve</code>や<code>jekyll build</code>を実行するときに<code>--unpublished</code>スイッチを使います。 Jekyllには、ブログポスト専用の便利な<a href="{{ "/docs/posts/#drafts" | relative_url }}">ドラフト</a>機能もあります。
  </p>
  <!-- <p>
    To preview unpublished pages, run `jekyll serve` or `jekyll build`
    with the `--unpublished` switch. Jekyll also has a handy <a href="/docs/posts/#drafts">drafts</a>
    feature tailored specifically for blog posts.
  </p> -->
</div>

## カスタム変数
<!-- ## Custom Variables -->

Liquidでアクセスできる、あなた自身のfront matter変数を設定することもできます。例えば、`food`という変数を使用したい場合、ページには次のように記載します。

<!-- You can also set your own front matter variables you can access in Liquid. For
instance, if you set a variable called `food`, you can use that in your page: -->

{% raw %}
```liquid
---
food: Pizza
---

<h1>{{ page.food }}</h1>
```
{% endraw %}

## ポストの定義済み変数
<!-- ## Predefined Variables for Posts -->

ポストのfront matterですぐに使用できます。

<!-- These are available out-of-the-box to be used in the front matter for a post. -->

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
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          ポストのファイル名からの日付を上書きします。これはポストを正しくソートするために使用できます。日付は特定のフォーマット<code>YYYY-MM-DD HH:MM:SS +/-TTTT</code>で、時刻とタイムゾーンはオプションです。
        </p>
        <!-- <p>
          A date here overrides the date from the name of the post. This can be
          used to ensure correct sorting of posts. A date is specified in the
          format <code>YYYY-MM-DD HH:MM:SS +/-TTTT</code>; hours, minutes, seconds, and timezone offset
          are optional.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>

          ポストをフォルダ分けする代わりに、1つ以上のカテゴリを設定できます。サイトにポストを生成するときに、これらのカテゴリが設定されているように振る舞います。Categories（複数キー）では<a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components" target="_blank">YAML list</a>やスペース区切りの文字列で指定できます。

        </p>
        <!-- <p>

          Instead of placing posts inside of folders, you can specify one or
          more categories that the post belongs to. When the site is generated
          the post will act as though it had been set with these categories
          normally. Categories (plural key) can be specified as a <a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components">YAML list</a> or a
          space-separated string.

        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>

          カテゴリとよく似ており、1つ以上のタグをポストに追加できます。カテゴリと同様tagsも<a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components" target="_blank">YAML list</a>やスペース区切りの文字列で指定できます。

        </p>
        <!-- <p>

          Similar to categories, one or multiple tags can be added to a post.
          Also like categories, tags can be specified as a <a
          href="https://en.wikipedia.org/wiki/YAML#Basic_components">YAML list</a> or a
          space-separated string.

        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note">
  <h5>繰り返さないで</h5>
  <!-- <h5>Don't repeat yourself</h5> -->
  <p>
    よく使用するfront matter変数を、何度も何度も繰り返し記述したくない場合は、<a href="{{ "/docs/configuration/front-matter-defaults/" | relative_url }}" title="Front Matter defaults">デフォルト</a>を変更し必要に応じて上書きしてください。これは定義済み変数でもカスタム変数でも行えます。
  </p>
  <!-- <p>
    If you don't want to repeat your frequently used front matter variables
    over and over, define <a href="/docs/configuration/front-matter-defaults/" title="Front Matter defaults">defaults</a>
    for them and only override them where necessary (or not at all). This works
    both for predefined and custom variables.
  </p> -->
</div>
